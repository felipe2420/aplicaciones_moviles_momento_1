class Loan {
  final double debt;
  final double installmentValue;

  const Loan({required this.debt, required this.installmentValue});

  Loan copyWith({
    double? debt,
    double? installmentValue
  }) => Loan(
      debt: debt ?? this.debt,
      installmentValue: installmentValue ?? this.installmentValue
  );
}