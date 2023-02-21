// Arquivo: home_page
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final storage = GetStorage();

  @override
  void initState() {
      storage.listen(() {
        debugPrint('A Storage foi alterado!');
      });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var name = storage.read('nameKey') ?? '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name),
            ElevatedButton(
              onPressed: () {
                storage.write('nameKey', 'Fernando Alexandre Wahl - Dev. Flutter');
                setState(() {

                });
              },
              child: const Text('Gravar nome'),
            ),
            ElevatedButton(
              onPressed: () {
                storage.remove('nameKey');
                setState(() {

                });
              },
              child: const Text('Excluir nome'),
            ),
          ],
        ),
      ),
    );
  }
}
