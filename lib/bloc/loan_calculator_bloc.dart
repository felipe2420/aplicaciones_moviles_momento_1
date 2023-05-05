import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../constants/constants.dart';
import '../models/alert_model.dart';
import '../models/dropdown_item_model.dart';
import '../models/loan.dart';
import '../models/loan_type.dart';
import '../utils/alert_utils.dart';

class LoanCalculatorBloc {
  Loan? loan;

  final loanValueTextEditingController = TextEditingController();
  final loanDateTextEditingController = TextEditingController();

  LoanType? loanType;
  int? installmentsNumber;

  final _streamController = StreamController<Loan?>();
  get stream => _streamController.stream;

  void setLoanType(DropDownItemModel? value) {
    if (value == null) return;
    loanType = Constants.loanTypes.firstWhere((element) => element.id == value.id);
  }

  void setInstallmentsNumber(DropDownItemModel? value) {
    if (value == null) return;
    installmentsNumber = value.id;
  }

  void calculateLoan() {
    double? loanValue = double.tryParse(loanValueTextEditingController.text);
    String date = loanDateTextEditingController.text;

    if (loanValue == null || installmentsNumber == null || date.isEmpty ) {
      showMessage(title: "Error", description: "Aseguraté de ingresar todos los campos");
      return;
    }

    double? interest = _calculateInterest(
        loanValue: loanValue,
        installmentsNumber: installmentsNumber!
    );

    if (interest == null) {
      showMessage(title: "Error", description: "Ocurrió un error al calcular el interés, por favor inténtalo de nuevo");
      return;
    }

    double debt = loanValue + interest;
    double installmentValue = debt / installmentsNumber!;

    _updateLoanValue(
        newLoan: Loan(debt: debt, installmentValue: installmentValue)
    );
  }

  double? _calculateInterest({required double loanValue, required int installmentsNumber}) {
    if (loanType == null) return null;

    double interestPercent = loanType!.interestRate / 100;
    return loanValue * interestPercent * installmentsNumber;
  }

  void cleanForm() {
    loanDateTextEditingController.clear();
    loanValueTextEditingController.clear();

    loanType = null;
    installmentsNumber = null;

    _updateLoanValue();
  }

  void _updateLoanValue({Loan? newLoan}) {
    _streamController.add(newLoan);
  }

  void showMessage({required String title, required String description}) {
    AlertUtils.showAlert(
        AlertModel(title: title, message: description)
    );
  }
}