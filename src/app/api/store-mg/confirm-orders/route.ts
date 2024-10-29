// /api/confirm-orders.ts

import { NextResponse } from "next/server";
import mysql from "mysql2/promise";

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
});

export async function POST(req: Request) {
    try {
        const { orderIds } = await req.json();

        if (!Array.isArray(orderIds)) {
            return NextResponse.json({ error: 'Invalid input' }, { status: 400 });
        }

        const promises = orderIds.map(orderId =>
            pool.query('CALL confirm_recived_orders(?)', [orderId])
        );

        await Promise.all(promises); // Wait for all promises to resolve

        return NextResponse.json({ success: true });
    } catch (error) {
        console.error('Error confirming orders:', error);
        return NextResponse.json({ error: 'Failed to confirm orders' }, { status: 500 });
    }
}
