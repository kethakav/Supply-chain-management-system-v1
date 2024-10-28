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
        const { delivery_id } = await req.json();
        
        // Log the incoming data for debugging
        console.log('Received:', { delivery_id });

        // Call the stored procedure
        await pool.query('CALL SendTrain(?)', [delivery_id]);

        return NextResponse.json({ message: 'Train sent successfully' });
    } catch (error) {
        console.error('Error Sending Train:', error);
        return NextResponse.json(
            { error: 'Failed to Send train' },
            { status: 500 }
        );
    }
}
