import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/alert_card.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    final alerts = FirebaseFirestore.instance
        .collection('alerts')
        .where('affectedUserId', isEqualTo: "demoUser") // TODO: use actual uid
        .orderBy('timestamp', descending: true)
        .snapshots();

    return Scaffold(
      appBar: AppBar(title: const Text("User Dashboard")),
      body: Column(
        children: [
          // Example Energy Card
          Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: const Text("Battery SOC"),
              subtitle: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('energy_readings')
                    .orderBy('timestamp', descending: true)
                    .limit(1)
                    .snapshots(),
                builder: (context, snap) {
                  if (!snap.hasData) return const Text("Loading...");
                  final soc = snap.data!.docs.first['battery_soc'];
                  return Text("$soc%");
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text("Recent Alerts"),
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
