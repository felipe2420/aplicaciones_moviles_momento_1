import 'package:bank_app_2/utils/navigation_utils.dart';
import 'package:flutter/material.dart';

import '../models/alert_model.dart';

class AlertUtils {
  static void showAlert(AlertModel? alertModel) {
    BuildContext? context = NavigationUtils.navigatorKey.currentContext;
    if (alertModel == null || context == null) return;

    showDialog(
        context: context,
        builder: (context) {
          return buildAlert(context, alertModel);
        }
    );
  }

  static Widget buildAlert(BuildContext context, AlertModel alertModel) {
    return AlertDialog (
      content:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Text(
            alertModel.title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Text(alertModel.message),
          const SizedBox(height: 20),
          const Divider(height: 1),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: InkWell(
              highlightColor: Colors.grey[200],
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Center(
                child: Text(
                  "Cerrar",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}