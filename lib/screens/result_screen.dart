import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TEMP: fake result
    final String result = "MISLEADING";

    Color getColor() {
      switch (result) {
        case "MISLEADING":
          return Colors.red;
        case "CHECK":
          return Colors.orange;
        default:
          return Colors.green;
      }
    }

    String getLabel() {
      switch (result) {
        case "MISLEADING":
          return "This content may be misleading";
        case "CHECK":
          return "Needs verification";
        default:
          return "Appears reliable";
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Scan Result")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.circle, color: getColor(), size: 100),
            const SizedBox(height: 20),
            Text(
              getLabel(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}