import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/quran_bloc.dart';
import 'presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'common/constants.dart';
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
        BlocProvider(
          create: (_) => injection.locator<SurahListBloc>(),
        ),
        BlocProvider(
          create: (_) => injection.locator<JuzListBloc>(),
        ),
        BlocProvider(
          create: (_) => injection.locator<DetailSurahBloc>(),
        ),
        BlocProvider(
          create: (_) => injection.locator<DetailJuzBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Quran app",
        theme: ThemeData.light().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kBlueViolet,
          scaffoldBackgroundColor: kWhite,
          textTheme: kTextTheme,
        ),
        routerConfig: router,
      ),
    );
  }
}
