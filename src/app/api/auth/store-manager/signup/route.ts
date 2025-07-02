import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import argon2 from 'argon2';
import pool from '@/utils/db/pool';


export async function POST(req: Request) {
    const { username, email, password, first_name, last_name, contact, store_id } = await req.json();

    console.log("store_id: ", store_id);

    try {
        // Step 1: Identify if the username exists in any table
        if (!pool) {
            throw new Error('Database connection pool is not initialized.');
        }
        const [rows]: any = await pool.query(
            `SELECT identify_table(?) AS table_name`,
            [username]
        );
        const table = rows[0]?.table_name;

        // Log the identified table (for debugging purposes)
        console.log(`Identified table for username ${username}: ${table}`);

        if (table && table !== 'Unknown') {
            // If the username already exists in one of the tables, return a conflict error
            return NextResponse.json({ error: 'Username already exists in another table' }, { status: 409 }); // 409 Conflict
        }

        // Step 2: Hash the password using argon2
        const hashedPassword = await argon2.hash(password);

        // Step 3: Proceed with user registration using the stored procedure with the hashed password and store_id
        const [result] = await pool.query(
            `CALL RegisterStoreManager(?, ?, ?, ?, ?, ?, ?)`, // Adjust the stored procedure to accept store_id
            [username, hashedPassword, first_name, last_name, contact, email, store_id] // Pass store_id here
        );

        // Step 4: Fetch the newly created user data
        const [userData] = await pool.query<mysql.RowDataPacket[]>(`
            SELECT 
                manager_id,
                user_name,
                manager_email,
                manager_first_name,
                manager_last_name,
                manager_contact,
                store_id
             FROM manager 
             WHERE user_name = ?`,
            [username]
        );

        if (!userData[0]) {
            throw new Error('User data not found after registration');
        }

        // Return the user data along with success message
        return NextResponse.json({
            message: 'Store manager registered successfully',
            user: {
                id: userData[0].manager_id, // Corrected to use manager_id
                name: `${userData[0].manager_first_name} ${userData[0].manager_last_name}`,
                email: userData[0].manager_email,
                type: 'storeManager',
                store_id: userData[0].store_id // Include store_id in the response if needed
            }
        }, { status: 201 });

    } catch (error) {
        const errorMessage = (error as Error).message;
        console.error(error);
        return NextResponse.json({ error: 'Registration failed', details: errorMessage }, { status: 500 });
    }
}
