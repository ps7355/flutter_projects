import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone/common/widgets/loader.dart';
import 'package:whatsapp_clone/features/chat/controller/chat_controller.dart';
import 'package:whatsapp_clone/info.dart';
import 'package:whatsapp_clone/widgets/my_meassage_card.dart';
import 'package:whatsapp_clone/widgets/sender_message_card.dart';

// class MobileChatList extends StatelessWidget {
//   final String reciverid;
//   const MobileChatList(this.reciverid, {super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return StreamBuilder(
//         stream: ref.watch(ChatControllerProvider).getchat(reciverid),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return LoadingScreen();
//           }
//           return ListView.builder(
//             itemCount: snapshot.data?.length,
//             itemBuilder: (context, index) {
//               final chat = snapshot.data![index];
//               var time = DateFormat.Hm().format(chat.timeSent);

//               if (chat.senderId == FirebaseAuth.instance.currentUser!.uid) {
//                 return MyMessageCard(Message: chat.text, Date: time);
//               } else {
//                 return SenderMessageCard(Message: chat.text, Date: time);
//               }
//             },
//           );
//         });
//   }
// }

class MobileChatList extends ConsumerStatefulWidget {
  final String reciverid;
  const MobileChatList(this.reciverid, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MobileChatListState();
}

final ScrollController chatscroll = ScrollController();

@override
void dispose() {
  chatscroll.dispose();
}

class _MobileChatListState extends ConsumerState<MobileChatList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(ChatControllerProvider).getchat(widget.reciverid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          }
          SchedulerBinding.instance.addPostFrameCallback((_) {
            chatscroll.jumpTo(chatscroll.position.maxScrollExtent);
          });
          return ListView.builder(
            controller: chatscroll,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final chat = snapshot.data![index];
              var time = DateFormat.Hm().format(chat.timeSent);

              if (chat.senderId == FirebaseAuth.instance.currentUser!.uid) {
                return MyMessageCard(Message: chat.text, Date: time);
              } else {
                return SenderMessageCard(Message: chat.text, Date: time);
              }
            },
          );
        });
  }
}
