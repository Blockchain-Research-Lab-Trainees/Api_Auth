import 'package:api_auth/Pages/GetOtp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

Future<void> getMsg()async{
  final String endpoint = "https://aeronex-auth-prod.onrender.com/api/v1/auth/send-otp";
  final response = await http.get(Uri.parse(endpoint),
      headers:{
        'Authorization':
        'Bearer $TokenA',
      }
  );
  print(response.body);
  if(response.statusCode==200) {
    print(response.body.split(", "));
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Text("hi",style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
