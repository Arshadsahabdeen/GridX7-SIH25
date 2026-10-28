import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const AlertCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Icon(Icons.warning, color: data['severity'] == 'CRITICAL' ? Colors.red : Colors.orange),
        title: Text(data['type'] ?? "Alert"),
        subtitle: Text(data['message'] ?? ""),
        trailing: Text(
          (data['timestamp'] as DateTime?)?.toLocal().toString().split('.')[0] ?? "",
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
