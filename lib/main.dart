import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sbsr_admin_panel/Core/Theme/Theme.dart';
import 'package:sbsr_admin_panel/Presentation/UI/BusScreen/AddBusScreen/AddBusScreenView.dart';
import 'package:sbsr_admin_panel/Presentation/UI/BusScreen/BusScreenView.dart';
import 'package:sbsr_admin_panel/Presentation/UI/HomeScreen/HomeView.dart';
import 'package:sbsr_admin_panel/Presentation/UI/StationScreen/StationScreenView.dart';
import 'package:sbsr_admin_panel/firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.greenTheme,
      routes: {
        HomeView.routeName: (_) => const HomeView(),
        BusScreenView.routeName: (_) => const BusScreenView(),
        StationScreenView.routeName: (_) => const StationScreenView(),
        AddBusScreenView.routeName: (_) => const AddBusScreenView()
      },
      initialRoute: HomeView.routeName,
    );
  }
}
