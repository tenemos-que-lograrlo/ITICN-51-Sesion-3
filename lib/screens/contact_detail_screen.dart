import 'package:flutter/material.dart';

class ContactDetailScreen extends StatelessWidget {
  final Map<String, String> contact;

  const ContactDetailScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detalle de contacto")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${contact["name"]} ${contact["lastname"]}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text("Teléfono: ${contact["phone"]}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text("Tipo: ${contact["type"]}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text("Notas: ${contact["notes"]}", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
