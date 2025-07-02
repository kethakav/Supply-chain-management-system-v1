import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import pool from '@/utils/db/pool';

export async function POST(req: Request) {
    try {
        const { order_id } = await req.json();
        
        // Log the incoming data for debugging
        console.log('Received:', { order_id });

        // Call the stored procedure
        if (!pool) {
            throw new Error('Database connection pool is not initialized.');
        }
        await pool.query('CALL remove_orders_from_truck(?)', [order_id]);

        return NextResponse.json({ message: 'Order updated successfully' });
    } catch (error) {
        console.error('Error updating order:', error);
        return NextResponse.json(
            { error: 'Failed to update order' },
            { status: 500 }
        );
    }
}
