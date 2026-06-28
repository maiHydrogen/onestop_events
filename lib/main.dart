import 'package:flutter/material.dart';
import 'package:onestop_events/onestop_events.dart';
import 'package:onestop_events/src/core/di/injection_container.dart';
import 'package:onestop_events/src/core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initEventsPackage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Onestop Events',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // We will integrate OColors from onestop_ui here later if needed
      ),
      // 5. Plug in the GoRouter instance we defined in app_router.dart
      routerConfig: AppRouter.router,
    );
  }
}