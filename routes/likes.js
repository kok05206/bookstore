const express = require('express');
const router = express.Router();
const { addLike, cancelLike } = require('../controller/LikeController');

router.use(express.json());

router.post('/:id', addLike); // 좋아요 추가

router.delete('/:id', cancelLike); // 좋아요 취소

module.exports = router;
