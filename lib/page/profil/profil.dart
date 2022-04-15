import 'package:circle_coffee/library/my_shared_pref.dart';
import 'package:circle_coffee/models/user_model.dart';
import 'package:circle_coffee/splashscreen_view.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({ Key? key }) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {

  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    user = User();
    _login();
  }

  _login() async {
    final getUser = await MySharedPref().getModel();
    if (getUser != null) {
      setState(() {
        user = getUser;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(child: 
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff000000),
                  border: Border.all(width: 1.0,color: const Color(0xff000000))
                ),
                height: 120,
                width: 120,
                child: Image.asset('assets/images/bgsplash.png',),
              )
            ),
            const SizedBox(height: 24,),
            TextButton(
              onPressed: (){
                MySharedPref().clearAllData();
                Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (_) => const SplashScreenPage())
                );
              },
              child: Text('Logout')
            )
          ],
        ),
      ),
    );
  }
}