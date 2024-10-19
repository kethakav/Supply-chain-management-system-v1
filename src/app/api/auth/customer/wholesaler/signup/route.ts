import { NextResponse } from 'next/server';

export async function POST(req: Request) {
    const { username, customer_email, password, customer_first_name, customer_last_name, customer_contact, customer_address } = await req.json();

    
  

  // If credentials don't match, return an error response
  return NextResponse.json({ error: 'Invalid email or password' }, { status: 401 });
}