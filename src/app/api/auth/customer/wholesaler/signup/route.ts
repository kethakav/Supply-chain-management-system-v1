import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import argon2 from 'argon2';
import pool from '@/utils/db/pool';

export async function POST(req: Request) {
    const { username, customer_email, password, customer_first_name, customer_last_name, customer_contact, customer_address } = await req.json();

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

        // Step 2: Proceed with user registration using the stored procedure
        const [result] = await pool.query(
            `CALL RegisterWholesalerCustomer(?, ?, ?, ?, ?, ?, ?)`,
            [username, hashedPassword, customer_first_name, customer_last_name, customer_contact, customer_email, customer_address]
        );

        // Step 3: Fetch the newly created user data
        const [userData] = await pool.query<mysql.RowDataPacket[]>(
            `SELECT 
                customer_id,
                user_name,
                customer_email,
                customer_first_name,
                customer_last_name,
                customer_contact,
                customer_address,
                customer_type
             FROM Customer 
             WHERE user_name = ?`,
            [username]
        );

        if (!userData[0]) {
            throw new Error('User data not found after registration');
        }
        // return NextResponse.json({
        //     id: userInfo.id,
        //     name: `${userInfo.firstName} ${userInfo.lastName}`,
        //     email: userInfo.email,
        //     type: userInfo.type,
        // });

        // Return the user data along with a success message
        return NextResponse.json({
            message: 'Retailer registered successfully',
            user: {
                id: userData[0].customer_id,
                name: `${userData[0].customer_first_name} ${userData[0].customer_last_name}`,
                email: userData[0].customer_email,
                type: 'customer'
            }
        }, { status: 201 });

    } catch (error) {
        const errorMessage = (error as Error).message;
        console.error(error);
        return NextResponse.json({ error: 'Registration failed', details: errorMessage }, { status: 500 });
    }
}
