import 'package:coffee_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAlat6l6hDqDDXDR1SbvX0VUVbiinsyGvc",  
      authDomain: "flutter-coffee-app-30c7e.firebaseapp.com",  
      projectId: "flutter-coffee-app-30c7e",  
      storageBucket: "flutter-coffee-app-30c7e.appspot.com",  
      messagingSenderId: "176780235755",  
      appId: "1:176780235755:web:bf2ae81164cddfe1427fae",  
      measurementId: "G-HW9M0WPFR1" 
    )
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const HomePage(),
      theme: ThemeData(brightness: Brightness.dark,
      primarySwatch: Colors.orange,),
    );
    
  }
}