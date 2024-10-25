import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
});

export async function POST(req) {
    try {
        const { customer_id, store_id, route_id, description, payment } = await req.json();

        // Call the stored procedure
        await pool.query('CALL purchas_orders(?, ?, ?, ?, ?)', [
            customer_id,
            store_id,
            route_id,
            description,
            payment,
        ]);

        return NextResponse.json({ message: 'Order placed successfully' });
    } catch (error) {
        console.error('Error placing order:', error);
        return NextResponse.json(
            { error: 'Failed to place order' },
            { status: 500 }
        );
    }
}
