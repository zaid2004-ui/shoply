import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/routes/app_routes.dart';
import 'package:shoply_app/core/utils/theme/app_theme.dart';
import 'package:shoply_app/l10n/app_localizations.dart';

class ShoplyApp extends StatelessWidget {
  const ShoplyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoply App',
      locale: Locale('en'),

      localizationsDelegates: [
        ...AppLocalizations.localizationsDelegates,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: [Locale('en'), Locale('ar')],

      // Set the navigator key and route generator
      navigatorKey: AppRoutes.navigatorKey,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: AppPages.splashScreen,
      // Disable the debug banner
      debugShowCheckedModeBanner: false,
      // Set the light and dark themes
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
