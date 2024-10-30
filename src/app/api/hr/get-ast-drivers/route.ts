// app/api/drivers/route.ts

import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';


export async function POST(request: Request) {
  try {
    const { store_id } = await request.json();

    if (!store_id) {
      return NextResponse.json(
        { error: "Missing store_id in request body" },
        { status: 400 }
      );
    }

    // Call the procedure with the store_id parameter
    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
    }
    const [rows] = await pool.query<mysql.RowDataPacket[]>(`CALL GetAstDriversByStoreID(?)`, [store_id]);

    // Assuming the procedure returns the results in the first result set
    const drivers = rows[0];

    return NextResponse.json(drivers);
  } catch (error) {
    console.error("Error fetching drivers:", error);
    return NextResponse.json(
      { error: "Failed to fetch drivers" },
      { status: 500 }
    );
  }
}
