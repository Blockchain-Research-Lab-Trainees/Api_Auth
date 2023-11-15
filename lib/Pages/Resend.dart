import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Utils/Routes.dart';

class Resend extends StatefulWidget {
  const Resend({super.key});

  @override
  State<Resend> createState() => _ResendState();
}

class _ResendState extends State<Resend> {

  Future<void> resend() async {
    final String endpoint = "https://aeronex-auth-prod.onrender.com/api/v1/auth/send-otp";
    final response = await http.post(Uri.parse(endpoint),
        body: ({
          'email': emailController.text,
          "for_signup": false,
        }));
    print(response.body);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(response.body),),);
    if (response.statusCode == 200) {
      Navigator.pushReplacementNamed(context, MyRoutes.ResetRoutes);
    } else {
      print("error");
    }
  }
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController =TextEditingController();
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
                const Text('Get Otp',style:TextStyle(fontSize:38,fontWeight:FontWeight.bold,color:Colors.white,),),
                SizedBox(height: 40,),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                            resend();
                            // Navigator.pushReplacementNamed(context, MyRoutes.LoginRoutes);
                          }
                        },
                        child:
                        const Text('Get Otp',style: TextStyle(color: Colors.black,fontSize: 20),),),

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
