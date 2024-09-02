class Transaction {

  final TransactionType type;
  final double amount;
  final String description;
  
  Transaction({
    required this.type,
    required this.amount,
    required this.description,
  });

}
// declarado de esta manera para poder tratarlo como entrada o salida de money
// para referrirme a ellos es type.income o type.expense
enum TransactionType{income,expense}