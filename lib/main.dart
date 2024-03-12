import 'package:flutter/material.dart';
import 'package:p_catapi/src/presentation/landing/logic/cat_image_provider.dart';
import 'package:p_catapi/src/presentation/landing/logic/landing_provider.dart';
import 'package:p_catapi/src/presentation/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'services/dependency_injector.dart';
import 'src/presentation/landing/logic/search_provider.dart';
import 'src/presentation/landing/screens/landing_screen.dart';

Future<void> main() async {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<LandingProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<CatImageProvider>()),
        ChangeNotifierProvider.value(value: getIt<SearchProvider>()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/landing': (context) => const LandingScreen(),
          }),
    );
  }
}
