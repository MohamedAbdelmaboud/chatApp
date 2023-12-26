import 'package:chat/widgets/custom_text.dart';
import 'package:flutter/material.dart';

void showSnakeBar(BuildContext context, String massage,{bool isError=true}) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(
      content: Center(
        child: CustomText(
          massage,
        ),
      ),
      backgroundColor:isError?Colors.red : Colors.green,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
    ));
}

