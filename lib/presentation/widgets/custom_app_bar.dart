import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/constants.dart';

PreferredSizeWidget appBar(
  BuildContext context, {
  String? title = "Quran App",
  String? iconPath = 'assets/svg/menu-icon.svg',
  Function()? onPressed,
}) {
  final size = MediaQuery.of(context).size;
  return AppBar(
    elevation: 0,
    toolbarHeight: size.height * 0.09,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        IconButton(
          icon: SvgPicture.asset(iconPath.toString()),
          onPressed: onPressed,
        ),
        const SizedBox(width: 24),
        Text(
          title.toString(),
          style: kHeading5.copyWith(color: kBlueViolet),
        ),
        const Spacer(),
        IconButton(
          icon: SvgPicture.asset('assets/svg/search-icon.svg'),
          onPressed: () {},
        ),
      ],
    ),
  );
}
