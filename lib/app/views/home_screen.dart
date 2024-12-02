import 'package:flutter/material.dart';
import 'package:gatherlens/app/routes/app_routes.dart';
import 'package:gatherlens/app/util/app_colors.dart';
import 'package:gatherlens/app/util/custom_padding.dart';
import 'package:gatherlens/app/widgets/app_spacing.dart';
import 'package:gatherlens/app/widgets/app_textfields.dart';
import 'package:gatherlens/app/widgets/apptext.dart';
import 'package:gatherlens/app/widgets/custom_buttons.dart';
import 'package:gatherlens/app/widgets/custom_modals.dart';
import 'package:gatherlens/app/widgets/room_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController roomNameController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SymetricPadding(
          v: 0,
          h: 20,
          child: Column(
            children: [
              const AppSpacing(
                v: 20,
              ),
              // app bar and createPhot room button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTextBold(text: 'Albums', fontSize: 20),
                  FilterButton(
                    label: 'Create Album',
                    ontap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (_) =>
                              CustomModal(size: 'ultra small', children: [
                                const AppSpacing(v: 10),
                                const ModalToggle(),
                                const AppSpacing(v: 50),
                                GenTextField(
                                  hintext: 'Enter room name',
                                  controller: roomNameController,
                                ),
                                const AppSpacing(v: 20),

                                // create room button
                                LargeButon(label: 'Create room', ontap: () {})
                              ]));
                    },
                    color: AppColors.orange,
                    textcolor: AppColors.white,
                  )
                ],
              ),
              const AppSpacing(
                v: 20,
              ),
              // this display all the photo rooms a user is part of
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return RoomTile(
                      ontap: () {
                        Navigator.pushNamed(context, AppRoutes.photoRoom);
                      },
                      dateCreated: 'aug 30',
                      noOfPhotosInRoom: 500.toString(),
                      roomName: 'bolu birhtday',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
