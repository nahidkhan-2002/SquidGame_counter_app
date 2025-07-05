import 'package:flutter/material.dart';
import 'package:shimmer_effect/shimmer_effect.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App Redesign',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 246, 0, 152),
        ),
      ),
      home: const MyHomePage(title: 'Counter App Redesign'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounteradd() {
    setState(() {
      _counter++;
    });
  }

  void _incrementCounterminus() {
    setState(() {
      _counter--;
      if (_counter < 0) {
        _counter = 0;
      }
    });
  }

  void _incrementCounterreset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 189, 207),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      elevation: 10,
                      backgroundColor: Colors.pinkAccent[200],
                      hoverColor: Colors.green,
                      onPressed: () {
                        _incrementCounteradd();
                        ScaffoldMessenger.of(context).showMaterialBanner(
                          MaterialBanner(
                            content: AwesomeSnackbarContent(
                              title: "Pressed Add Button",
                              message: "Yo ! You Pressed Add Button",
                              contentType: ContentType.,
                              inMaterialBanner: true,
                            ),
                            actions: [SizedBox.shrink()],
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        );
                      },
                      tooltip: 'This is the Increment',
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    FloatingActionButton(
                      elevation: 10,
                      backgroundColor: Colors.pinkAccent[200],
                      hoverColor: Colors.red,
                      onPressed: _incrementCounterminus,
                      tooltip: 'This is the Decrement',
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Transform.rotate(
                              angle: 0.785398, // 45 degrees in radians
                              child: Container(
                                width: 40,
                                height: 14,
                                color: Colors.black,
                              ),
                            ),
                            Transform.rotate(
                              angle: -0.785398, // -45 degrees in radians
                              child: Container(
                                width: 40,
                                height: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    FloatingActionButton(
                      elevation: 10,
                      backgroundColor: Colors.pinkAccent[200],
                      hoverElevation: 30,
                      hoverColor: const Color(0xFF3D85C6),
                      onPressed: _incrementCounterreset,
                      tooltip: 'This is the Reset',
                      child: Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ShimmerEffect(
                  duration: const Duration(seconds: 2),
                  baseColor: Color.fromARGB(255, 63, 62, 62),
                  highlightColor: Color(0xFFF60098),
                  child: Text(
                    'Player 456 ! You Pressed $_counter times',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      foreground:
                          Paint()
                            ..shader = LinearGradient(
                              colors: <Color>[
                                const Color.fromARGB(255, 63, 62, 62),
                                Color(0xFFF60098),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(
                              Rect.fromLTWH(0.0, 0.0, 400.0, 70.0),
                            ),
                    ),
                  ),
                ),

                Container(
                  transform: Matrix4.translationValues(0.0, 230.0, 0.0),
                  child: Image.asset(
                    'assets_image/frontman.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
