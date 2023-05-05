import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/features/chat/controller/chat_controller.dart';
import '../colors.dart';

class BottomTextField extends ConsumerStatefulWidget {
  final String reciverUserId;
  const BottomTextField(this.reciverUserId, {super.key});

  @override
  ConsumerState<BottomTextField> createState() => _BottomTextFieldState();
}

class _BottomTextFieldState extends ConsumerState<BottomTextField> {
  bool tapped = false;
  final TextEditingController TextController = TextEditingController();

  void SendTextMessage() async {
    if (tapped) {
      ref.read(ChatControllerProvider).sendMessage(
          context: context,
          reciverUserId: widget.reciverUserId,
          Text: TextController.text);
    }
    setState(() {
      TextController.text = '';
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    TextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: ((value) {
              if (value.isNotEmpty) {
                setState(() {
                  tapped = true;
                });
              } else {
                setState(() {
                  tapped = false;
                });
              }
            }),
            decoration: InputDecoration(
              hintText: 'Message',
              filled: true,
              fillColor: chatBarMessage,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              // prefixIcon: Icon(
              //   Icons.emoji_emotions,
              //   color: greayColor,
              // ),
              // suffixIcon: Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Icon(Icons.photo_camera_back_rounded, color: greayColor),
              //       SizedBox(
              //         width: 9,
              //       ),
              //       Icon(Icons.attach_file, color: greayColor),
              //     ],
              //   ),
              // )
            ),
            controller: TextController,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          child: CircleAvatar(
              maxRadius: 25,
              backgroundColor: tabColor,
              child: Icon(
                tapped ? Icons.send : Icons.mic,
                color: Colors.white,
              )),
          onTap: SendTextMessage,
        )
      ],
    );
  }
}



 
 
 
 
 
 
 
 
  // return Row(
  //   children: [
  //     Expanded(
  //       child: SizedBox(
  //         child: TextField(
  //           cursorColor: Colors.white,
  //           decoration: InputDecoration(
  //               hintStyle: TextStyle(color: Colors.white),
  //               filled: true,
  //               fillColor: chatBarMessage,
  //               hintText: "Message",
  //               prefixIcon: Icon(
  //                 Icons.emoji_emotions,
  //                 color: greayColor,
  //               ),
  //               suffixIcon: Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 20),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     Icon(Icons.photo_camera_back_rounded, color: greayColor),
  //                     Icon(Icons.attach_file, color: greayColor),
  //                   ],
  //                 ),
  //               )),
  //         ),
  //       ),
  //     ),
  //     CircleAvatar(
  //       backgroundColor: Colors.white,
  //     )
  //   ],
  // );

