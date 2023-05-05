import 'package:flutter/material.dart';

class groupmembers extends StatefulWidget {
  int ind;
  groupmembers(this.ind);

  @override
  State<groupmembers> createState() => _groupmembersState();
}

class _groupmembersState extends State<groupmembers> {
  dynamic dialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Container(
              height: 70,
              child: Column(
                children: [
                  TextField(
                    controller: _namecontroller,
                    decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      members.add(_namecontroller.text);
                      _namecontroller.clear();
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text("Save"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group ${widget.ind}"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: membercard(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        onPressed: (() {
          dialog(context);
        }),
      ),
    );
  }
}

final _namecontroller = TextEditingController();
List members = [];
ListView membercard() {
  return ListView.builder(
    itemCount: members.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(members[index]),
      );
    },
  );
}
