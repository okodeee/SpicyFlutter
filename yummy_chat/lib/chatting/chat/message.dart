import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'chat_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          //stream에서 최신의 snapshot을 가져오기 위해 필요

          /* Error: Null check operator used on a null value
            * 앱에 데이터를 요청하자마자 데이터가 존재하는 것이 아니기 때문
            * 파이어베이스에 접속을 해서 데이터를 끌어오기 전까지*/
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final chatDocs = snapshot.data!.docs;

          return ListView.builder(
            reverse: true,
            itemCount: chatDocs.length,
              itemBuilder: (context, index){
                return ChatBubbles(
                    chatDocs[index]['text'],
                    chatDocs[index]['userID'].toString() == user!.uid,
                    chatDocs[index].data()['userName'].toString(),
                );
              }
          );
        });
  }
}
