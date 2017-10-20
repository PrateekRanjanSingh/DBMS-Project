const express = require('express');
const router  = express.Router();
const db      = require('./../db.js');

router.get('/',function (req, res) {
    res.render('index.ejs');
});

router.get('/customer', function (req, res) {

   res.render('customer.ejs');
});

router.post('/customer',function (req, res) {
    var aadhar = req.body.aadhar;
    var sql    = 'select consumer_Fname,age from `electricity_consumer` where Aadhar_Number='+
                "'" + aadhar + "';"
    db.query(sql, function(err, rows, fields) {
        if(err) console.log(err);
        else{
            console.log(rows);
        }
        res.render('consumer_details.ejs',{data: rows});
    });

});

router.get('/company', function (req, res) {

    res.render('company.ejs');
});

router.post('/company',function (req, res) {
    res.send('Hello!');
});

router.get('/reg_customer', function (req, res) {
   res.render('reg_customer.ejs');
});

module.exports = router;