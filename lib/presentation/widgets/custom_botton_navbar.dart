import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/constants.dart';

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

bottomNavigationBar() => BottomNavigationBar(
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      backgroundColor: kWhite,
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
    );
