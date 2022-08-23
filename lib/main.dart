import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Sheet with slider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Height: ${height}", style: TextStyle(fontSize: 30),),
            ElevatedButton(
              onPressed: (){
                showModalBottomSheet(context: context,
                    builder: (BuildContext context){
                      return Container(
                        height: 200,
                        child: Center(child:
                        StatefulBuilder(
                          builder: (context,state){
                            return Center(
                              child: Slider(
                                value: height.toDouble(),
                                max: 200,
                                min: 50,
                                onChanged: (double value) {
                                  height=value;
                                  state(() {
                                    height = value.round() as double;
                                  });
                                  setState(() {

                                  });
                                },

                              ),
                            );
                          },
                        ),
                        ),
                      );
                    }
                );
              },
              child: Text(" Select Height "),
            ),
          ],
        ),
      ),
    );
  }
}