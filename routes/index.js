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
                "'" + aadhar + "';";
    db.query(sql, function(err, rows, fields) {
        if(err) console.log(err);
        else{
            console.log(rows);
        }
        res.render('consumer_details.ejs',{data: rows, aadhar: aadhar});
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

router.post('/getbill', function (req, res, next) {
   "use strict";
   let bill;
   let aadhar=  req.body.aadhar;
   // console.log(req.body);
   let sql = 'select * from consumption_record where BILL_ID in (select B_id ' +
            'from customer_bill where CUST_AADHAR_NUMBER= '+ "'"+ aadhar + "');";

   console.log(sql);
   db.query(sql, function (err, rows, feilds) {
      if(err) console.log(err);
      else
      {
          console.log(rows);
      }
      res.json(rows);
   });
});

router.post('/getrates', function (req, res, next) {
    "use strict";
    let rate;
    let aadhar=  req.body.aadhar;
    let sql = 'select rate.BILL_ID, rate.BASE_Charge, rate.additional_charges,charge.service_charge,' +
        ' customer_bill.cust_aadhar_number from ((rate inner join charge on rate.base_charge=' +
        'charge.base_charge) inner join customer_bill on rate.BILL_ID=customer_bill.B_id)' +
        ' where cust_aadhar_number ='+ "'"+ aadhar + "';";

    console.log(sql);
    db.query(sql, function (err, rows, feilds) {
        if(err) console.log(err);
        else
        {
            console.log(rows);
        }
        res.json(rows);
    });
});

router.post('/getmeter', function (req, res, next) {
    "use strict";
    let rate;
    let aadhar=  req.body.aadhar;
    let sql = 'select * from electricity_consumer_type where METER_NUMBER in ' +
            '(select meter_number from electricity_consumer where Aadhar_number ='+"'" + aadhar + "');";

    console.log(sql);
    db.query(sql, function (err, rows, feilds) {
        if(err) console.log(err);
        else
        {
            console.log(rows);
        }
        res.json(rows);
    });
});
router.post('/getreigon', function (req, res, next) {
    "use strict";
    let rate;
    let aadhar=  req.body.aadhar;
    let sql = 'select * from region_located where REGION_ID in (select REGION_ID ' +
                'from customer_region where C_AADHAR_NUMBER =' + "'" + aadhar + "');";

    console.log(sql);
    db.query(sql, function (err, rows, feilds) {
        if(err) console.log(err);
        else
        {
            console.log(rows);
        }
        res.json(rows);
    });
});
module.exports = router;