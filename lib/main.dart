import 'package:flutter/material.dart';
import 'package:flutter_glass_morphic/glass_morphic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glass Morphe',
      theme: ThemeData(
        useMaterial3: false,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'My Glass Morphic Design'),
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
  bool isBlur = false;

  final String src = 'assets/images/pattern.jpg';
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
          color: Colors.brown.shade100,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        // backgroundColor: const Color(0xFF1D242F),
        backgroundColor: const Color.fromARGB(18, 24, 36, 100),
        surfaceTintColor: Colors.transparent,
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: [
            Image(
              image: AssetImage(src),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Center(
              child: GestureDetector(
                onTap: () => setState(() {
                  isBlur = !isBlur;
                }),
                child: GlassMorphic(
                  blur: isBlur ? 10 : 0,
                  opacity: 0.25,
                  child: SizedBox(width: 400, height: 300),
                ),
              ),
            ),
            // Image.network(
            // 'https://www.freepik.com/free-photo/galaxy-nature-aesthetic-background-starry-sky-mountain-remixed-media_17226410.htm#fromView=keyword&page=1&position=22&uuid=761d923d-cf36-4a7b-8322-2e6f4f645f01&query=Wallpaper',
            // fit: BoxFit.cover,
            // height: double.infinity,
            // width: double.infinity,
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
