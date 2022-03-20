import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidden = true;

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
            image: AssetImage('images/bgsplash.png'),
            fit: BoxFit.fitHeight
            ) 
          ),
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon : const Icon(
                CupertinoIcons.chevron_left_circle, 
                color: Color(0xFFFFC107),
              ),
              onPressed: (){
                Navigator.pop(context);
              },
              iconSize: 30,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  style: const TextStyle(fontFamily: 'sans serif'),
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(CupertinoIcons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  style: const TextStyle(fontFamily: 'sans serif'),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(CupertinoIcons.lock),
                    border: const OutlineInputBorder(),
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        _isHidden ?
                        CupertinoIcons.eye_fill :
                        CupertinoIcons.eye_slash
                        )
                    )
                  ),
                  obscureText: _isHidden,
                ),
                const SizedBox(height: 16,),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            backgroundColor: const Color(0xEE000000),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Color(0xFFFFC107),
                                width: 1,
                                style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // shape: StadiumBorder()
                          ),
                    onPressed: () {
                      Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => const Login())
                      );
                    }, 
                    child: const Text(
                      "MASUK", 
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                      ),
                    )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}