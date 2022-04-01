import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:way_for_ball/utils/router.dart';
import 'package:url_strategy/url_strategy.dart';

import 'utils/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefUtils.init();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  AppRouter router = AppRouter();

  @override
  void initState() {
    super.initState();
    SharedPrefUtils.volume = "66";
    SharedPrefUtils.playerLevel = "0";

    final userPrefs = SharedPrefUtils.getAllUserPrefs();
    log(jsonEncode(userPrefs));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      navigatorKey: navigatorKey,
      onGenerateRoute: router.generateRoute,
      onGenerateTitle: (_) => 'Way For Ball',
      initialRoute: '',
    );
  }
}
