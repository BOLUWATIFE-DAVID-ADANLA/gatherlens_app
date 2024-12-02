import 'package:flutter/material.dart';
import 'package:gatherlens/app/util/app_colors.dart';
import 'package:gatherlens/app/util/custom_padding.dart';
import 'package:gatherlens/app/util/sizeconfig.dart';
import 'package:gatherlens/app/widgets/app_spacing.dart';
import 'package:gatherlens/app/widgets/apptext.dart';
import 'package:gatherlens/app/widgets/custom_buttons.dart';
import 'package:gatherlens/app/widgets/setting_tiles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SymetricPadding(
        v: 0,
        h: 20,
        child: Column(
          children: [
            const AppSpacing(v: 20),
            // user details tile
            Container(
              padding: EdgeInsets.all(SizeConfig.fromDesignHeight(context, 25)),
              decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // username
                      AppTextBold(
                        text: 'emailBaby',
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                      AppTextBold(
                        text: 'email@gmail.com',
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  SmallButton(
                    label: 'View >',
                    ontap: () {},
                    color: AppColors.white,
                  )
                ],
              ),
            ),
            const AppSpacing(v: 20),

            SettingTiles(
              icon: Icons.settings,
              label: 'settings',
              ontap: () {},
            ),
            const AppSpacing(v: 20),
            SettingTiles(
              icon: Icons.book,
              label: 'Terms & Conditions',
              ontap: () {},
            ),

            const AppSpacing(v: 20),

            SettingTiles(
              icon: Icons.notifications,
              label: 'Notifications',
              ontap: () {},
            ),
            const AppSpacing(v: 60),

            LargeButon(label: 'Log out', ontap: () {})
          ],
        ),
      ),
    );
  }
}
