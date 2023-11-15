// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Utils/Routes.dart';
class GetOtp extends StatefulWidget {
  const GetOtp({super.key});

  @override
  State<GetOtp> createState() => _GetOtpState();
}

class _GetOtpState extends State<GetOtp> {
  final _formKey = GlobalKey<FormState>();
  // void initState(){
  //   super.initState();
  // }
  Future<void> checkotp()async{
    final String endpoint = "https://aeronex-auth-prod.onrender.com/api/v1/auth/verify";
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        body: {
          // 'otp': otpController.
          'otp': BigInt.parse(otpController.text,radix: 6),
          'email': emailController.text,
        },
      );

      print(response.body);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.body),
        ),
      );

      if (response.statusCode == 200) {
        Navigator.pushReplacementNamed(context, MyRoutes.LoginRoutes);
      } else {
        print("Error: ${response.statusCode} - ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  TextEditingController emailController =TextEditingController();
  TextEditingController otpController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                const Text('Verify Otp',style:TextStyle(fontSize:38,fontWeight:FontWeight.bold,color:Colors.white,),),
                SizedBox(height: 40,),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: otpController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Enter Otp",
                          hintStyle: const TextStyle(color: Colors.white),
                          labelText: "Otp",
                          labelStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder:const OutlineInputBorder( // Border styling
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: const OutlineInputBorder( // Border styling
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter otp";
                          }
                          return null;
                        },
                ),
                      const SizedBox(height: 30,),
                      TextFormField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          hintStyle: const TextStyle(color: Colors.white),
                          labelText: "Email",
                          labelStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder:const OutlineInputBorder( // Border styling
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: const OutlineInputBorder( // Border styling
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email can't be empty";
                          }
                          return null;
                        },
                      ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                  onPressed: (){
                    if (_formKey.currentState!.validate()){
                        checkotp();
                      // Navigator.pushReplacementNamed(context, MyRoutes.LoginRoutes);
                    }
                  },
                  child:
                  const Text('Verify Otp',style: TextStyle(color: Colors.black,fontSize: 20),),),

                  ],
                  ),),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
