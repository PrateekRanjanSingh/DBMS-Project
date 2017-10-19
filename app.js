const express    = require('express');
const bodyParser = require('body-parser');
const db         = require('./db.js');
const path       = require('path');
const index      = require('./routes/index');

const app = express();

app.set('views',path.join(__dirname,'views'));
app.set('view engine', 'ejs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname,'public')));

//set base route
app.use('/', index);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

app.listen(3003, function () {
    console.log("App listening at port 3003");
});
