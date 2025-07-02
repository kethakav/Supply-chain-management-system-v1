import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import pool from '@/utils/db/pool';

export async function POST(req: Request) {
    try {
        const { order_id, truck_delivery_id } = await req.json();

        // Call the stored procedure
        if (!pool) {
            throw new Error('Database connection pool is not initialized.');
        }
        await pool.query('CALL add_orders_to_truck(?, ?)', [order_id, truck_delivery_id]);

        return NextResponse.json({ message: 'Order assigned to truck successfully' });
    } catch (error) {
        console.error('Error assigning order to truck:', error);
        return NextResponse.json(
            { error: 'Failed to assign order to truck' },
            { status: 500 }
        );
    }
}
