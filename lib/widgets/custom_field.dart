import 'package:chat/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.validator,  this.controller,
  });
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        validator: validator,
        style: GoogleFonts.montserrat(color: Colors.black),
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
            hintText: hintText,
            labelText: labelText,
            hintStyle: GoogleFonts.montserrat(color: mainColor),
            labelStyle: GoogleFonts.montserrat(color: mainColor),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.cyan,width: 1.5),
                borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
