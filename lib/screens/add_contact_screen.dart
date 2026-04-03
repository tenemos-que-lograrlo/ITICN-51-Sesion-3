import 'package:flutter/material.dart';

class AddContactScreen extends StatefulWidget {
  final Function(Map<String, String>) onAdd;

  const AddContactScreen({super.key, required this.onAdd});

  @override
  State<AddContactScreen> createState() => AddContactScreenState();
}

class AddContactScreenState extends State<AddContactScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  String contactType = "Personal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nuevo contacto")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nombre"),
            ),
            TextField(
              controller: lastnameController,
              decoration: const InputDecoration(labelText: "Apellidos"),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: "Teléfono"),
              keyboardType: TextInputType.phone,
            ),
            DropdownButtonFormField<String>(
              initialValue: contactType,
              decoration: const InputDecoration(labelText: "Tipo de contacto"),
              items: ["Personal", "Trabajo", "Familia"]
                  .map((tipo) => DropdownMenuItem(
                        value: tipo,
                        child: Text(tipo),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  contactType = value!;
                });
              },
            ),
            TextField(
              controller: notesController,
              decoration: const InputDecoration(labelText: "Notas"),
              maxLines: 3,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text("Guardar contacto"),
              onPressed: () {
                final newContact = {
                  "name": nameController.text,
                  "lastname": lastnameController.text,
                  "phone": phoneController.text,
                  "type": contactType,
                  "notes": notesController.text,
                };
                widget.onAdd(newContact);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
