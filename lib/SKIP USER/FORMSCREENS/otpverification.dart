import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPverificationSKIP extends StatefulWidget {
  const OTPverificationSKIP({super.key});

  @override
  State<OTPverificationSKIP> createState() => _OTPverificationSKIPState();
}

class _OTPverificationSKIPState extends State<OTPverificationSKIP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      body: ListView(children: [
        const Padding(
          padding: EdgeInsets.only(left: 20,top: 20),
          child: Text(
            "OTP Verification",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20,10,0,20),
          child: Text(
            "Enter the verification code we just sent on your mobile number",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromRGBO(38, 52, 53, 1),
                )),
            height: 55,
            width: 55,
            child: TextField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              decoration: const InputDecoration(border: InputBorder.none),
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(1)],
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromRGBO(38, 52, 53, 1),
                )),
            height: 55,
            width: 55,
            child: TextField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              decoration: const InputDecoration(border: InputBorder.none),
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(1)],
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromRGBO(38, 52, 53, 1),
                )),
            height: 55,
            width: 55,
            child: TextField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              decoration: const InputDecoration(border: InputBorder.none),
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(1)],
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromRGBO(38, 52, 53, 1),
                )),
            child: TextField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              decoration: const InputDecoration(border: InputBorder.none),
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(1)],
              textAlign: TextAlign.center,
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(
              top: 50.0, left: 25, right: 25, bottom: 40),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width, 50),
              backgroundColor: const Color.fromRGBO(38, 52, 53, 1),
              foregroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: const Text("Verify"),
          ),
        ),
        Container(
          height: 300,
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Din't recieved Code?",
                style: TextStyle(fontSize: 13),
              ),
              GestureDetector(onTap: (){},
                child: const Text(
                  " Resend",
                  style: TextStyle(fontSize: 14, color: Color.fromRGBO(38, 52, 53, 1),),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
