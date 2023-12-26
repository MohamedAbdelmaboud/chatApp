import 'package:chat/constants/constants.dart';
import 'package:chat/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final void Function()? onPressed;
  final Color? backgroundColor;
  const MyButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isLoading = false,
      this.backgroundColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: backgroundColor,
            elevation: 10,
            fixedSize: const Size(120, 40)),
        child: isLoading
            ? const SpinKitDualRing(
                color: mainColor,
                lineWidth: 2,
                size: 30,
              )
            : CustomText(
                text,
                fontSize: 18,
                color: mainColor,
                fontWeight: FontWeight.normal,
              ));
  }
}
