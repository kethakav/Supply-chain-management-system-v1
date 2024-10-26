import { NextResponse } from "next/server";
import mysql from "mysql2/promise";

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

export async function GET(req: Request) {
  try {
    // Call the stored procedure to get all stores
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL show_all_stores()');

    // Assuming the store details are in the first result set of the procedure
    const stores = rows;

    console.log(stores);

    return NextResponse.json(stores);
  } catch (error) {
    console.error('Error fetching stores:', error);
    return NextResponse.json(
      { error: 'Failed to fetch stores' },
      { status: 500 }
    );
  }
}
