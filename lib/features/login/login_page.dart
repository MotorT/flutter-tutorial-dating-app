import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:dating_app/features/sign_up/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xff244786), const Color(0xff87748d)],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            SlideInDown(
              child: const Text(
                'Date me la',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SlideInLeft(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('blah blahblah'),
                      const SizedBox(height: 16),
                      if (imagePath != null)
                        Image.file(
                          File(imagePath!),
                          height: 200,
                        ),
                      ElevatedButton(
                        onPressed: () async {
                          // DEMO FOR IMAGE PICKER
                          final ImagePicker _picker = ImagePicker();
                          // Choose from camera
                          final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                          // Choose from gallery
                          // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                          if (image != null) {
                            setState(() {
                              print(image.path);
                              imagePath = image.path;
                            });
                          }
                        },
                        child: const Text('Login with Google'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login with Facebook'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login with Apple'),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have account?'),
                          GestureDetector(
                            onTap: () {
                              print('tap sign up now');
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) {
                                    return SignUpPage();
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              'Sign Up Now',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
