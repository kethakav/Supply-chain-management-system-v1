import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import pool from '@/utils/db/pool';

export async function POST(req: Request) {
    try {
        const { truck_delivery_id } = await req.json();
        
        // Log the incoming data for debugging
        console.log('Received:', { truck_delivery_id });

        // Call the stored procedure
        if (!pool) {
            throw new Error('Database connection pool is not initialized.');
        }
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
