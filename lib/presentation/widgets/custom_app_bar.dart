import 'package:al_quran_app/common/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

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
          icon: SvgPicture.asset(
            iconPath.toString(),
            color: context.watch<ThemeBloc>().state ? kWhite : null,
          ),
          onPressed: onPressed,
        ),
        const SizedBox(width: 10),
        Text(
          title.toString(),
          style: kHeading5.copyWith(
            color: context.watch<ThemeBloc>().state ? kWhite : kBlueViolet,
          ),
        ),
        const Spacer(),
        BlocBuilder<ThemeBloc, bool>(
          builder: (context, state) {
            return FlutterSwitch(
              width: 80,
              height: 40,
              valueFontSize: 14,
              toggleSize: 35.0,
              value: state,
              borderRadius: 30,
              padding: 4,
              showOnOff: true,
              activeIcon: null,
              inactiveColor: kBlueViolet,
              activeColor: kMeteorite,
              onToggle: (val) =>
                  BlocProvider.of<ThemeBloc>(context).toggleTheme(value: val),
            );
          },
        )
      ],
    ),
  );
}
