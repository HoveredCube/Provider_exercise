import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexercise/providers/provider1.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('App rebuild');
    return Scaffold(
        appBar: AppBar(
          title: const Text('confirm your information'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<UserNameProvider>(
                // consumers task here is to only rebuild its child/childs and
                // and prevet the whole app from getting rebuilded
                builder: (context, provider, child) {
                  print('Text Widget rebuild');
                  return Text(
                    // here we used the getter that we've declared in the
                    // provider1.dart to get the value of username.
                    'Your name is ' + provider.getUsername,
                    style: const TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  );
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    onChanged: (value) {
                      // on each letter being typed, the Provider's ChangeNotifier
                      // gets called and runs the updateUsername method wich
                      // then notifies all the listeners in the app and make them
                      // get rebiulded, but unlike the setState method, only the
                      // text widgets that has this value get rebuild, not the
                      // whole app! so as a result, we'll get better
                      Provider.of<UserNameProvider>(context, listen: false)
                          // listen: false => because we are not listening here, we are
                          // changing the listeners
                          .updateUsername(value);
                    },
                    maxLength: 14,
                    decoration: const InputDecoration(
                      hintText: 'enter your name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/hellopage');
                    },
                    color: Colors.blue,
                    child: const Text(
                      'submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
