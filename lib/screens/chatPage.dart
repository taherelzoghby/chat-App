import '../adabtiveWidget/adabtiveCircularIndicator.dart';
import '../adabtiveWidget/adabtiveTextField.dart';
import '../constants.dart';
import 'login.dart';
import 'widgets/chatBubbForFriends.dart';
import 'widgets/chatBubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../adabtiveWidget/adabtiveEmptyButton.dart';
import '../models/message.dart';

class chatPage extends StatelessWidget {
  static String id = "chatPage";
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessages);
  TextEditingController _textController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    //username
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final width = MediaQuery.of(context).size.width;
    if (getOs() == 'android') {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: pColor,
          leading: adabtiveEmptyButton(
            on_tap: () =>
                Navigator.of(context).pushReplacementNamed(loginPage.id),
            widget: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Row(
            children: [
              CircleAvatar(),
              SizedBox(
                width: width * .08,
              ),
              Text(
                data['name'],
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            //list of messages
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    messages.orderBy(createdAt, descending: true).snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Message> messages_lists = [];
                    for (int i = 0; i < snapshot.data!.docs.length; i++) {
                      messages_lists
                          .add(Message.fromJson(snapshot.data!.docs[i]));
                    }
                    return ListView.builder(
                      reverse: true,
                      controller: _scrollController,
                      itemCount: messages_lists.length,
                      itemBuilder: (BuildContext context, int index) {
                        return data[kId] == messages_lists[index].email
                            ? chatBubb(mes: messages_lists[index])
                            : chatBubbForFriends(mes: messages_lists[index]);
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            //field ->type a messsage
            Padding(
              padding: isLandScape
                  ? const EdgeInsets.symmetric(vertical: 3, horizontal: 5)
                  : const EdgeInsets.all(10),
              child: adabtiveTextField(
                hint: 'Type a message',
                textController: _textController,
                suffixIcon: IconButton(
                  onPressed: () {
                    messages.add({
                      kMessage: _textController.text,
                      kId: data[kId],
                      createdAt: DateTime.now(),
                    });
                    //to scroll end when send message
                    _scrollDown();
                    //to clear field after send message
                    _textController.clear();
                  },
                  icon: Icon(Icons.send),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: adabtiveEmptyButton(
            on_tap: () =>
                Navigator.of(context).pushReplacementNamed(loginPage.id),
            widget: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          middle: Row(
            children: [
              CircleAvatar(),
              SizedBox(width: width * .08),
              Text(data['name']),
            ],
          ),
        ),
        child: Column(
          children: [
            //list of messages
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    messages.orderBy(createdAt, descending: true).snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Message> messages_lists = [];
                    for (int i = 0; i < snapshot.data!.docs.length; i++) {
                      messages_lists
                          .add(Message.fromJson(snapshot.data!.docs[i]));
                    }
                    return ListView.builder(
                      reverse: true,
                      controller: _scrollController,
                      itemCount: messages_lists.length,
                      itemBuilder: (BuildContext context, int index) {
                        return data[kId] == messages_lists[index].email
                            ? chatBubb(mes: messages_lists[index])
                            : chatBubbForFriends(mes: messages_lists[index]);
                      },
                    );
                  } else {
                    return Center(child: adabtiveCircularIndicator());
                  }
                },
              ),
            ),
            //field ->type a messsage
            Padding(
              padding: const EdgeInsets.all(12),
              child: adabtiveTextField(
                hint: 'Type a message',
                textController: _textController,
                suffixIcon: adabtiveEmptyButton(
                  on_tap: () {
                    messages.add({
                      kMessage: _textController.text,
                      kId: data[kId],
                      createdAt: DateTime.now(),
                    });
                    //to scroll end when send message
                    _scrollDown();
                    //to clear field after send message
                    _textController.clear();
                  },
                  widget: Icon(Icons.send),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

//this function to scroll end listview
  void _scrollDown() {
    _scrollController.animateTo(
      0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 400),
    );
  }
}
