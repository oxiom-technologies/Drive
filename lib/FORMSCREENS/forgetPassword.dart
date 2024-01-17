import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

  class ForgetPassword extends StatefulWidget {
  var type;
   ForgetPassword({super.key,required this.type});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
             const SizedBox(height: 60,),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 80),
                child: SizedBox(
                  height: 250,

                  child: Image(image: AssetImage("images/loginimg.png"),fit: BoxFit.cover,),
                ),
              ),
              TextFormField(

                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter Phone Number',
                  prefixIcon: const Icon(
                    Icons.call,
                  ),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                onChanged: (value) {
                  if (value.length == 10) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                // Show numeric keyboard
              ),
               const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: ((context) => OTPverification())));
                },
                style: ElevatedButton.styleFrom(minimumSize: Size(MediaQuery.of(context).size.width, 50),
                  backgroundColor: const Color.fromRGBO(38, 52, 53, 1),foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
