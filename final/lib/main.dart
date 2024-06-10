// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'dart:math';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'inSign',
      // ignore: lines_longer_than_80_chars
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 64, 224, 208)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'inSign'),

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
  int _currentIndex = 0;
  final List<Widget> _children = [
    const MainApp(),
    const SettingsPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child:(Text(widget.title))),
      ),
            body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(255, 64, 224, 208),
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Colors.white60),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.g_translate),
            label: 'ASL Translator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.back_hand),
            label: 'Learn ASL',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('ASL Translator', style: TextStyle(fontSize: 24)),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>{
  final Map<String, String> imageAssets = {
    'gallery_images/a.jpg': 'a',
    'gallery_images/b.jpg': 'b',
    'gallery_images/c.jpg': 'c',
    'gallery_images/d.jpg': 'd',
    'gallery_images/e.jpg': 'e',
    'gallery_images/f.jpg': 'f',
    'gallery_images/g.jpg': 'g',
    'gallery_images/h.jpg': 'h',
    'gallery_images/i.jpg': 'i',
    'gallery_images/j.jpg': 'j',
    'gallery_images/k.jpg': 'k',
    'gallery_images/l.jpg': 'l',
    'gallery_images/m.jpg': 'm',
    'gallery_images/n.jpg': 'n',
    'gallery_images/o.jpg': 'o',
    'gallery_images/p.jpg': 'p',
    'gallery_images/q.jpg': 'q',
    'gallery_images/r.jpg': 'r',
    'gallery_images/s.jpg': 's',
    'gallery_images/t.jpg': 't',
    'gallery_images/u.jpg': 'u',
    'gallery_images/v.jpg': 'v',
    'gallery_images/w.jpg': 'w',
    'gallery_images/x.jpg': 'x',
    'gallery_images/y.jpg': 'y',
    'gallery_images/ily.jpg': 'I love you',
  };

  late String currentImage;
  late String currentWord;
  late TextEditingController _controller;
  late String feedbackMessage;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _loadNewImage();
  }

  void _loadNewImage() {
    final random = Random();
    // ignore: lines_longer_than_80_chars
    final randomEntry = imageAssets.entries.elementAt(random.nextInt(imageAssets.length));
    setState(() {
      currentImage = randomEntry.key;
      currentWord = randomEntry.value;
      _controller.clear();
      feedbackMessage = '';
    });
  }

  void _checkAnswer() {
    setState(() {
      if (_controller.text.trim().toLowerCase() == currentWord.toLowerCase()) {
        feedbackMessage = 'Correct!';
      } else {
        feedbackMessage = 'Try again!';
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Text Gamemode'),
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.refresh),
      //       onPressed: _loadNewImage,
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              currentImage,
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your answer',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Text(
              feedbackMessage,
              style: const TextStyle(fontSize: 24, color: Colors.red),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loadNewImage,
              child: const Text('Next Image'),
            ),
          ],
        ),
      ),
    );
  }
} 