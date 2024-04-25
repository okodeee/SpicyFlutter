import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yummy_chat/chatting/chat/message.dart';
import 'package:yummy_chat/chatting/chat/new_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser(){
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat screen'),
        actions: [
          IconButton(
              onPressed: (){
                _authentication.signOut();
                // Navigator.pop(context);
              },
              icon: Icon(
                Icons.exit_to_app_sharp,
                color: Colors.white,
              ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            // listView가 화면 내의 모든 공간을 확보하기 때문에 Expanded로 감싸기
            Expanded(
                child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      )
    );
  }
}
