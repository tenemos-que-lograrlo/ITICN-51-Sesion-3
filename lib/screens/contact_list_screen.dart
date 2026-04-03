import 'package:flutter/material.dart';
import 'contact_detail_screen.dart';
import 'add_contact_screen.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => ContactListScreenState();
}

class ContactListScreenState extends State<ContactListScreen> {
  List<Map<String, String>> contacts = [];

  void addContact(Map<String, String> newContact) {
    setState(() {
      contacts.add(newContact);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contactos")),
      body: contacts.isEmpty
          ? const Center(child: Text("No hay contactos registrados"))
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text("${contact["name"]} ${contact["lastname"]}"),
                  subtitle: Text("${contact["phone"]} • ${contact["type"]}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ContactDetailScreen(contact: contact),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddContactScreen(onAdd: addContact),
            ),
          );
        },
      ),
    );
  }
}
