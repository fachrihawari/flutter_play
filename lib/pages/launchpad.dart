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

  final List<Page> _pages = const [
    Page(name: "Todo", page: "todo", isAvailable: true),
    Page(name: "Calculator", page: "calculator", isAvailable: false),
    Page(name: "Tic Tac Toe", page: "tictactoe", isAvailable: false),
  ];

  void _handleTap(BuildContext context, Page item) {
    context.pushNamed(item.page);
  }

  Widget _buildItem(BuildContext context, int index) {
    final item = _pages.elementAt(index);

    return ListTile(
      enabled: item.isAvailable,
      onTap: () => _handleTap(context, item),
      title: Text(item.name),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }

  Widget _buildSeparator(BuildContext _, int __) {
    return const Divider(height: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Play"),
      ),
      body: ListView.separated(
        itemCount: _pages.length,
        separatorBuilder: _buildSeparator,
        itemBuilder: _buildItem,
      ),
    );
  }
}
