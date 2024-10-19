import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';

// Create a MySQL connection pool
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'scms_test'
});

export async function POST(req: Request) {
    const { username, customer_email, password, customer_first_name, customer_last_name, customer_contact, customer_address } = await req.json();

    try {
        // Step 1: Check if the username already exists
        const [existingUser] = await pool.query<mysql.RowDataPacket[]>(
            `SELECT COUNT(*) as count FROM Customer WHERE user_name = ?`,
            [username]
        );

        if (existingUser[0].count > 0) {
            return NextResponse.json({ error: 'Username already exists' }, { status: 409 }); // 409 Conflict
        }

        // Step 2: Proceed with user registration using the stored procedure
        const [result] = await pool.query(
            `CALL RegisterRetailerCustomer(?, ?, ?, ?, ?, ?, ?)`,
            [username, password, customer_first_name, customer_last_name, customer_contact, customer_email, customer_address]
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

        // Return the user data along with success message
        return NextResponse.json({
            message: 'Retailer registered successfully',
            user: {
                ...userData[0],
                type: 'retailer'
            }
        }, { status: 201 });

    } catch (error) {
        const errorMessage = (error as Error).message;
        console.error(error);
        return NextResponse.json({ error: 'Registration failed', details: errorMessage }, { status: 500 });
    }
}