import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../Utils/Routes.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String? emailn;
  Future<void> login() async{
    final String endpoint ="https://aeronex-auth-prod.onrender.com/api/v1/auth/login";
    final response=await http.post(Uri.parse(endpoint),
        body:({
          'email':emailController.text,
          'password':passController.text,
        }));
    print(response.body);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(response.body),),);
    if(response.statusCode==200){
      Navigator.pushReplacementNamed(context, MyRoutes.HomeRoutes);
    }else{
      print("error");
    }
  }
        bool obscureText= true;
        void PassText(){
      setState(() {
        obscureText = !obscureText;
      });
    }
    TextEditingController emailController =TextEditingController();
    TextEditingController passController =TextEditingController();
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
                  const Text('Login',style:TextStyle(fontSize:38,fontWeight:FontWeight.bold,color:Colors.white,),),
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
                            if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                              return 'Invalid email address';
                            }
                            emailn=emailController.text;
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
                            }
                            return null;
                          },
                        ),SizedBox(height: 5,),
                        TextButton(onPressed:(){
                          Navigator.pushReplacementNamed(context, MyRoutes.ResendRoutes);
                        }, child: Text('Forgot Password',style: TextStyle(fontSize: 12,color: Colors.white),)),

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
                              login();
                            }
                          },
                          child:
                          const Text('Login',style: TextStyle(color: Colors.black,fontSize: 20),),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35,),
                  Center(
                    child: Row(
                      children: [
                        SizedBox(width: 45,),
                        Text('Do not have account?',style:TextStyle(fontSize:12,color: Colors.white),),
                        SizedBox(width: 15,),
                        ElevatedButton(
                          style:ElevatedButton.styleFrom(backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                            ),
                          ),
                          onPressed: (){

                            Navigator.pushReplacementNamed(context, MyRoutes.SignUpRoutes);
                          },
                          child:
                          const Text('Sign Up',style: TextStyle(color: Colors.black,fontSize: 20),),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),),
    );
  }
}
