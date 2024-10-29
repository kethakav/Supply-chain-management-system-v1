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
        const { truck_delivery_id } = await req.json();
        
        // Log the incoming data for debugging
        console.log('Received:', { truck_delivery_id });

        // Call the stored procedure
        await pool.query('CALL send_truck(?)', [truck_delivery_id]);

        return NextResponse.json({ message: 'Truck sent successfully' });
    } catch (error) {
        console.error('Error Sending Truck:', error);
        return NextResponse.json(
            { error: 'Failed to Send truck' },
            { status: 500 }
        );
    }
}
