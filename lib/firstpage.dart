import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lab08/services/google_auth.dart';
import 'package:lab08/services/loginsuccess.dart';
import 'firebase_options.dart';
import 'package:auth_buttons/auth_buttons.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loginpage')),
      body: Center(
        child: GoogleAuthButton(
          onPressed: () {
            GoogleAuthService().signinWIthGoogle().then((value) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Loginss(),
                ),
              );
          
              // เปิดหน้า ใส่ ข้อมูล
            });
          },
        ),
      ),
    );
  }
}
