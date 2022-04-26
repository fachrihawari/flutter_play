import 'package:flutter/material.dart';

class Page {
  final String name;
  final String page;

  const Page({required this.name, required this.page});
}

class Launchpad extends StatelessWidget {
  const Launchpad({Key? key}) : super(key: key);

  final List<Page> pages = const [
    Page(name: "Simple Calculator", page: "simple_calculator"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Play"),
      ),
      body: ListView.separated(
        itemCount: pages.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = pages.elementAt(index);

          return ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text(item.name),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
            title: Text(item.name),
          );
        },
      ),
    );
  }
}
