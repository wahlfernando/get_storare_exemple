import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage_exemple/pages/home/home_page.dart';
import 'package:get_storage_exemple/pages/storage/storage_page.dart';

void main() async{
  await GetStorage.init;
  await GetStorage.init('StorageDois');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(),
      home: const StoragePage(),
    );
  }
}
