// app/api/finance-managers/route.ts

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
    const [rows] = await pool.query<mysql.RowDataPacket[]>(`CALL GetManagersByStoreId(?)`, [store_id]);

    // Assuming the procedure returns the results in the first result set
    const managers = rows[0];

    return NextResponse.json(managers);
  } catch (error) {
    console.error("Error fetching managers:", error);
    return NextResponse.json(
      { error: "Failed to fetch managers" },
      { status: 500 }
    );
  }
}
