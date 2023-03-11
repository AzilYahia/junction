import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
class Fieldtext extends StatelessWidget {
  final bool obsec;
  final String hint;
  final Widget? inp;
  final Widget? prefix;
  final Function(String?)? onSave;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardtype;

  final TextEditingController? controller;

  const Fieldtext(
      {Key? key,
        this.obsec = true,
        this.hint = '',
        this.inp,
        this.onSave,
        this.validator,
        this.keyboardtype,
        this.prefix,
        this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          onSaved: onSave,
          validator: validator,
          obscureText: obsec,
          keyboardType: keyboardtype,
          decoration: InputDecoration(
            filled: true, //<-- SEE HERE
            fillColor: kwhite,
            suffixIcon: inp,
            prefixIcon: prefix,
            // IconButton(
            //   icon: Icon(Icons.visibility_off, color: kTextFieldHintTextColor),
            //   onPressed: () {},
            // ),
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color:  kgrey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: kgrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: kwhite,
              ),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(20.28, 18, 10, 18),
          ),
          cursorColor: kgreen,
        ),
      ],
    );
  }
}
