import 'package:al_quran_app/presentation/pages/detail_page.dart';
import 'package:al_quran_app/presentation/pages/home_page.dart';
import 'package:al_quran_app/presentation/pages/on_boarding_page.dart';
import 'package:al_quran_app/presentation/pages/splash_screen_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: 'splash',
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: 'onboard',
      path: '/onboard',
      builder: (context, state) => const OnBoardingPage(),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
        name: 'detail',
        path: '/detail/:id',
        builder: (context, state) {
          int id = int.parse(state.params['id']!);
          return DetailPage(id: id);
        }),
  ],
);
