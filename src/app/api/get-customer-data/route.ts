import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import argon2 from 'argon2';


// Create a MySQL connection pool
const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME
});

export async function POST(req: Request) {
    const { id } = await req.json();

    try {
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
             WHERE customer_id = ?`,
            [id]
        );

        if (!userData[0]) {
            throw new Error('User data not found');
        }
        // return NextResponse.json({
        //     id: userInfo.id,
        //     name: `${userInfo.firstName} ${userInfo.lastName}`,
        //     email: userInfo.email,
        //     type: userInfo.type,
        // });

        // Return the user data along with a success message
        return NextResponse.json({
            message: 'User data fetched successfully',
            user: userData[0]
        }, { status: 201 });

    } catch (error) {
        const errorMessage = (error as Error).message;
        console.error(error);
        return NextResponse.json({ error: 'Fetch failed', details: errorMessage }, { status: 500 });
    }
}
