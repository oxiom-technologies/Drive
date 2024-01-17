import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginnSkip extends StatefulWidget {
  const LoginnSkip({super.key});

  @override
  State<LoginnSkip> createState() => _LoginnSkipState();
}
bool _isPasswordVisible = false;

class _LoginnSkipState extends State<LoginnSkip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 15),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Skip"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
                foregroundColor: Colors.white,
              ),
            ),
          )
        ],
        foregroundColor: Colors.black,
        leading: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white30),
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                  size: 30,
                )),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20,right: 20),
        child: ListView(children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Think about safety \n first! Then drive...",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: const Color.fromRGBO(247, 248, 249, 1),
              hintText: 'Enter Your ID',
           
            ),
            keyboardType: TextInputType.emailAddress,
          ), const SizedBox(
            height: 20,
          ),
           TextFormField(obscureText: !_isPasswordVisible 
      ,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: const Color.fromRGBO(247, 248, 249, 1),
              hintText: 'Enter Your Password',
              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
           
            ),
            keyboardType: TextInputType.visiblePassword,
          ), const SizedBox(
            height: 70,
          ),
           ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width, 50),
              backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
              foregroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: const Text("Login"),
          ), const SizedBox(height: 22,),
             Center(
              child: GestureDetector(onTap: (){},
                child: const Text(
                          "Login as Tutor",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                           color: Color.fromRGBO(38, 52, 53, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
              ),
            ),
        
        ]),
      ),
    );
  }
}
