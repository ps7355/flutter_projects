import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/common/widgets/contact_list.dart';
import 'package:whatsapp_clone/common/widgets/loader.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/info.dart';
import 'package:whatsapp_clone/widgets/chat_list.dart';

import '../../../widgets/botom_text_field.dart';

class chatScreen extends ConsumerWidget {
  static const String routeName = 'chat-screen';
  final String name;
  final String uid;
  const chatScreen({Key? key, required this.name, required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: StreamBuilder(
          stream: ref.watch(AuthControllerProvider).getOnlineData(uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingScreen();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                SizedBox(
                  height: 5,
                ),
                Text(
                  snapshot.data!.isOnline ? 'online' : 'ofline',
                  style: TextStyle(fontSize: 13),
                )
              ],
            );
          },
        ),
        actions: const [
          Icon(
            Icons.call_sharp,
            size: 25,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.more_vert,
            size: 30,
          ),
        ],
      ),
      body: Column(
        children: [Expanded(child: MobileChatList(uid)), BottomTextField(uid)],
      ),
    );
  }
}
