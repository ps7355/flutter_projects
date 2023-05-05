import 'package:flutter/material.dart';
import 'package:seitu/Pages/groupno.dart';

class Groups extends StatefulWidget {
  const Groups({super.key});

  @override
  State<Groups> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  int gno = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: goupcard(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          setState(() {
            grous.add('Group ${gno}');
            gno++;
          });
        },
      ),
    );
  }
}

List grous = [];

Widget goupcard() {
  return ListView.builder(
    itemCount: grous.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(grous[index]),
        leading: Icon(Icons.person),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => groupmembers(index + 1)));
        },
      );
    },
  );
}

List<Widget> groupies = [];
