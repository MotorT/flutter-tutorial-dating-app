import 'package:dating_app/features/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up now'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nickname',
                hintText: 'Input your nickname',
                errorText: validateNickname(),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                // This will run when pressing the button
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (_) {
                    return HomePage();
                  }),
                );
              },
              child: Text('Sign up'),
            ),
          ],
        ),
      ),
    );
  }

  validateNickname() {
    OurOwnClass(
      builder: (context) {
        return Text('');
      },
      simpleProcessor: () {
        
      }
    );

    return 'Invalid nickname';
  }
}
// Email
// Password
// Name

class OurOwnClass {
  final Widget Function(BuildContext) builder;
  final Function simpleProcessor;
  OurOwnClass({required this.builder, required this.simpleProcessor});
}
