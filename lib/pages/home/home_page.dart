// Arquivo: home_page
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
// os listeners são bem importantes para controlar alguma funcionalidade de escuta da tela ou do app.

class _HomePageState extends State<HomePage> {
  final storage = GetStorage();
  late final VoidCallback listen;

  @override
  void initState() {
      listen = storage.listen(() {
        //recebe apenas uma notificação do que foi alterado..
        debugPrint('A Storage foi alterado!');
      });

      // temos outra possibildiade de escutarmos as mudanças de cada chave especifica com o listenKey:
      storage.listenKey('nameKey', (value) {
        debugPrint('Chave alteradda: $value');
      });
    super.initState();
  }

  //devemos sempre descartar um listem quando saimos da tela, para isso devemos usar o dispose:
  @override
  void dispose() {
    listen();
    super.dispose();
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
            ElevatedButton(
              onPressed: () {
                // iso ja faz com que a "escuta" das storages para de funcioar.
                // nao tem um objetivo muito claro, mas é uma possibilidade. 
                listen();
              },
              child: const Text('Removendo Listen'),
            ),
          ],
        ),
      ),
    );
  }
}
