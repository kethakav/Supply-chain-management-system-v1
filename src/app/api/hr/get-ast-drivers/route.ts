// app/api/drivers/route.ts

import { NextResponse } from "next/server";
import mysql from "mysql2/promise";

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

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
