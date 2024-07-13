import 'package:beerescue_mobile/features/controller/provider/datetime-provider.dart';
import 'package:beerescue_mobile/features/controller/provider/location-provider.dart';
import 'package:beerescue_mobile/features/view/screen/main-screen.dart';
import 'package:beerescue_mobile/shared/theme/dark-theme.dart';
import 'package:beerescue_mobile/shared/theme/light-theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/controller/provider/filtering-provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DateTimeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FilteringProvider(),
        ),
      ],
      child: buildMaterialApp(),
    );
  }

  MaterialApp buildMaterialApp() => MaterialApp(
      title: 'Bee Rescue',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: MainScreen());
}
