const express = require('express');
const dotenv = require('dotenv');
const jwt = require('jsonwebtoken');
const conn = require('../mariadb');
const { StatusCodes } = require('http-status-codes');
const {
  join,
  login,
  passwordResetRequest,
  passwordReset,
} = require('../controller/UserController');

const router = express.Router();

router.use(express.json());

router.post('/join', join);
router.post('/login', login);
router.post('/reset', passwordResetRequest);
router.put('/reset', passwordReset);

module.exports = router;
