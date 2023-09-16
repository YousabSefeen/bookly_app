import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppAlerts {
  static void alertNoInternet({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..context
      ..showSnackBar(
        SnackBar(
          elevation: 0,
          backgroundColor: Colors.grey,
          animation: null,
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.only(bottom: 35, left: 22, right: 25),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Row(
            children: [
              Icon(
                Icons.wifi_off,
                size: 22.sp,
                color: Colors.black,
              ),
              const SizedBox(width: 10),
              Text(
                message,
                style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
  }
}
