import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import pool from '@/utils/db/pool';


export async function POST(req: Request) {
    try {
        const { order_id, train_delivery_id } = await req.json();
        
        // Log the incoming data for debugging
        console.log('Received:', { order_id, train_delivery_id });
        if (!pool) {
            throw new Error('Database connection pool is not initialized.');
        }
        // Call the stored procedure
        await pool.query('CALL remove_orders_from_train(?, ?)', [order_id, train_delivery_id]);

        return NextResponse.json({ message: 'Order updated successfully' });
    } catch (error) {
        console.error('Error updating order:', error);
        return NextResponse.json(
            { error: 'Failed to update order' },
            { status: 500 }
        );
    }
}
