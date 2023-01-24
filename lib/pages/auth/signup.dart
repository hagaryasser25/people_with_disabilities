import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ndialog/ndialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/SignUpScreen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var fullNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              title: Text('انشاء حساب')),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(
                      'https://media.istockphoto.com/id/1196537255/vector/volunteer-helping-disabled-woman-sister-walking-in-park-with-girl-disabled-in-wheelchair.jpg?s=612x612&w=0&k=20&c=FGVRhDQYkKMMHa5SNQOMiXZNFOpHSUfxBrHTW-GC6aM='),
                   TextField(
                    controller: fullNameController,
                    decoration: InputDecoration(hintText: 'الاسم'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                   TextField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(hintText: 'الهاتف'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: 'البريد الالكترونى'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'كلمة المرور'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                         var fullName =
                                    fullNameController.text.trim();
                                var phoneNumber =
                                    phoneNumberController.text.trim();
                                var email = emailController.text.trim();
                                var password = passwordController.text.trim();

                                if (fullName.isEmpty ||
                                    email.isEmpty ||
                                    password.isEmpty ||
                                    phoneNumber.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Please fill all fields');
                                  return;
                                }

                                if (password.length < 6) {
                                  // show error toast
                                  Fluttertoast.showToast(
                                      msg:
                                          'Weak Password, at least 6 characters are required');

                                  return;
                                }

                                ProgressDialog progressDialog = ProgressDialog(
                                    context,
                                    title: Text('Signing Up'),
                                    message: Text('Please Wait'));
                                progressDialog.show();

                                try {
                                  FirebaseAuth auth = FirebaseAuth.instance;
                                  UserCredential userCredential =
                                      await auth.createUserWithEmailAndPassword(
                                          email: email, password: password);

                                  if (userCredential.user != null) {
                                    DatabaseReference userRef = FirebaseDatabase
                                        .instance
                                        .reference()
                                        .child('users');

                                    String uid = userCredential.user!.uid;
                                    int dt =
                                        DateTime.now().millisecondsSinceEpoch;

                                    await userRef.child(uid).set({
                                      'fullName': fullName,
                                      'email': email,
                                      'uid': uid,
                                      'dt': dt,
                                      'phoneNumber': phoneNumber,
                                    });

                                    Fluttertoast.showToast(msg: 'Success');

                                    Navigator.of(context).pop();
                                  } else {
                                    Fluttertoast.showToast(msg: 'Failed');
                                  }
                                  progressDialog.dismiss();
                                } on FirebaseAuthException catch (e) {
                                  progressDialog.dismiss();
                                  if (e.code == 'email-already-in-use') {
                                    Fluttertoast.showToast(
                                        msg: 'Email is already exist');
                                  } else if (e.code == 'weak-password') {
                                    Fluttertoast.showToast(
                                        msg: 'Password is weak');
                                  }
                                } catch (e) {
                                  progressDialog.dismiss();
                                  Fluttertoast.showToast(
                                      msg: 'Something went wrong');
                                }
                       
                      },
                      child: Text('انشاء حساب')),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}