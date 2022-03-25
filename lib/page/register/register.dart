import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
            image: AssetImage('assets/images/bgsplash.png'),
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
              mainAxisAlignment: MainAxisAlignment.start,
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
                  decoration: const InputDecoration(
                    labelText: 'No Telpon',
                    prefixIcon: Icon(CupertinoIcons.phone),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  style: const TextStyle(fontFamily: 'sans serif'),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(CupertinoIcons.mail),
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
                            backgroundColor: const Color(0x44FFC107),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Color(0xFF000000),
                                width: 1,
                                style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // shape: StadiumBorder()
                          ),
                    onPressed: () {
                      Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => const Register())
                      );
                    }, 
                    child: const Text(
                      "DAFTAR", 
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
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