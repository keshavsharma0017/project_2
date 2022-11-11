// import 'package:json_serializable/json_serializable.dart';
// import 'dart:ffi';
// import 'package:project2/constant/routes.dart';
import 'dart:convert';
import 'dart:developer' as devtools show log;
import 'package:flutter/material.dart';
import 'package:project2/api_class_modal/api_modal.dart';
import 'package:http/http.dart' as http;

Future<Welcome> getinfo() async {
  final response = await http.get(
    Uri.parse(
        'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=demo'),
  );
  if (response.statusCode == 200) {
    return Welcome.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load...');
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<Welcome> futurestock;

  @override
  void initState() {
    super.initState();
    futurestock = getinfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(''),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
                textScaleFactor: 1.5,
              ),
            ),
          ],
        ),
      ),
      body: Center(child: StreamBuilder<Welcome>(
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                devtools.log('hey');
                return const Text('Please Wait....');
              } else {
                devtools.log('yoo');
                return showInfo(snapshot.data!);
              }
          }
        },
      )),
      // body: SingleChildScrollView(
      //   child: ListView.builder(
      //     itemBuilder: (context, index) {

      //     },
      //   ),
      // ),
      //**************************************************************** */
      // body: ListView.builder(
      //   prototypeItem: const ListTile(
      //     title: Text(
      //       'hello',
      //       style: TextStyle(color: Colors.blue),
      //     ),
      //   ),
      //   itemBuilder: ((context, index) {
      //     // return const Text("${futurestock.asStream().}");
      //   }),
      // ),
      // ***************************************************************
      // body: StreamBuilder<Welcome>(builder: (context, snapshot) {
      //   const SizedBox(
      //     height: 20,
      //   );

      //   if (snapshot.hasData) {
      //     return Text('${snapshot.data!.timeSeries5Min}');
      //   } else if (snapshot.hasError) {
      //     devtools.log('${snapshot.error}');
      //     return Text('${snapshot.error}');
      //   }
      //   return const CircularProgressIndicator();
      // }),
      // *******************************************************************
      // body: Center(
      //   child: FutureBuilder<Welcome>(
      //     future: futurestock,
      //     builder: ((context, snapshot) {
      //   if (snapshot.hasData) {
      //     return Text('${snapshot.data!.timeSeries5Min}');
      //   } else if (snapshot.hasError) {
      //     devtools.log('${snapshot.error}');
      //     return Text('${snapshot.error}');
      //   }
      //   return const CircularProgressIndicator();
      // }),
      //   ),
      // ),
    );
    // );
  }
}

Widget showInfo<Map>(Welcome data) {
  return Center(
    child: Column(
      children: [
        // if(data ==null){
          
        // }else{
          
        // },
        Text(data.metaData.the1Information),
        const SizedBox(
          height: 10,
        ),
        Text(data.metaData.the6TimeZone),
      ],
    ),
  );
}






// **********************************************************************************************
  // body: SingleChildScrollView(child: ListView.builder(
      //   itemBuilder: itemBuilder,),),
// *
// *
// *
// *
// *
// *
// *
// *
// *
// *
// *
// *
// *
// *
// *
// *
// *
// *
// *
// // *

      // backgroundColor: Colors.black,
      // body: SingleChildScrollView(
      //   child: Center(
      //     child: SafeArea(
      //       child: TextFormField(
      //         style: const TextStyle(
      //           color: Colors.white,
      //         ),
      //         decoration: const InputDecoration(
      //           labelText: 'Search...',
      //           hintText: '',
      //           labelStyle: TextStyle(color: Colors.white),
      //           suffixIcon: Align(
      //             widthFactor: 1.0,
      //             heightFactor: 1.0,
      //             child: Icon(
      //               Icons.search,
      //               color: Colors.white,
      //             ),
      //           ),
      //           // border: OutlineInputBorder(borderRadius: )
      //         ),
      //         // style: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
      //       ),
      //     ),
      //   ),
      // ),
      // // bottomNavigationBar: BottomNavigationBar(
      //   // backgroundColor: Colors.blue[900],
      //   // items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       //     icon: IconButton(
      //       //   onPressed: () {
      //       //     Navigator.of(context)
      //       //         .pushNamedAndRemoveUntil(enterRoute, (route) => false);
      //       //   },
      //       //   icon: const Icon(Icons.home),
      //       // )
      //       icon: Icon(
      //         Icons.home,
      //         color: Colors.white,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.settings,
      //         color: Colors.white,
      //       ),
      //       label: '',
      //     ),
      //   ],