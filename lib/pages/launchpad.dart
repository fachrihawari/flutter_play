import 'package:flutter/material.dart';

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

class Launchpad extends StatelessWidget {
  const Launchpad({Key? key}) : super(key: key);

  final List<Page> pages = const [
    Page(name: "Todo", page: "todo", isAvailable: false),
    Page(name: "Calculator", page: "calculator", isAvailable: false),
    Page(name: "Tic Tac Toe", page: "tictactoe", isAvailable: false),
  ];

  void _handleItemTap(BuildContext context, Page item) {
    if (item.isAvailable) {
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(item.name),
          content: const Text("Coming soon!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
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
            onTap: () => _handleItemTap(context, item),
            title: Text(item.name),
          );
        },
      ),
    );
  }
}
