import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginss extends StatefulWidget {
  


  const Loginss({super.key});

  @override
  State<Loginss> createState() => _LoginssState();
}

class _LoginssState extends State<Loginss> {
 final TextEditingController _nameController = TextEditingController();
final TextEditingController _telController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loginpage')),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: _nameController ,
              validator: (value) {
                if(value!.isEmpty){
                  return "กรุณากรอกเบอร์โทร" ;
                }

              },

              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username',
              ),
            ),

            TextFormField(
              controller: _telController ,
              validator: (value) {
                if(value!.isEmpty){
                  return "กรุณากรอกเบอร์โทร" ;
                }

              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your Tel',
              ),
            ),
              ElevatedButton(onPressed: (){
                  final uid = FirebaseAuth.instance.currentUser!.uid;

                  CollectionReference users = FirebaseFirestore.instance.collection("Users");
                  users.doc(uid).set({
                    "name": _nameController.text,
                    "telephone": _telController.text,
                  });

              }, child: const Text("Save"))

            
          ],
        ),
      ),
    );
  }
}
