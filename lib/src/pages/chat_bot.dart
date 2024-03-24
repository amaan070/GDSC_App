import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatScreen extends StatelessWidget {
  final apiKey = 'AIzaSyCr9LnuKX6qj-BOvA_5ZoWlst-5PqaAOUs';

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          'Chatbot',
          style:
              Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 20),
        ),
        leading: const Icon(Icons.pages),
        actions: [
          SizedBox(
              height: 80,
              width: 80,
              child: Image.asset('assets/images/GDSC-Logo2.png')),
        ],
      ),
      body: const ChatWidget(),
    );
  }
}

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final TextEditingController _controller = TextEditingController();
  List<String> _messages = [];
  final apiKey = 'AIzaSyCr9LnuKX6qj-BOvA_5ZoWlst-5PqaAOUs';

  Future<void> talkWithGemini(String message) async {
    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    final content = Content.text(message);
    final response = await model.generateContent([content]);
    _messages.add(response.text ?? "");
    setState(() {});
  }

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(message);
        talkWithGemini(message);
      });
      // Here you can implement your logic for sending the message to the chatbot backend
      // For simplicity, we're just printing the message here
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              dynamic bg_color = Theme.of(context).colorScheme.primary;
              dynamic alignment = Alignment.centerLeft;
              if (index % 2 == 0) {
                alignment = Alignment.centerRight;
                bg_color =
                    Theme.of(context).colorScheme.primary.withOpacity(0.6);
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Align(
                  alignment: alignment,
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: bg_color,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      _messages[index],
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.background),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Type a message...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              FloatingActionButton(
                onPressed: () {
                  _sendMessage(_controller.text);
                },
                child: Icon(Icons.send),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
