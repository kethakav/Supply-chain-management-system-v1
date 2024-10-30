import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import pool from '@/utils/db/pool';

export async function POST(req: Request) {
    try {
        const { truck_id, driver_id, ast_driver_id, route_id, store_id } = await req.json();

        // Call the stored procedure to schedule truck delivery
        if (!pool) {
            throw new Error('Database connection pool is not initialized.');
        }
        await pool.query('CALL shedule_truck_delivery(?, ?, ?, ?, ?)', [truck_id, driver_id, ast_driver_id, route_id, store_id]);

        return NextResponse.json({ message: 'Truck delivery scheduled successfully' });
    } catch (error) {
        console.error('Error scheduling truck delivery:', error);
        return NextResponse.json(
            { error: 'Failed to schedule truck delivery' },
            { status: 500 }
        );
    }
}
