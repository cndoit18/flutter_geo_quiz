import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "geo quiz",
      home: Scaffold(
        appBar: AppBar(
          title: Text("geo quiz"),
        ),
        body: Center(
          child: Question(
            res: "Canberra is the capital of Australla.",
            answer: true,
          ),
        ),
      ),
    );
  }
}

class Question extends StatelessWidget {
  final String res;
  final bool answer;
  Question({@required this.res, @required this.answer});

  void _toast(BuildContext context, bool reply) {
    var remind = "Correct";
    if (reply != this.answer) {
      remind = "Incorrect";
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(remind)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('$res'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => _toast(context, true), child: Text('TRUE')),
            TextButton(
                onPressed: () => _toast(context, false), child: Text('FALSE')),
          ],
        ),
      ],
    );
  }
}
