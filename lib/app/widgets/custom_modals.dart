import 'package:flutter/material.dart';
import 'package:gatherlens/app/util/app_colors.dart';
import 'package:gatherlens/app/util/sizeconfig.dart';

class CustomModal extends StatefulWidget {
  final List<Widget> children;
  final String size;
  final CrossAxisAlignment crossAxisAlignment;

  const CustomModal({
    super.key,
    required this.children,
    required this.size,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  State<CustomModal> createState() => _CustomModalState();
}

class _CustomModalState extends State<CustomModal> {
  static const double bigHeight = 550;
  static const double mediumHeight = 450;
  static const double smallHeight = 355;
  static const double ultraSmallHeight = 245;

  double getHeight() {
    switch (widget.size.toLowerCase()) {
      case 'big':
        return SizeConfig.fromDesignHeight(context, bigHeight);
      case 'medium':
        return SizeConfig.fromDesignHeight(context, mediumHeight);
      case 'small':
        return SizeConfig.fromDesignHeight(context, smallHeight);
      case 'ultra small':
        return SizeConfig.fromDesignHeight(context, ultraSmallHeight);
      default:
        return MediaQuery.of(context).viewInsets.bottom +
            SizeConfig.fromDesignHeight(context, smallHeight);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: getHeight(),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.fromDesignWidth(context, 20),
          ),
          child: Column(
            crossAxisAlignment: widget.crossAxisAlignment,
            children: widget.children,
          ),
        ),
      ),
    );
  }
}

class ModalToggle extends StatelessWidget {
  const ModalToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.fromDesignHeight(context, 5),
      width: SizeConfig.fromDesignWidth(context, 42),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
    );
  }
}
