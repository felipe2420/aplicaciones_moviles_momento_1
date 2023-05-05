import 'package:bank_app_2/ui/widgets/custom_date_picker.dart';
import 'package:bank_app_2/ui/widgets/custom_dropdown_list.dart';
import 'package:bank_app_2/ui/widgets/custom_textfield.dart';
import 'package:bank_app_2/ui/widgets/loan_results_card_widget.dart';
import 'package:flutter/material.dart';

import '../../bloc/loan_calculator_bloc.dart';
import '../../constants/constants.dart';
import '../../models/dropdown_item_model.dart';
import '../../models/loan.dart';

class LoanCalculatorScreen extends StatelessWidget {
  final LoanCalculatorBloc bloc = LoanCalculatorBloc();

  LoanCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Calculadora de préstamos")),
        body:  StreamBuilder<Loan?>(
            stream: bloc.stream,
            builder: (context, snapshot) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),

                    CustomTextField(
                      textEditingController:
                      bloc.loanValueTextEditingController,
                      label: "Valor del préstamo",
                      iconName: Icons.monetization_on_outlined,
                      textInputType: TextInputType.number,
                    ),

                    CustomDatePicker(
                      textEditingController: bloc.loanDateTextEditingController,
                      label: "Fecha",
                    ),

                    Row(
                      children: [
                        CustomDropDownList(
                            list: Constants.installments
                                .map((e) => DropDownItemModel(
                                id: e, description: e.toString()))
                                .toList(),
                            initialValueId: bloc.installmentsNumber,
                            label: "Número de cuotas",
                            onChange: bloc.setInstallmentsNumber),

                        CustomDropDownList(
                          list: Constants.loanTypes
                              .map((e) => DropDownItemModel(
                              id: e.id, description: e.description))
                              .toList(),
                          initialValueId: bloc.loanType?.id,
                          label: "Tipo de préstamo",
                          onChange: bloc.setLoanType,
                        ),

                      ],
                    ),

                    if (snapshot.hasData)
                      LoanResultsCardWidget(loan: snapshot.data!),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                            onPressed: bloc.calculateLoan,
                            icon: const Icon(Icons.calculate_outlined),
                            label: const Text("Calcular")),
                        const SizedBox(width: 24),
                        ElevatedButton.icon(
                            onPressed: bloc.cleanForm,
                            icon: const Icon(Icons.cleaning_services),
                            label: const Text("Limpiar")),
                      ],
                    ),
                  ],
                ),
              );
            })
    );
  }


}
