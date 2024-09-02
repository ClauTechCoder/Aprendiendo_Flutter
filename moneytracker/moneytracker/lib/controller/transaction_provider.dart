import 'package:flutter/material.dart';
import 'package:moneytracker/model/transaction.dart';

class TransactionProvider extends ChangeNotifier{
  // changenotifier es una clase que nos permite notificar cambios en widgets
  // _propiedad -< se refiere  a que es una propiedad privada.

  final List<Transaction> _transactions = [
    Transaction(type: TransactionType.income, amount: 1000, description: 'Salary'),
    Transaction(type: TransactionType.expense, amount: -500, description: 'Rent'),
  ];

 // getters para leer la lista de transacciones
  List<Transaction> get transactions{
    return [..._transactions];
  }
  // metodo para agregar una nueva transaccion
  void addTransaction(Transaction transaction){
    _transactions.add(transaction);
    notifyListeners();
  }

  // metodo para obtener el total de ingresos
  double getTotalIncomes(){
    return _transactions.where((transaction) => transaction.type 
    == TransactionType.income).map((transaction) => 
    transaction.amount).fold(0, (a, b) => a + b);
  }

  // metodo para obtener el total de gastos
  double getTotalExpenses(){
    return _transactions.where((transaction) => transaction.type 
    == TransactionType.expense).map((transaction) => 
    transaction.amount).fold(0, (a, b) => a + b);
  }
  // metodo para obtener el balance de la cuenta
  double getBalance(){
    return getTotalIncomes() + getTotalExpenses();
  }
  

}