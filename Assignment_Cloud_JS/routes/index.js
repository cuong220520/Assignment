var express = require('express');
var router = express.Router();
var mongo = require('mongodb').MongoClient;
var objectId = require('mongodb').ObjectID;
var assert = require('assert');
var multer = require('multer'); 

var storage = multer.diskStorage( {
  destination: function(req, file, cb) {
    cb(null, './public/images/');
  },
  filename: function(req, file,cb) {
    cb(null, Date.now() + '-' + file.originalname)
  }
});

var upload = multer({storage: storage});

var url = 'mongodb://localhost:27017/test';

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('index');
});

router.get('/get-data', function (req, res, next) {
  var resultArray = [];
  mongo.connect(url, function(err, db) {
    assert.equal(null, err);
    console.log('DB connected');
    var cursor = db.collection('user-data').find();
    cursor.forEach(function (doc, err) {
      assert.equal(null, err);
      resultArray.push(doc);
    }, function () {
      db.close();
      res.render('index', { items: resultArray });
      console.log('Get Data Successfully!');
    });
  });
});

router.post('/insert', upload.single('image'), function (req, res, next) {
  var item = {
    productName: req.body.productName,
    price: req.body.price,
    stock: req.body.stock,
    supplier: req.body.supplier,
    brand: req.body.brand,
    image: req.file.filename
  };
  mongo.connect(url, function(err, db) {
    assert.equal(null, err);
    console.log('DB connected');
    db.collection('user-data').insertOne(item, function (err) {
      assert.equal(null, err);
      console.log('Item inserted!');
      db.close();
    });
  });
  res.redirect('/index/get-data');
});

router.post('/update', function (req, res, next) {
  var item = {
    productName: req.body.productName,
    price: req.body.price,
    stock: req.body.stock,
    supplier: req.body.supplier,
    brand: req.body.brand
  };

  var id = req.body.id;
  mongo.connect(url, function(err, db) {
    assert.equal(null, err);
    console.log('DB connected');
    db.collection('user-data').updateOne({ "_id": objectId(id) }, { $set: item }, function (err) {
      assert.equal(null, err);
      console.log('Item updated!');
      db.close();
    });
  });
  res.redirect('/index/get-data');
});

router.post('/delete', function (req, res, next) {
  var id = req.body.id;

  mongo.connect(url, function(err, db) {
    assert.equal(null, err);
    console.log('DB connected');
    db.collection('user-data').deleteOne({ "_id": objectId(id) }, function (err, result) {
      assert.equal(null, err);
      console.log('Item deleted');
      db.close();
    });
  });
  res.redirect('/index/get-data');
});
module.exports = router;
