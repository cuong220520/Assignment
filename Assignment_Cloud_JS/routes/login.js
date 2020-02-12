var express = require('express');
var router = express.Router();
var mongo = require('mongodb').MongoClient;
var objectId = require('mongodb').ObjectID;
var assert = require('assert');
var url = 'mongodb://localhost:27017/test';

const { check, validationResult } = require('express-validator');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('login', { title: 'Form Validation', success: req.session.success, errors: req.session.errors });
  req.session.errors = null;
});

router.post('/submit', function(req, res, next) {
  mongo.connect(url, function(err, db) {
    assert.equal(err, null);
    console.log('DB connected');
    db.collection('staff-account').findOne({username: req.body.username, password: req.body.password}).then(function() {
        var errors = req.validationErrors();
        if (errors) {
            req.session.errors = errors;
            req.session.success = false;
        } else {
            req.session.success = true;
            console.log('Login Successfully!')
            res.redirect('/index');
        }
    });
  });
});
module.exports = router;