import 'package:flutter/material.dart';

class LogOrRegSkip extends StatelessWidget {
  const LogOrRegSkip({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 300,width: 300,
                    
                  
                      decoration: BoxDecoration( 
                        image: DecorationImage(image:  AssetImage("images/drivelogoo.png"),)
                      ),child:Padding(
                        padding: const EdgeInsets.only(top:200.0,left: 90),
                        child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'D',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 50),
                            ),
                            TextSpan(
                              text: 'rivo',
                              style: TextStyle(
                                fontSize: 45,
                                color: Colors.black,
                                decorationStyle: TextDecorationStyle.double,
                              ),
                            ),
                          ],
                        ),
                                          ),
                      ) ,
                    ),
                    
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(         minimumSize: Size(MediaQuery.of(context).size.width, 50),
                                   backgroundColor: const Color.fromRGBO(38, 52, 53, 1),foregroundColor: Colors.white,

                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        child: const Text("Login"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 17,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(color: Colors.black),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                          child: const Text("Register"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 180,),
              const Column(
                children: [Text("By continuing ,you agree to our",style: TextStyle(fontSize: 11),),
                Text(
                      "Terms & Conditions",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                       color: Color.fromRGBO(38, 52, 53, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
