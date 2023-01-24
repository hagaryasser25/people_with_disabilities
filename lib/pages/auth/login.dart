import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ndialog/ndialog.dart';
import 'package:people_with_disabilities/pages/auth/admin_login.dart';
import 'package:people_with_disabilities/pages/user/user_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              title: Text('تسجيل الدخول')),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(
                      'https://media.istockphoto.com/id/1196537255/vector/volunteer-helping-disabled-woman-sister-walking-in-park-with-girl-disabled-in-wheelchair.jpg?s=612x612&w=0&k=20&c=FGVRhDQYkKMMHa5SNQOMiXZNFOpHSUfxBrHTW-GC6aM='),
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
                        var email = emailController.text.trim();
                        var password = passwordController.text.trim();
                        final SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.setString('email', emailController.text);
                
                        if (email.isEmpty || password.isEmpty) {
                          // show error toast
                
                          Fluttertoast.showToast(msg: 'Please fill all fields');
                          return;
                        }
                
                        ProgressDialog progressDialog = ProgressDialog(context,
                            title: Text('Logging In'), message: Text('Please Wait'));
                        progressDialog.show();
                
                        try {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          UserCredential userCredential =
                              await auth.signInWithEmailAndPassword(
                                  email: email, password: password);
                
                          if (userCredential.user != null) {
                            progressDialog.dismiss();
                            Navigator.pushNamed(context, UserHome.routeName);
                          }
                        } on FirebaseAuthException catch (e) {
                          progressDialog.dismiss();
                          if (e.code == 'user-not-found') {
                            Fluttertoast.showToast(msg: 'User not found');
                          } else if (e.code == 'wrong-password') {
                            Fluttertoast.showToast(msg: 'Wrong password');
                          }
                        } catch (e) {
                          Fluttertoast.showToast(msg: 'Something went wrong');
                          progressDialog.dismiss();
                        }
                        
                      },
                      child: Text('تسجيل الدخول')),
                  TextButton(
                      onPressed: () {
                         Navigator.pushNamed(context, AdminLoginScreen.routeName);
                      },
                      child: Text('تسجيل الدخول كأدمن')),
                  TextButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, SignupScreen.routeName);
                      },
                      child: Text('اضغط هنا لأنشاء حساب'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
