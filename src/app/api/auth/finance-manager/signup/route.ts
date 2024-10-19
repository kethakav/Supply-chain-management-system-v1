import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import argon2 from 'argon2';

// Create a MySQL connection pool
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'scms_test'
});

export async function POST(req: Request) {
    const { username, fm_email, password, fm_first_name, fm_last_name, fm_contact } = await req.json();

    try {
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

        // Step 3: Proceed with user registration using the stored procedure with the hashed password
        const [result] = await pool.query(
            `CALL RegisterFinanceManager(?, ?, ?, ?, ?, ?)`,
            [username, hashedPassword, fm_first_name, fm_last_name, fm_contact, fm_email]
        );

        // Step 4: Fetch the newly created user data
        const [userData] = await pool.query<mysql.RowDataPacket[]>(
            `SELECT 
                finance_manager_id,
                user_name,
                manager_email,
                manager_first_name,
                manager_last_name,
                manager_contact
             FROM financeandorder_manager 
             WHERE user_name = ?`,
            [username]
        );

        if (!userData[0]) {
            throw new Error('User data not found after registration');
        }

        // Return the user data along with success message
        return NextResponse.json({
            message: 'Finance and order manager registered successfully',
            user: {
                id: userData[0].customer_id,
                name: `${userData[0].customer_first_name} ${userData[0].customer_last_name}`,
                email: userData[0].customer_email,
                type: 'financeManager'
            }
        }, { status: 201 });

    } catch (error) {
        const errorMessage = (error as Error).message;
        console.error(error);
        return NextResponse.json({ error: 'Registration failed', details: errorMessage }, { status: 500 });
    }
}
