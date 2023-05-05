import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/example.dart';
import 'package:whatsapp_clone/features/selectContacts/Screens/select_contact_Screen.dart';

import '../common/widgets/contact_list.dart';

class MobileLayoutScreen extends StatelessWidget {
  static const routeName = '/mobile-screen';
  const MobileLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            elevation: 0,
            title: const Text(
              "Whatsapp",
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
            bottom: const TabBar(
                indicatorColor: tabColor,
                labelColor: tabColor,
                unselectedLabelColor: greayColor,
                indicatorWeight: 4,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                tabs: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("CHATS"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("STATUS"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("CALLS"),
                  ),
                ]),
          ),
          body: ChatList(),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, ContactScreen.routeName);
              },
              backgroundColor: tabColor,
              child: Icon(Icons.message)),
        ));
  }
}
