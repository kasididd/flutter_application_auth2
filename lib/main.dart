import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () async => await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: "kasidid@gmail.com", password: "123456"),
                  child: Text("Create")),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () async => await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: "test@gmai.com", password: "123456"),
                  child: Text("Login")),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () async => await FirebaseAuth.instance.signOut(),
                  child: Text("Log-out")),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () async {
                    try {
                      final Email email = Email(
                        body: 'Email body',
                        subject: 'Email subject',
                        recipients: ['kasidid@example.com'],
                        cc: ['cc@example.com'],
                        bcc: ['bcc@example.com'],
                        // attachmentPaths: ['/path/to/attachment.zip'],
                        isHTML: false,
                      );

                      await FlutterEmailSender.send(email);
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("forget")),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () async {
                    try {
                      email() async {
                        final service_id = "service_lgmfds4";
                        final template_id = "template_0vcwepe";
                        final user_id = "5Gjw1_A36I08CT46m";
                        String user_name = "test";
                        String link = "youtube.com";
                        String to_email = "kasidid.wan@gmail.com";
                        final url = Uri.parse(
                            "https://api.emailjs.com/api/v1.0/email/send");
                        var respon = await http.post(url,
                            headers: {
                              'origin': 'http:/localhost',
                              'Content-Type': 'application/json'
                            },
                            body: json.encode({
                              "service_id": service_id,
                              "template_id": template_id,
                              "user_id": user_id,
                              "template_params": {
                                "user_name": 'hello',
                                "to_email": to_email,
                                "link": link
                              }
                            }));
                        print(respon.body);
                        await showDialog(
                            context: context,
                            builder: (context) {
                              wait() async {
                                await Future.delayed(Duration(seconds: 1));
                                Navigator.pop(context);
                              }

                              wait();
                              return AlertDialog(
                                title: Text("send to $to_email success!"),
                              );
                            });
                      }

                      await email();
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("email JS")),
            ),
          ],
        ),
      ),
    );
  }
}
