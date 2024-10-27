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
        const { order_id, train_delivery_id } = await req.json();
        
        // Log the incoming data for debugging
        console.log('Received:', { order_id, train_delivery_id });

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
