import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
class Fieldtext extends StatelessWidget {
  final bool obsec;
  final String hint;
  final Widget? inp;
  final Widget? prefix;
  final Function(String?)? onSave;
  final Function(String?)? onChange;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardtype;

  final TextEditingController? controller;

   Fieldtext(
      {Key? key,
        this.onChange,
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
          style: TextStyle(color: kwhitelikangrey)  ,
          controller: controller,
          onSaved: onSave,
          onChanged: onChange,
          validator: validator,
          obscureText: obsec,
          keyboardType: keyboardtype,
          decoration: InputDecoration(
            filled: true, //<-- SEE HERE
            fillColor: kbluelikanwhite,
            suffixIcon: inp,
            prefixIcon: prefix,
            // IconButton(
            //   icon: Icon(Icons.visibility_off, color: kTextFieldHintTextColor),
            //   onPressed: () {},
            // ),
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color:  kwhitelikangrey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: kwhitelikangrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: kbluelikanwhite,
              ),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(20.28, 15, 10, 15),
          ),
          cursorColor: knewred,
        ),
      ],
    );
  }
}
