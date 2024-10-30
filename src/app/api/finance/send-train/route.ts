import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import pool from '@/utils/db/pool';

export async function POST(req: Request) {
    try {
        const { delivery_id } = await req.json();
        
        // Log the incoming data for debugging
        console.log('Received:', { delivery_id });
        if (!pool) {
            throw new Error('Database connection pool is not initialized.');
        }
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
