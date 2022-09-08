import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_verification/screens/otp_screens.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
   Future<void> sendOtp() async {
    EmailAuth emailAuth = EmailAuth(sessionName: "OTP Testing");
    bool result = await emailAuth.sendOtp(
      recipientMail: emailcontroller.value.text,
      otpLength: 5,
    );
    if (result) {
      print(' Otp');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => OtpScreen(email: emailcontroller.value.text),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 119, 216),
        title: const Text("Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
        ), centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
         icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/images/Write.png",)
                )
              ),
            ), 
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                   Align(
                      alignment: Alignment.topLeft,
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ), const SizedBox(height: 10,),
                    TextField(
                       controller: emailcontroller,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(Icons.email, size: 30, color: Colors.blue,),
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                       controller: passcontroller,
                       obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(Icons.lock,size: 30, color: Colors.blue,),
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                    ),
                     const SizedBox(height: 20),
                    InkWell(
                      onTap: (){
                        sendOtp();
                      },
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 96, 175),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          'Send OTP',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        ),
                      ),
                  
                ],
              ),
            )
          ],
        ),)),
    );
  }
}