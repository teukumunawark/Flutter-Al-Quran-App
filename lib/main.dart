import 'package:al_quran_app/common/route_observer.dart';
import 'package:al_quran_app/presentation/pages/detail_page.dart';
import 'package:al_quran_app/presentation/pages/home_page.dart';
import 'package:al_quran_app/presentation/pages/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/constants.dart';
import 'presentation/bloc/quran_bloc.dart';
import 'injection.dart' as injection;

void main() {
  injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => injection.locator<SurahListBloc>()),
        BlocProvider(create: (_) => injection.locator<DetailSurahBloc>())
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
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case SplashScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const SplashScreen(),
              );
            case HomePage.routeName:
              return MaterialPageRoute(
                builder: (context) => const HomePage(),
              );
            case DetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (context) => DetailPage(id: id),
              );
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
