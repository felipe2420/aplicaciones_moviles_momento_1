import 'package:bank_app_2/utils/string_utils.dart';
import 'package:flutter/material.dart';

import '../../models/loan.dart';

class LoanResultsCardWidget extends StatelessWidget {
  final Loan loan;
  const LoanResultsCardWidget({super.key, required this.loan});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                        color: Colors.green,
                      ),

                      const SizedBox(width: 16),

                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Resultados",
                                style: Theme.of(context).textTheme.bodyLarge
                            ),

                            const SizedBox(height: 8),

                            Text('Valor de la deuda: \$${StringUtils.formatNumber(value: loan.debt)}'),

                            Text('Cuota mensual: \$${StringUtils.formatNumber(value: loan.installmentValue)}')
                          ]
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}