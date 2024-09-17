const registerUser = async (firstName, lastName, email, username, hashedPassword, address) => {
    const query = `
      INSERT INTO users (first_name, last_name, email, username, password, address)
      VALUES ($1, $2, $3, $4, $5, $6)
      RETURNING id, first_name, last_name, email, username, address
    `;
    const values = [firstName, lastName, email, username, hashedPassword, address];
    const result = await pool.query(query, values);
    return result.rows[0];
  };
  