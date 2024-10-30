import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import argon2 from 'argon2';
import pool from '@/utils/db/pool';

export async function POST(req: Request) {
    const { username, email, password, first_name, last_name, contact, store_id } = await req.json();

    console.log("store_id: ", store_id);

    try {
        if (!pool) {
            throw new Error('Database connection pool is not initialized.');
        }
        // Step 1: Identify if the username exists in any table
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
            `CALL RegisterAstDriver(?, ?, ?, ?, ?, ?, ?)`, // Adjust the stored procedure to accept store_id
            [username, hashedPassword, first_name, last_name, contact, email, store_id] // Pass store_id here
        );

        // Return the user data along with success message
        return NextResponse.json({
            message: 'Driver registered successfully',
            user: {
                id: 1,
            }
        }, { status: 201 });

    } catch (error) {
        const errorMessage = (error as Error).message;
        console.error(error);
        return NextResponse.json({ error: 'Registration failed', details: errorMessage }, { status: 500 });
    }
}
