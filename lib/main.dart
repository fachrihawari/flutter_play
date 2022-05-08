import 'package:flutter/material.dart';
import 'package:flutter_play/pages/error.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_play/pages/launchpad.dart';
import 'package:flutter_play/pages/todo.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Flutter Play',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'launchpad',
        builder: (context, state) => const LaunchpadPage(),
      ),
      GoRoute(
        path: '/todo',
        name: 'todo',
        builder: (context, state) => const TodoPage(),
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(state.error!),
  );
}
