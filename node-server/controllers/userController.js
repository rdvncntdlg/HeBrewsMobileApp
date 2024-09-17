const register = async (req, res) => {
    const { firstName, lastName, email, username, password, address } = req.body;
  
    // Validate the request data
    if (!firstName || !lastName || !email || !username || !password) {
      return res.status(400).json({ error: 'All fields are required' });
    }
  
    try {
      // Check if the email already exists
      const existingUser = await getUserByEmail(email);
      if (existingUser) {
        return res.status(400).json({ error: 'Email is already registered' });
      }
  
      // Hash the password
      const salt = await bcrypt.genSalt(10);
      const hashedPassword = await bcrypt.hash(password, salt);
  
      // Save the user to the database
      const newUser = await registerUser(firstName, lastName, email, username, hashedPassword, address);
  
      res.status(201).json({
        message: 'User registered successfully',
        user: newUser,
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Server error' });
    }
  };
  