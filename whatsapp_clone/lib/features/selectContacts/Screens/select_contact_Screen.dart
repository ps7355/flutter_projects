import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/common/widgets/error.dart';
import 'package:whatsapp_clone/common/widgets/loader.dart';
import 'package:whatsapp_clone/features/selectContacts/controller/select_contact_controller.dart';

class ContactScreen extends ConsumerWidget {
  static const String routeName = '/contact-screen';
  const ContactScreen({super.key});

  void selectedContact(WidgetRef ref,BuildContext context,Contact selectedContact ){
    ref.read(selectContactControllerProvider).getcontacts(selectedContact, context);
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        title: const Text(
          "Select Contacts",
          style: TextStyle(
              color: greayColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: greayColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            color: greayColor,
          ),
        ],
      ),
      body: ref.watch(getContactProvider).when(
          data: (contactList) {
            return ListView.builder(
              itemCount: contactList.length,
              itemBuilder: (context, index) {
                final Contacts = contactList[index];
                return InkWell(
                  onTap:()=> selectedContact(ref,context,Contacts),
                  child: ListTile(
                    title: Text(Contacts.displayName),
                  ),
                );
              },
            );
          },
          error: ((error, stackTrace) {
            ErrorScreen(
              error: error.toString(),
            );
          }),
          loading: () => LoadingScreen()),
    );
  }
}
