import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTransactionDialog extends StatefulWidget {
  const AddTransactionDialog({super.key});

  @override
  State<AddTransactionDialog> createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {

  int? typeIndex = 0; // ? -> es que puede no tener un valor inicial

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
            ),
            const SizedBox(height: 20),
            Text(
              'DESCRIPTION', 
              style: textTheme.bodySmall!.copyWith(color: Colors.teal),
            ),
            const TextField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration.collapsed(
                hintText: 'Enter a description',
                hintStyle: TextStyle(color: Colors.grey)
                ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              width: 180,
              child: ElevatedButton(
                onPressed: () {}, 
                child: const Text('Add Transaction'),
              ),
            )
          ],
        ),
    );
  }
}