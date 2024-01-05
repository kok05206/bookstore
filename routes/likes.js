const express = require('express');
const router = express.Router();
const { addLike, cancelLike } = require('../controller/LikeController');

router.use(express.json());

router.post('/:id', addLike);

router.delete('/:id', cancelLike);

module.exports = router;
