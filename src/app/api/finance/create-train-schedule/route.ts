import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
});

export async function POST(req: Request) {
    try {
        const { train_id } = await req.json();

        // Call the stored procedure
        await pool.query('CALL create_train_shedule(?)', [train_id]);

        return NextResponse.json({ message: 'Train schedule created successfully' });
    } catch (error) {
        console.error('Error creating train schedule:', error);
        return NextResponse.json(
            { error: 'Failed to create train schedule' },
            { status: 500 }
        );
    }
}
