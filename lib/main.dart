import 'presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'core/di/di.dart';
import 'core/providers/theme_provider.dart';
import 'core/utils/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<ThemeProvider>(
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          /*translations: LocaleStrings(),*/
          locale: const Locale('sw', 'TZ'),
          /* supportedLocales: const [
            Locale('en', 'US'),
            Locale('sw', 'TZ'),
          ],*/
          home: SplashScreen(),
        );
      },
      create: (BuildContext context) {
        try {
          ThemeProvider();
        } catch (error) {
          rethrow;
        }
        return ThemeProvider();
      },
    );
  }
}
