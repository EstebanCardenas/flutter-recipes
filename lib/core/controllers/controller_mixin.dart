import 'package:flutter/material.dart';

mixin ControllerMixin {
  BuildContext? context;

  void displayLoading(BuildContext context) {
    this.context = context;
    showDialog(
      context: context,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }

  void closeLoading() {
    if (context != null) {
      Navigator.of(context!).pop();
    }
  }
}
