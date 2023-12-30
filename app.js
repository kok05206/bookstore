const express = require('express');
const app = express();

const dotenv = require('dotenv');
dotenv.config();

const userRouter = require('./routes/users');
app.use('/users', userRouter);

const bookRouter = require('./routes/books');
app.use('/books', bookRouter);

const likeRouter = require('./routes//likes');
app.use('/likes', likeRouter);

const cartRouter = require('./routes/carts');
app.use('/carts', cartRouter);

const orderRouter = require('./routes/orders');
app.use('/orders', orderRouter);

app.listen(process.env.PORT);
