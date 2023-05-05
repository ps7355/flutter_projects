import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/common/widgets/loader.dart';
import 'package:whatsapp_clone/example.dart';
import 'package:whatsapp_clone/features/chat/controller/chat_controller.dart';
import 'package:whatsapp_clone/features/chat/screens/chat_screen.dart';
import 'package:whatsapp_clone/model/chat_contact_model.dart';

class ChatList extends ConsumerWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<Stream<List<ChatContactModel>>> getit() async {
      return await ref.watch(ChatControllerProvider).getcontacts();
    }

    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: StreamBuilder<List<ChatContactModel>>(
          stream: ref.watch(ChatControllerProvider).getcontacts(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return LoadingScreen();
            } else
              return ListView.builder(
                  itemCount: snap.data?.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, chatScreen.routeName,
                                arguments: {
                                  'name': snap.data![index].name,
                                  'uid': snap.data![index].contactId
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              title: Text(snap.data![index].name as String),
                              subtitle: Padding(
                                padding: EdgeInsets.only(top: 6),
                                child: Text(
                                    snap.data![index].lastMessage as String),
                              ),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    snap.data![index].profilepic as String),
                              ),
                              trailing: Text(DateFormat.Hm()
                                  .format(snap.data![index].timesent)),
                            ),
                          ),
                        ),
                        Divider(
                          indent: 80,
                          color: dividerColor,
                        ),
                      ],
                    );
                  });
          }),
    );
  }
}
