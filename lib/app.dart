import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noteworthy/routes/home_route.dart';

class Noteworthy extends StatelessWidget {
  const Noteworthy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Noteworthy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routerConfig: GoRouter(
        initialLocation: "/",
        routes: [
          GoRoute(
            path: "/",
            builder: (context, state) => const HomeRoute(),
          ),
        ],
      ),
    );
  }
}
