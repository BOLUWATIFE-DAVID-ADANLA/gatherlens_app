import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gatherlens/app/util/app_colors.dart';
import 'package:gatherlens/app/util/sizeconfig.dart';
import 'package:gatherlens/app/util/svg_util.dart';
import 'package:gatherlens/app/views/home_screen.dart';
import 'package:gatherlens/app/views/profile_view.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.selected)) {
                  return GoogleFonts.montserrat(
                    color: AppColors.orange,
                    fontSize: SizeConfig.fontSize(context, 12),
                    fontWeight: FontWeight.w700,
                  );
                }
                return GoogleFonts.montserrat(
                  color: AppColors.black,
                  fontSize: SizeConfig.fontSize(context, 12),
                  fontWeight: FontWeight.w700,
                );
              },
            ),
            indicatorColor: Colors.transparent),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentindex = index;
            });
          },
          selectedIndex: currentindex,
          backgroundColor: AppColors.white,
          destinations: const [
            NavigationDestination(
              icon: SvgAssets(
                svg: agenda,
                height: 20,
                width: 20,
              ),
              label: 'Albums',
              selectedIcon: SvgAssets(
                svg: agenda,
                height: 20,
                width: 20,
              ),
            ),
            // NavigationDestination(
            //   icon: const SvgAssets(svg: folder),
            //   label: '',
            //   selectedIcon: SvgAssets(
            //     svg: folder,
            //     colorFilter:
            //         ColorFilter.mode(AppColors.orange, BlendMode.srcIn),
            //   ),
            // ),
            NavigationDestination(
              icon: Icon(Icons.person_2_outlined),
              selectedIcon: Icon(
                Icons.person_2_outlined,
              ),
              label: 'profile',
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> pages = [
  const HomeScreen(),
  const ProfileView(),
];
