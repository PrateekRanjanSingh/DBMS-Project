const mysql= require('mysql');

var connection;
connection = mysql.createConnection({
    host:  'localhost',
    user:   'root',
    password: '^Saurav123#',
    database: 'prateek-dbms',
    multipleStatements: true
});

connection.connect(function (err) {
    if(err) throw err;
    console.log('connected');
})

connection.query('Select * from rate', function (err, rows, fields) {
    if(err) throw err;

    console.log("CHecked : ", rows[0]);
})

module.exports = connection;