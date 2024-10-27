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
        const { order_id, finance_manager_id } = await req.json();
        console.log(order_id, finance_manager_id);

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
