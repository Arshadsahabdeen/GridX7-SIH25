import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/alert_card.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    final alerts = FirebaseFirestore.instance
        .collection('alerts')
        .orderBy('timestamp', descending: true)
        .snapshots();

    return Scaffold(
      appBar: AppBar(title: const Text("Admin Dashboard")),
      body: Column(
        children: [
          // Example Grid Info
          Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: const Text("Total Solar Output"),
              subtitle: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('energy_readings')
                    .orderBy('timestamp', descending: true)
                    .limit(1)
                    .snapshots(),
                builder: (context, snap) {
                  if (!snap.hasData) return const Text("Loading...");
                  final solar = snap.data!.docs.first['solar_power_W'];
                  return Text("$solar W");
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text("All Alerts"),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: alerts,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                final docs = snapshot.data!.docs;
                return ListView(
                  children: docs.map((doc) => AlertCard(data: doc.data() as Map<String, dynamic>)).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
