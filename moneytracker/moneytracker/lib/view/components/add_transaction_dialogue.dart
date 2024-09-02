import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneytracker/controller/transaction_provider.dart';
import 'package:moneytracker/model/transaction.dart';
import 'package:provider/provider.dart';

class AddTransactionDialog extends StatefulWidget {
  const AddTransactionDialog({super.key});

  @override
  State<AddTransactionDialog> createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {

  int? typeIndex = 0; // ? -> es que puede no tener un valor inicial
  TransactionType type = TransactionType.income;
  double amount = 0;
  String description = '';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 600,
      width: double.infinity,
      child:
        Column(
          children: [
            Container(
              height: 6,
              width: 48,
              margin: const EdgeInsets.only(top:12),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'New Transaction',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold
                  ),
                ),
            ),
            CupertinoSlidingSegmentedControl(
              groupValue: typeIndex,
              children: const {
                0: Text('Income'),
                1: Text('Expense'),
              },
              onValueChanged: (value){
                setState(() {
                  typeIndex = value;
                  type = value == 0 ? TransactionType.income : TransactionType.expense;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'AMOUNT', 
              style: textTheme.bodySmall!.copyWith(color: Colors.teal),
            ),
            TextField(
              inputFormatters: [CurrencyTextInputFormatter.currency(symbol: '\$')],
              textAlign: TextAlign.center,
              decoration: const InputDecoration.collapsed(
                hintText: '\$ 0.00',
                hintStyle: TextStyle(color: Colors.grey)
                ),
              keyboardType: TextInputType.number,
              autofocus: true,
              onChanged: (value) {
                final valueWihtoutDollarSign = value.replaceAll('\$','');
                final valueWihoutCommas = valueWihtoutDollarSign.replaceAll(',', '');
                if (valueWihoutCommas.isNotEmpty){
                  amount = double.parse(valueWihoutCommas);
                }
              },
            ),
            const SizedBox(height: 20),
            Text(
              'DESCRIPTION', 
              style: textTheme.bodySmall!.copyWith(color: Colors.teal),
            ),
            TextField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration.collapsed(
                hintText: 'Enter a description',
                hintStyle: TextStyle(color: Colors.grey)
                ),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                description = value;
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  // add transaction to the provider
                  final transaction = Transaction(
                    type: type,
                    amount: amount = TransactionType.expense == type ? -amount : amount,
                    description: description,
                  );
                  Provider.of<TransactionProvider>(context, listen: false).addTransaction(transaction);
                  Navigator.pop(context); // close the dialog
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                child: const Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.white),
                  ),
              ),
            )
          ],
        ),
    );
  }
}