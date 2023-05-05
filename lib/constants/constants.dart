import '../models/loan_type.dart';

class Constants {
  static List<int> installments = List.of({12, 24});

  static List<LoanType> loanTypes = List.of({
    const LoanType(id: 1, description: "Vivienda", interestRate: 1.0),
    const LoanType(id: 2, description: "Vehículo", interestRate: 1.5),
  });
}