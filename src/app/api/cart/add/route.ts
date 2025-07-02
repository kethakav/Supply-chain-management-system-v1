import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import pool from '@/utils/db/pool';


export async function POST(req: Request) {
    try {
        const { id, product_ID, quantity } = await req.json();
        console.log(id);

        // Call the stored procedure
        if (!pool) {
            throw new Error('Database connection pool is not initialized.');
        }
        await pool.query('CALL add_to_cart(?, ?, ?)', [id, product_ID, quantity]);

        return NextResponse.json({ message: 'Product added to cart successfully' });
    } catch (error) {
        console.error('Error adding to cart:', error);
        return NextResponse.json(
            { error: 'Failed to add product to cart' },
            { status: 500 }
        );
    }
}
