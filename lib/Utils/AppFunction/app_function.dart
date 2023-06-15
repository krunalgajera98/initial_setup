import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initial_setup/Utils/AppColor/app_color.dart';
import 'package:initial_setup/Utils/AppHelper/dimensions.dart';
import 'package:intl/intl.dart';

class AppFunction {
  static void showSnackBar({required String title, required String message, SnackPosition? snackPosition}) {
    Get.snackbar(
      title, message,
      snackPosition: snackPosition ?? SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      borderRadius: 8,
      backgroundColor: title.toLowerCase().contains('success') ? Colors.green : Colors.red,
      // : title.toLowerCase().contains('error')
      //     ? Colors.red
      //     : Colors.black45,
      animationDuration: const Duration(milliseconds: 900),
      barBlur: 10,
      colorText: Colors.white,
      isDismissible: false,
    );
  }

  static Future<DateTime?> pickDate() async {
    DateTime? date;
    await showDatePicker(
            context: Get.context!, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2120))
        .then((pickedDate) {
      if (pickedDate == null) {
        return null;
      } else {
        date = pickedDate;
      }
    });
    return date;
  }

  static Future<String?> selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime(1999, 8, 9),
      firstDate: DateTime(1895),
      lastDate: DateTime(2005),
    );
    if (picked != null) {
      return DateFormat('yyyy-MM-dd').format(picked);
    }
    return null;
  }

  static String imageToBase64(path) {
    List<int> imageBytes = File(path).readAsBytesSync();
    return base64Encode(imageBytes);
  }

  static Future<void> showSheet({required Widget child}) {
    return showModalBottomSheet(
      context: Get.context!,
      backgroundColor: AppColor.white,
      elevation: 10,
      isDismissible: false,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.SPACE_16,
            vertical: Dimensions.SPACE_16,
          ),
          child: child,
        );
      },
    );
  }
}
