import 'dart:convert';

import 'package:circle_coffee/library/my_shared_pref.dart';
import 'package:circle_coffee/models/user_model.dart';
import 'package:circle_coffee/page/home/home.dart';
import 'package:circle_coffee/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  MySharedPref _mySharedPref = MySharedPref();

  bool _isHidden = true;
  bool isLoading = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bgsplash.png'),
                fit: BoxFit.fitHeight)),
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(
                CupertinoIcons.chevron_left_circle,
                color: Color(0xFFFFC107),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 30,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  style: const TextStyle(fontFamily: 'sans serif'),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(CupertinoIcons.person),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x99FFC107)),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x99FFC107)),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _passController,
                  style: const TextStyle(
                    fontFamily: 'sans serif',
                  ),
                  decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(CupertinoIcons.lock),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x99FFC107)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x99FFC107)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      suffixIcon: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(_isHidden
                              ? CupertinoIcons.eye_fill
                              : CupertinoIcons.eye_slash))),
                  obscureText: _isHidden,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            backgroundColor: const Color(0xEE000000),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Color(0xFFFFC107),
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // shape: StadiumBorder()
                          ),
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            User user;
                            final res = await ApiService().login(
                                email: _emailController.text,
                                pass: _passController.text);

                            if (res['success']) {
                              user = userFromJson(res['data']);
                              _mySharedPref.setModel(user);
                              _mySharedPref.setLogin(true);
                              Fluttertoast.showToast(msg: res['message']);
                              Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => const Home())
                              );
                            }else{
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(msg: res['message']);
                            }
                          },
                          child: const Text(
                            "MASUK",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
