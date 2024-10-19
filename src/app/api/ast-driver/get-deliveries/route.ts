// src/app/api/driver/get-deliveries/route.ts

import type { NextApiRequest, NextApiResponse } from 'next';
import { NextResponse, NextRequest } from 'next/server';
import mysql from 'mysql2/promise';

// Create a MySQL connection pool
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'scms_test'
});

// Define the API endpoint to get assigned deliveries for a driver
export async function POST(req: NextRequest, res: NextResponse) {
    const { astDriverId } = await req.json(); // Get driverId from the request body
    console.log(astDriverId);

    try {
        const [rows] = await pool.query(`CALL GetAssignedDeliveriesForAssistantDriver(${astDriverId})`);
        console.log(rows);
        return NextResponse.json(rows, { status: 200 }); // Use NextResponse for the response
    } catch (error) {
        console.error(error);
        return NextResponse.json({ error: 'Internal Server Error' }, { status: 500 }); // Use NextResponse for error response
    }
}