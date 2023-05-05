import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/widgets/contact_list.dart';

class render extends StatelessWidget {
  const render({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChatList(),
    );
  }
}
