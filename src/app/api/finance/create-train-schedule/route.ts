import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import pool from '@/utils/db/pool';


export async function POST(req: Request) {
    try {
        const { train_id } = await req.json();

        if (!pool) {
            throw new Error('Database connection pool is not initialized.');
        }
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
