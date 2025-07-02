import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';


export async function POST(req: Request) {
  try {
    const { driver_id } = await req.json();
    console.log(driver_id);

    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
  }
    // Call the stored procedure to get assigned deliveries for the driver
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL GetAssignedDeliveriesForDriver(?)', [driver_id]);

    // Assuming the assigned deliveries are in the first result set
    const assignedDeliveries = rows[0];

    console.log(assignedDeliveries);

    return NextResponse.json(assignedDeliveries);
  } catch (error) {
    console.error('Error fetching assigned deliveries:', error);
    return NextResponse.json(
      { error: 'Failed to fetch assigned deliveries' },
      { status: 500 }
    );
  }
}
