import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatBubbles extends StatelessWidget {
  const ChatBubbles(this.message, this.isMe, this.userName, {super.key});
  // 생성자로부터 전달받은 argument를 message 변수에 bind

  final String message;
  final String userName;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row( //chatbubble이 listview 내에 있기 때문에 가로 길이를 모두 차지하는 것을 해결
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if(isMe)
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,5,0),
            child: ChatBubble(
              clipper: ChatBubbleClipper8(type: BubbleType.sendBubble),
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 20),
              backGroundColor: Colors.blue,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Column(
                  crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white
                      ),
                    ),
                    Text(
                      message,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if(!isMe)
          Padding(
            padding: const EdgeInsets.fromLTRB(5,0,0,0),
            child: ChatBubble(
              clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
              backGroundColor: Color(0xffE7E7ED),
              margin: EdgeInsets.only(top: 20),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Column(
                  crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}