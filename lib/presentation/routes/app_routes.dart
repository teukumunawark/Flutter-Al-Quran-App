import 'package:al_quran_app/presentation/pages/detail_juz_page.dart';
import 'package:al_quran_app/presentation/pages/detail_surah_page.dart';
import 'package:al_quran_app/presentation/pages/home_page.dart';
import 'package:al_quran_app/presentation/pages/main_page.dart';
import 'package:al_quran_app/presentation/pages/on_boarding_page.dart';
import 'package:al_quran_app/presentation/pages/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: 'splash',
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const SplashScreen(),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      name: 'onboard',
      path: '/onboard',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const OnBoardingPage(),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      name: 'main',
      path: '/main',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const MainPage(),
        transitionDuration: const Duration(milliseconds: 150),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const HomePage(),
        transitionDuration: const Duration(milliseconds: 150),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      name: 'detail-surah',
      path: '/detail-surah/:id',
      pageBuilder: (context, state) {
        String id = int.parse(state.params['id']!).toString();
        return CustomTransitionPage(
          key: state.pageKey,
          child: DetailSurahPage(id: id),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: 'detail-juz',
      path: '/detail-juz/:id',
      pageBuilder: (context, state) {
        String id = int.parse(state.params['id']!).toString();
        return CustomTransitionPage(
          key: state.pageKey,
          child: DetailJuzPage(id: id),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
  ],
);
