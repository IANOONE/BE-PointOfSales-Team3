module.exports = {
  development: {
    username: process.env.user, //dont set name of user as username
    password: process.env.pass, //dont set name of pass as password
    database: process.env.database,
    host: process.env.host,
    dialect: process.env.db_dialect
    // username : "root",
    // password : "B#r1#l#1@N",
    // database :  "db_ticketing",
    // host : "127.0.0.1",
    // dialect : "mysql"
  }
  // ,
  // test: {
  //   username: root,
  //   password: null,
  //   database: database_test,
  //   host: 127.0.0.1,
  //   dialect: mysql
  // },
  // production: {
  //   username: root,
  //   password: null,
  //   database: database_production,
  //   host: 127.0.0.1,
  //   dialect: mysql
  // }
}