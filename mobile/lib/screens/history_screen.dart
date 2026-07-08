import 'package:flutter/material.dart';
import '../services/history_service.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final histories = HistoryService.getHistory();

    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: ListView.builder(
        itemCount: histories.length,
        itemBuilder: (context, index) {
          final item = histories[index];

          return ListTile(
            leading: const Icon(Icons.history),
            title: Text(item.speech),
            subtitle: Text(item.translation),
          );
        },
      ),
    );
  }
}