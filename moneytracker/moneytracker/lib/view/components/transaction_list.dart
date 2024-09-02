import 'package:flutter/material.dart';
import 'package:moneytracker/controller/transaction_provider.dart';
import 'package:moneytracker/model/transaction.dart';
import 'package:provider/provider.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final transactions = Provider.of<TransactionProvider>(context).transactions;

    return Expanded( //el elemento ocupa todo el espacio disponible en la columna
      child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
        ),
        child:ListView.builder(
          itemCount: transactions.length, // cuantas transacciones hay. me da tam de la lista
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            final type = transaction.type == TransactionType.income ? 'Income' : 'Expense';
            final value = transaction.type == TransactionType.expense
             ? '- \$ ${transaction.amount.abs().toStringAsFixed(2)}' : ' \$ ${transaction.amount.toStringAsFixed(2)}';
             final colortype = transaction.type == TransactionType.expense ? Colors.red : Colors.teal;
            return ListTile(
              title: Text(transaction.description),
              subtitle: Text(type),
              trailing: Text(value, style: TextStyle(fontSize: 14, color: colortype)),
            );
          },
        ),
      ),
    );
  }
}