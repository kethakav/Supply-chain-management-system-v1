import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import argon2 from 'argon2';
import pool from '@/utils/db/pool';

export async function POST(req: Request) {
    const { vehicle_number, store_id } = await req.json();

    console.log("store_id: ", store_id);

    try {
        
        // Step 3: Proceed with user registration using the stored procedure with the hashed password and store_id
        if (!pool) {
            throw new Error('Database connection pool is not initialized.');
        }
        const [result] = await pool.query(
            `CALL AddTruckToStore(?, ?)`, // Adjust the stored procedure to accept store_id
            [vehicle_number, store_id] // Pass store_id here
        );

        // Return the user data along with success message
        return NextResponse.json({
            message: 'Truck registered successfully',
            user: {
                id: 1,
            }
        }, { status: 201 });

    } catch (error) {
        const errorMessage = (error as Error).message;
        console.error(error);
        return NextResponse.json({ error: 'Registration failed', details: errorMessage }, { status: 500 });
    }
}
