import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page {
  final String name;
  final String page;
  final bool isAvailable;

  const Page({
    required this.name,
    required this.page,
    required this.isAvailable,
  });
}

class LaunchpadPage extends StatelessWidget {
  const LaunchpadPage({Key? key}) : super(key: key);

  final List<Page> pages = const [
    Page(name: "Todo", page: "todo", isAvailable: true),
    Page(name: "Calculator", page: "calculator", isAvailable: false),
    Page(name: "Tic Tac Toe", page: "tictactoe", isAvailable: false),
  ];

  void _handleItemTap(BuildContext context, Page item) {
    context.pushNamed(item.page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Play"),
      ),
      body: ListView.separated(
        itemCount: pages.length,
        separatorBuilder: (context, index) => const Divider(height: 0),
        itemBuilder: (context, index) {
          final item = pages.elementAt(index);

          return ListTile(
            enabled: item.isAvailable,
            onTap: () => _handleItemTap(context, item),
            title: Text(item.name),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          );
        },
      ),
    );
  }
}
