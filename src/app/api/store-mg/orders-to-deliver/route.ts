import { NextResponse } from "next/server";
import mysql from "mysql2/promise";

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

export async function POST(req: Request) {
  try {
    const { store_id } = await req.json();
    console.log(store_id);
    // Call the stored procedure to get cart items along with product details
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL orders_to_deliver(?)', [store_id]);

    // Assuming the cart details are in the first result set of the procedure
    const cartItems = rows;

    console.log(rows);

    return NextResponse.json(cartItems);
  } catch (error) {
    console.error('Error fetching orders:', error);
    return NextResponse.json(
      { error: 'Failed to fetch orders' },
      { status: 500 }
    );
  }
}
