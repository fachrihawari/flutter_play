import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  final Exception error;

  const ErrorPage(this.error, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
      ),
      body: Column(
        children: [
          SelectableText(error.toString()),
          TextButton(
            onPressed: () => context.go('/'),
            child: const Text('Home'),
          ),
        ],
      ),
    );
  }
}
