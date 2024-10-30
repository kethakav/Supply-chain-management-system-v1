// src/app/api/driver/get-deliveries/route.ts

import type { NextApiRequest, NextApiResponse } from 'next';
import { NextResponse, NextRequest } from 'next/server';
import mysql from 'mysql2/promise';
import pool from '@/utils/db/pool';

// Define the API endpoint to get assigned deliveries for a driver
export async function POST(req: NextRequest, res: NextResponse) {
    const { driver_id } = await req.json(); // Get driverId from the request body
    console.log(driver_id);

    try {
        if (!pool) {
            throw new Error('Database connection pool is not initialized.');
        }
        const [rows] = await pool.query(`CALL GetAssignedDeliveriesForAssistantDriver(${driver_id})`);
        console.log(rows);
        return NextResponse.json(rows, { status: 200 }); // Use NextResponse for the response
    } catch (error) {
        console.error(error);
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 }); // Use NextResponse for error response
    }
}