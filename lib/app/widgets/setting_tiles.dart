import 'package:flutter/material.dart';
import 'package:gatherlens/app/util/app_colors.dart';
import 'package:gatherlens/app/util/sizeconfig.dart';
import 'package:gatherlens/app/widgets/apptext.dart';

class SettingTiles extends StatelessWidget {
  const SettingTiles(
      {super.key, this.ontap, required this.icon, required this.label});
  final String label;
  final IconData icon;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: AppColors.orange,
          ),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
              padding: EdgeInsets.all(SizeConfig.fromDesignHeight(context, 5)),
              color: AppColors.orangelight,
              child: Icon(icon)),
        ),
        title: AppTextBold(
          text: label,
          fontSize: 14,
          color: AppColors.black,
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
