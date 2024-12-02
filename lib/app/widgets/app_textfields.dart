import 'package:flutter/material.dart';
import 'package:gatherlens/app/util/app_colors.dart';
import 'package:gatherlens/app/util/sizeconfig.dart';
import 'package:gatherlens/app/widgets/app_spacing.dart';
import 'package:gatherlens/app/widgets/apptext.dart';
import 'package:google_fonts/google_fonts.dart';

class Authtextfield extends StatelessWidget {
  const Authtextfield(
      {super.key,
      this.validator,
      required this.hintext,
      required this.obscureText,
      required this.controller,
      this.onChanged,
      this.suffixIcon,
      this.textInputType,
      required this.label});
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String label;
  final bool obscureText;
  final String hintext;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextSemiBold(text: label, fontSize: 14),
        const AppSpacing(
          v: 10,
        ),
        TextFormField(
          style: const TextStyle(
            decoration: TextDecoration.none,
            decorationThickness: 0,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          validator: validator,
          cursorColor: AppColors.black,
          decoration: InputDecoration(
            hintText: hintext,
            hintStyle: GoogleFonts.montserrat(
              color: AppColors.black,
              fontSize: SizeConfig.fontSize(context, 14),
              fontWeight: FontWeight.normal,
            ),
            labelStyle: GoogleFonts.montserrat(
              color: AppColors.black,
              fontSize: SizeConfig.fontSize(context, 14),
              fontWeight: FontWeight.normal,
            ),
            errorStyle: GoogleFonts.poppins(
              color: Colors.red,
              fontSize: SizeConfig.fontSize(context, 12),
              fontWeight: FontWeight.normal,
            ),
            constraints: BoxConstraints(
              maxHeight: SizeConfig.fromDesignHeight(context, 70),
              minHeight: SizeConfig.fromDesignHeight(
                context,
                42,
              ),
            ),
            suffixIcon: suffixIcon,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.black,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.black,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class GenTextField extends StatelessWidget {
  const GenTextField({
    super.key,
    this.validator,
    required this.hintext,
    required this.controller,
    this.onChanged,
    this.suffixIcon,
    this.textInputType,
  });
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String hintext;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        decoration: TextDecoration.none,
        decorationThickness: 0,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      cursorColor: AppColors.black,
      decoration: InputDecoration(
        hintText: hintext,
        hintStyle: GoogleFonts.montserrat(
          color: AppColors.black,
          fontSize: SizeConfig.fontSize(context, 14),
          fontWeight: FontWeight.normal,
        ),
        constraints: BoxConstraints(
          maxHeight: SizeConfig.fromDesignHeight(context, 70),
          minHeight: SizeConfig.fromDesignHeight(
            context,
            42,
          ),
        ),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
