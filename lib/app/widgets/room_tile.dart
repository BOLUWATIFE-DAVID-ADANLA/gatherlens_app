import 'package:flutter/material.dart';
import 'package:gatherlens/app/util/app_colors.dart';
import 'package:gatherlens/app/util/sizeconfig.dart';
import 'package:gatherlens/app/widgets/app_spacing.dart';
import 'package:gatherlens/app/widgets/apptext.dart';

class RoomTile extends StatelessWidget {
  const RoomTile(
      {super.key,
      this.dateCreated,
      this.noOfPhotosInRoom,
      this.roomName = '',
      this.ontap});
  final String roomName;
  final String? noOfPhotosInRoom;
  final String? dateCreated;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: SizeConfig.fromDesignHeight(context, 10),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.fromDesignHeight(context, 9),
            vertical: SizeConfig.fromDesignHeight(context, 10)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.orange)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.fromDesignHeight(context, 70),
              width: SizeConfig.fromDesignWidth(context, 5),
              decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(20)),
            ),
            const AppSpacing(
              h: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // room name
                AppTextBold(text: roomName, fontSize: 16),
                // number of photos in the room and date
                AppTextSemiBold(
                    text: '$noOfPhotosInRoom photos . $dateCreated',
                    fontSize: 12),
              ],
            )
          ],
        ),
      ),
    );
  }
}
