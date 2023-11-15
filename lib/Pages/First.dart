import 'package:flutter/material.dart';

import '../Utils/Routes.dart';
class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                  style:ElevatedButton.styleFrom(backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, MyRoutes.SignUpRoutes);
                  },
                  child:
                  const Text('Sign Up',style: TextStyle(color: Colors.black,fontSize: 20),),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, MyRoutes.GetOtpRoutes);
                  },
                  child:
                  const Text('Verify Otp',style: TextStyle(color: Colors.black,fontSize: 20),),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, MyRoutes.LoginRoutes);
                  },
                  child:
                  const Text('Login',style: TextStyle(color: Colors.black,fontSize: 20),),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, MyRoutes.ResendRoutes);
                  },
                  child:
                  const Text('Change Password',style: TextStyle(color: Colors.black,fontSize: 20),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
