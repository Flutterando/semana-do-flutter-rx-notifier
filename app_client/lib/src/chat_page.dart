import 'package:app_client/src/chat_controller.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ChatPage extends StatefulWidget {
  final String name;
  final String room;

  const ChatPage({Key key, @required this.name, @required this.room}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatController controller;

  @override
  void initState() {
    super.initState();
    controller = ChatController(widget.room, widget.name);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Room: ${widget.room}')),
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            RxBuilder(builder: (_) {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.listEvents.length,
                  itemBuilder: (_, id) {
                    final event = controller.listEvents[id];

                    if (event.type == SocketEventType.enter_room) {
                      return ListTile(title: Text('${event.name} ENTROU NA SALA!'));
                    } else if (event.type == SocketEventType.leave_room) {
                      return ListTile(title: Text('${event.name} SAIU DA SALA!'));
                    }

                    return ListTile(
                      title: Text(event.name),
                      subtitle: Text(event.text),
                    );
                  },
                ),
              );
            }),
            TextField(
              focusNode: controller.focusNode,
              onSubmitted: (_) => controller.send(),
              controller: controller.textControler,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type your text',
                suffixIcon: IconButton(icon: Icon(Icons.send), onPressed: controller.send),
              ),
            )
          ],
        ),
      ),
    );
  }
}
