import 'package:al_quran_app/common/theme_bloc.dart';
import 'package:al_quran_app/presentation/pages/bookmark_page.dart';
import 'package:al_quran_app/presentation/pages/home_page.dart';
import 'package:al_quran_app/presentation/pages/prayer_schedule_page.dart';
import 'package:al_quran_app/presentation/routes/set_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    DateTime currentBackPressTime = DateTime.now();

    bottomNavigationBarItem({required iconPath, required label}) =>
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconPath,
            color: kOsloGrey,
          ),
          label: label,
          activeIcon: SvgPicture.asset(
            iconPath,
            color: kBlueViolet,
          ),
        );

    return BlocBuilder<SetPage, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: WillPopScope(
            onWillPop: () async {
              final difference =
                  DateTime.now().difference(currentBackPressTime);
              final exitWarning = difference >= const Duration(seconds: 2);
              currentBackPressTime = DateTime.now();
              if (exitWarning) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Tekan sekali lagi untuk keluar',
                      style:
                          kHeading6.copyWith(color: kBlueViolet, fontSize: 14),
                    ),
                  ),
                );
                return false;
              } else {
                return true;
              }
            },
            child: IndexedStack(
              index: currentIndex,
              children: const [
                HomePage(),
                PraySchedulePage(),
                BookmarkPage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: context.watch<ThemeBloc>().state ? kDark : kWhite,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            onTap: (value) => context.read<SetPage>().setPage(value),
            items: [
              bottomNavigationBarItem(
                iconPath: "assets/svg/quran-icon.svg",
                label: "quran",
              ),
              bottomNavigationBarItem(
                iconPath: "assets/svg/pray-icon.svg",
                label: "quran",
              ),
              bottomNavigationBarItem(
                iconPath: "assets/svg/bookmark-icon.svg",
                label: "quran",
              ),
            ],
          ),
        );
      },
    );
  }
}
