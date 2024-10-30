// /api/confirm-orders.ts

import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';


export async function POST(req: Request) {
    try {
        const { orderIds } = await req.json();

        if (!Array.isArray(orderIds)) {
            return NextResponse.json({ error: 'Invalid input' }, { status: 400 });
        }
    
        if (!pool) {
            return NextResponse.json({ error: 'Database connection not available' }, { status: 500 });
        }

        const promises = orderIds.map(orderId => {
            if (!pool) throw new Error('Database connection not available'); // Ensure pool is not null
            return pool.query('CALL confirm_recived_orders(?)', [orderId]);
        });

        await Promise.all(promises); // Wait for all promises to resolve

        return NextResponse.json({ success: true });
    } catch (error) {
        console.error('Error confirming orders:', error);
        return NextResponse.json({ error: 'Failed to confirm orders' }, { status: 500 });
    }
}
