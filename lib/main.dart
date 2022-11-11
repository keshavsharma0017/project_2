import 'package:flutter/material.dart';
import 'package:project2/constant/routes.dart';
import 'package:project2/views/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "stocks",
      home: const EnterPage(),
      routes: {
        homeRoute: ((context) => const Homepage()),
        enterRoute: ((context) => const EnterPage()),
      },
    ),
  );
}

class EnterPage extends StatefulWidget {
  const EnterPage({super.key});

  @override
  State<EnterPage> createState() => _EnterPageState();
}


class _EnterPageState extends State<EnterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            heightFactor: 15.0,
            child: SafeArea(
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(homeRoute, (route) => false);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50)),
                child: const Text('Enter'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

      //  SingleChildScrollView(
      //   child: SafeArea(
      //     child: Container(
      //       padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 0.0),
      //       child: TextFormField(
      //         decoration: const InputDecoration(
      //           hintText: 'Search ...',

      //           // FocusScope.of(context).requestFocus(FocusNode()),
      //           suffixIcon: Align(
      //             widthFactor: 1.0,
      //             heightFactor: 1.0,
      //             child: Icon(
      //               Icons.search,
      //             ),
      //           ),
      //           border: OutlineInputBorder(
      //             borderRadius: BorderRadius.all(
      //               Radius.circular(30),
      //             ),
      //             borderSide: BorderSide(
      //               color: Color.fromARGB(255, 255, 0, 0),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     // backgroundColor: Colors.black,
      //     // body: ,
      //   ),
      // ),