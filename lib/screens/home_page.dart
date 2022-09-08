import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 119, 216),
        title: const Text("Home Page", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
        ), centerTitle: true,
        leading:  IconButton(onPressed: (){
          Navigator.pop(context);
        },
         icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: const SafeArea(
      child: SingleChildScrollView(
        child: Center(
           child: Text("Welcome your email is verify", style: 
           TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
        ),
      ) 
      ),
    );
  }
}