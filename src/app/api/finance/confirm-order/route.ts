import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import pool from '@/utils/db/pool';


export async function POST(req: Request) {
    try {
        const { order_id, finance_manager_id } = await req.json();
        console.log(order_id, finance_manager_id);

        if (!pool) {
            throw new Error('Database connection pool is not initialized.');
        }

        // Call the stored procedure
        await pool.query('CALL confirm_payment(?, ?)', [order_id, finance_manager_id]);

        return NextResponse.json({ message: 'Payment confirmed successfully' });
    } catch (error) {
        console.error('Error confirming payment:', error);
        return NextResponse.json(
            { error: 'Failed to confirm payment' },
            { status: 500 }
        );
    }
}
