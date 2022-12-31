import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/constants.dart';
import 'presentation/bloc/quran_bloc.dart';
import 'injection.dart' as injection;
import 'presentation/routes/app_routes.dart';

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
