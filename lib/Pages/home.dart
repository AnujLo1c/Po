
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pikachu/Pages/Pokedex.dart';

import 'battlePage.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  @override
  void initState() {
    Pokedex.fetchData();
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text("Poke Battle",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.blue.shade900),),
        ),
        centerTitle: true,
backgroundColor: Colors.orange.shade200,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const battlePage(),));}
            ,style: customButtonstyle()
          ,child: const Text("Start Battle")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Pokedex(),));}
            ,style: customButtonstyle()
                , child: const Text("Pokedex")),
            ElevatedButton(onPressed: (){
              exit(0);}
            ,style: customButtonstyle()
                , child: const Text("Exit")),
          ],
        ),
      ),
    );
  }
  customButtonstyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
      elevation: MaterialStateProperty.resolveWith((states) => 1),
      foregroundColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade900),
      minimumSize: MaterialStateProperty.resolveWith((states) => Size(200, 40)),
      shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
    );
  }


}
