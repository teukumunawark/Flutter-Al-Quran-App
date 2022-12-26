import 'package:al_quran_app/common/route_observer.dart';
import 'package:al_quran_app/presentation/pages/home_page.dart';
import 'package:al_quran_app/presentation/pages/on_boarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/constants.dart';
import 'injection.dart' as inject;
import 'presentation/bloc/quran_bloc.dart';

void main() {
  inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => inject.locator<SurahListBloc>()),
        BlocProvider(create: (_) => inject.locator<DetailSurahBloc>())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Quran app",
        theme: ThemeData.light().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kBlueViolet,
          scaffoldBackgroundColor: kWhite,
          textTheme: kTextTheme,
        ),
        navigatorObservers: [routeObserver],
        initialRoute: OnBoardingPage.routeName,
        routes: {
          OnBoardingPage.routeName: (context) => const OnBoardingPage(),
          HomePage.routeName: (context) => const HomePage(),
        },
      ),
    );
  }
}
