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
    const { customer_ID, product_ID } = await req.json();
    console.log(`Removing product ${product_ID} for customer ${customer_ID}`);
    
    // Call the stored procedure to remove item from cart
    const [result] = await pool.query<mysql.RowDataPacket[]>('CALL remove_from_cart(?, ?)', [customer_ID, product_ID]);

    console.log(result);

    return NextResponse.json({ message: 'Item removed from cart successfully' });
  } catch (error) {
    console.error('Error removing item from cart:', error);
    return NextResponse.json(
      { error: 'Failed to remove item from cart' },
      { status: 500 }
    );
  }
}
