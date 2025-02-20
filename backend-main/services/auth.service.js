const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const User = require("../models/User");
const { createTokens } = require("../JWT/jwt");

const registerUser = async ({ username, password, email }) => {
  const existingUser = await User.findOne({ username });
  if (existingUser) throw new Error("Username already exists");

  const hashedPassword = await bcrypt.hash(password, 10);
  const newUser = new User({ username, password: hashedPassword, email });
  await newUser.save();
  return "✅ USER REGISTERED";
};

const loginUser = async ({ username, password }) => {
  const user = await User.findOne({ username });
  if (!user) throw new Error("User Doesn't Exist");

  const isMatch = await bcrypt.compare(password, user.password);
  if (!isMatch) throw new Error("Wrong Username and Password!");

  const accessToken = createTokens(user);
  return { message: "✅ LOGGED IN", accessToken };
};

module.exports = { registerUser, loginUser };
