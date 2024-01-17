import 'package:drive_/ADMIN/AddnewVehicle.dart';
import 'package:drive_/ADMIN/VehicleALL.dart';
import 'package:drive_/ADMIN/fourWhealer.dart';
import 'package:drive_/ADMIN/twoWhealer.dart';
import 'package:drive_/tabar/tabbarvehicle.dart';
import 'package:flutter/material.dart';

class Vehicle extends StatefulWidget {
  const Vehicle({super.key});

  @override
  State<Vehicle> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  int selectedTabIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 175,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(37, 51, 52, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddnewVehicle()));
                  },
                  child: Container(
                    height: 95,
                    width: 230,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(185, 190, 190, 1),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                const Text(
                  "Add New\n Vehicle",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TabBarVehicle(
                          text: '   All   ',
                          isSelected: selectedTabIndex == 0,
                          onTap: () {
                            onTabSelected(0);
                          }),
                      TabBarVehicle(
                          text: 'Two Wheeler',
                          isSelected: selectedTabIndex == 1,
                          onTap: () {
                            onTabSelected(1);
                          }),
                      TabBarVehicle(
                          text: 'Four Wheeler',
                          isSelected: selectedTabIndex == 2,
                          onTap: () {
                            onTabSelected(2);
                          }),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text("Available vehicles"),
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  if (selectedTabIndex == 0) VehicleALL(),
                  if (selectedTabIndex == 1) Twowhealer(),
                  if (selectedTabIndex == 2) FourWhealer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
