import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexercise/providers/provider1.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserNameProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Hello ' + provider.getUsername),
        ),
        body: Consumer<UserNameProvider>(
          builder: (context, provider, child) {
            return Center(
                child: Text(
              'Hello, ' + provider.getUsername,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black45,
              ),
            ));
          },
        ),
      );
    });
  }
}
