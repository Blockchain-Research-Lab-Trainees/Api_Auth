import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../Utils/Routes.dart';
class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {

  Future<void>change()async{
    final String endpoint = "https://aeronex-auth-prod.onrender.com/api/v1/auth/verify";
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        body: {
          'otp': otpController.text,
          'email': emailController.text,
          'new_password':passController,
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

  bool obscureText= true;
  void PassText(){
    setState(() {
      obscureText = !obscureText;
    });
  }
  TextEditingController emailController =TextEditingController();
  TextEditingController otpController =TextEditingController();
  TextEditingController passController =TextEditingController();
  final RegExp _passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*()_+{}\[\]:;<>,.?~\\-]).{8,}$',
  );
  final _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                const Text('Change Password',style:TextStyle(fontSize:38,fontWeight:FontWeight.bold,color:Colors.white,),),
                SizedBox(height: 40,),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: otpController,
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
                            return "Enter Otp";
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
                          if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                            return 'Invalid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30,),
                      TextFormField(
                        controller: passController,
                        obscureText: obscureText,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          hintStyle: const TextStyle(color: Colors.white),
                          labelText: "Password",
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
                          suffixIcon: IconButton(
                              icon: Icon(obscureText? Icons.visibility_off : Icons.visibility),
                              onPressed: PassText),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password can't be empty";
                          } else if (!_passwordRegex.hasMatch(value)) {
                            return "Password must have 8 characters with special characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 45,),
                      ElevatedButton(
                        style:ElevatedButton.styleFrom(backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 35),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                        onPressed: (){
                          if (_formKey.currentState!.validate()){
                            change();
                          }
                        },
                        child:
                        const Text('Change Password',style: TextStyle(color: Colors.black,fontSize: 20),),),
                    ],
                  ),
                ),
          ],
                  ),
                ),
            ),
          ),
    );
  }
}
