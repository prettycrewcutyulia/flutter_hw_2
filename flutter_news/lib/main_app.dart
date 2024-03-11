import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/views/news_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/theme/theme_model.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    _saveLocale(context.locale.languageCode);
    return ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer<ThemeModel>(
            builder: (context, ThemeModel themeNotifier, child) {
              return MaterialApp(
                locale: context.locale,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                title: 'Flutter News',
                debugShowCheckedModeBanner: false,
                theme: themeNotifier.isDark ? darkTheme : lightTheme,
                home: const NewsAppBar(),
              );
            }));
  }

  void _saveLocale(String locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale);
  }
}
