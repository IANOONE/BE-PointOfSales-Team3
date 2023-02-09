'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Transaction extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Transaction.init({
    no_trans: DataTypes.STRING,
    grand_total: DataTypes.INTEGER,
    date: DataTypes.DATEONLY
  }, {
    sequelize,
    paranoid: true,
    modelName: 'Transaction'
  });
  return Transaction;
};