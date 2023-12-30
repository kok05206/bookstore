const express = require('express');
const router = express.Router();

router.use(express.json());

router.get('/', (req, res) => {
  res.json('전체 장바구니 조회');
});

router.post('/', (req, res) => {
  res.json('장바구니 담기');
});

router.delete('/:id', (req, res) => {
  res.json('장바구니 개별 삭제');
});

// router.get('/', (req, res) => {
//   res.status(200).json('장바구니 예상 목록 조회');
// });

module.exports = router;
