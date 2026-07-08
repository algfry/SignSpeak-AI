import 'package:flutter/material.dart';
class StatusBar extends StatelessWidget {

  final String status;

  const StatusBar({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Status : $status",
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}