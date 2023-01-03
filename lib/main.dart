import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'common/theme_bloc.dart';
import 'presentation/bloc/quran_bloc.dart';
import 'presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'common/constants.dart';
import 'injection.dart' as injection;
import 'presentation/routes/set_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

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
        BlocProvider(
          create: (_) => injection.locator<SetPage>(),
        ),
        BlocProvider(
          create: (_) => injection.locator<ThemeBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "Quran app",
            themeMode: state ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData.dark().copyWith(
              backgroundColor: kDark,
              colorScheme: kColorSchemeDark,
              primaryColor: kDark,
              scaffoldBackgroundColor: kDark,
              textTheme: kTextTheme,
            ),
            theme: ThemeData.light().copyWith(
              backgroundColor: kWhite,
              colorScheme: kColorSchemeLight,
              primaryColor: kWhite,
              scaffoldBackgroundColor: kWhite,
              textTheme: kTextTheme,
            ),
            routerConfig: router,
          );
        },
      ),
    );
  }
}
