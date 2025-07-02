import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import pool from '@/utils/db/pool';

export async function POST(req: Request) {
    try {
        // Parse the request body to extract store_id
        const { store_id: storeId } = await req.json();

        if (!storeId) {
            return NextResponse.json({ error: 'store_id is required' }, { status: 400 });
        }

        if (!pool) {
            throw new Error('Database connection pool is not initialized.');
        }

        // Query to get the total worked hours for drivers, assistant drivers, and trucks in the specified store
        const [rows]: any = await pool.query(
            `
            SELECT driver_id AS id, worked_hours, CONCAT(driver_first_name, ' ', driver_last_name) AS name, 'Driver' AS type, NULL AS vehicle_number, NULL AS truck_id
            FROM Driver
            WHERE store_id = ?

            UNION ALL

            SELECT ast_driver_id AS id, worked_hours, CONCAT(ast_driver_first_name, ' ', ast_driver_last_name) AS name, 'Assistant Driver' AS type, NULL AS vehicle_number, NULL AS truck_id
            FROM Assistant_Driver
            WHERE store_id = ?

            UNION ALL

            SELECT truck_id AS id, hours AS worked_hours, vehicle_number AS name, 'Truck' AS type, vehicle_number, truck_id
            FROM Truck
            WHERE store_id = ?
            `,
            [storeId, storeId, storeId]
        );

        // Check if any records were found
        if (rows.length === 0) {
            return NextResponse.json({ message: 'No drivers, assistant drivers, or trucks found for the specified store' }, { status: 404 });
        }

        // Map the results into an array
        const workedHours = rows.map((item: any) => ({
            id: item.id,
            name: item.name,
            worked_hours: item.worked_hours,
            type: item.type,
            vehicle_number: item.vehicle_number,
            truck_id: item.truck_id
        }));

        // Return the list of drivers, assistant drivers, and trucks with their worked hours
        return NextResponse.json({ results: workedHours }, { status: 200 });

    } catch (error) {
        const errorMessage = (error as Error).message;
        console.error(error);
        return NextResponse.json({ error: 'Failed to retrieve working hours data', details: errorMessage }, { status: 500 });
    }
}
