import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: app(),
    ),
  );
}

class app extends StatefulWidget {
  const app({Key? key}) : super(key: key);

  @override
  State<app> createState() => _appState();
}

int i = 9;
String text = "AM";
String text1 = "PM";
String a = "";

class _appState extends State<app> {
  Map map = {
    "$i:00 $text": a,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TO-DO App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          Icon(
            Icons.apps_sharp,
            size: 35,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: map.entries.map((e) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade600),
                    ),
                    child: Text(
                      e.key,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      child: TextField(
                        onChanged: (val) {
                          a = val;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Your To-Do here..",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (i < 12) {
              map["${i++}:00 $text"] = a;
            } else {
              i = 1;
              text1 = "PM";
              map["${i++}:00 $text1"] = a;
            }
          });
        },
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
