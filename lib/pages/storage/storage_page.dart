// Arquivo: storage_page
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage_exemple/pages/storage/storage/storage.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({Key? key}) : super(key: key);

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  final storage = Storage();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Storage Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Olhar nos commits para verificar as técnicas utilizadas'),
            const SizedBox(
              height: 50,
            ),
            Text(storage.name),
            ElevatedButton(
              onPressed: () {
                storage.name = 'Fernando Alexandre Wahl - Dev. Flutter';
                setState(() {});
              },
              child: const Text('Gravar nome'),
            ),
            ElevatedButton(
              onPressed: () {
                storage.name = '';
                setState(() {});
              },
              child: const Text('Excluir nome'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                color: Theme.of(context).primaryColorDark,
                width: MediaQuery.of(context).size.width,
                height: 2,
              ),
            ),
            Text(storage.nameDois),
            ElevatedButton(
              onPressed: () {
                storage.nameDois =  'Desenvolvimento Flutter';
                setState(() {});
              },
              child: const Text('Gravar nome Dois'),
            ),
            ElevatedButton(
              onPressed: () {
                storage.nameDois = '';
                setState(() {});
              },
              child: const Text('Excluir nome Dois'),
            ),

          ],
        ),
      ),
    );
  }
}
