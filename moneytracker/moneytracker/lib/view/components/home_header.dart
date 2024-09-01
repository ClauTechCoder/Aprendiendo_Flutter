import 'package:flutter/material.dart';
import 'package:moneytracker/view/widgets/header_card.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity, // tomar espacio disponible en la fila
      child: Column(
        children: [
          Text(
            'MONEY TRACKER',
            style: textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.teal.shade900),
          ),
          const SizedBox(height: 12),
          Text(
            'Balance:',
            style: textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.5)),
          ),
          Text(
            '\$1,000.00',
            style: textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white),
          ), 
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                HeaderCard(
                  title: 'Income',
                  amount: 1000,
                  icon: Icon(Icons.attach_money, color: Colors.teal),
                ),
                SizedBox(width: 12),
                HeaderCard(
                  title: 'Expense',
                  amount: -500,
                  icon: Icon(Icons.money_off, color: Colors.red),
                )
              ],
            ),
          )         
        ],
      )
    );
  }
}

