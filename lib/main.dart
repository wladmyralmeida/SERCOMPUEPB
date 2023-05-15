import 'package:flutter/material.dart';
import 'package:todoapp/todo.dart';
import 'package:todoapp/widgets/custom_list_tile_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD App - Sercomp & Sertāo Desenvolve',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.orange,
          onPrimary: Color(0xFFFEFEFE), //PARA TEXTOS
          secondary: Color(0xFF171717),
          onSecondary: Color(0xFF171717),
          error: Color(0xFFFF5252),
          onError: Color(0xFFFF5252),
          background: Colors.grey,
          onBackground: Colors.grey,
          surface: Colors.orangeAccent,
          onSurface: Colors.white,
        ),
        fontFamily: 'Georgia',
      ),
      home: const MyHomePage(title: 'Lista de Coisas a Fazer - TODO'),
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
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();

  final List<Todo> _todoList = [
    Todo(
        title: 'Padaria',
        subtitle:
            'Ir a padaria comprar leite em pó desnatado e 3 reais de pão às 15:30'),
    Todo(
        title: 'Mercado',
        subtitle:
            'Ir ao mercado comprar café Santa Clara e 1 bandeija de 30 ovos de capoeira.'),
    Todo(
        title: 'Coworking - Sertão Desenvolve',
        subtitle:
            'Ir ao coworking me preparar tecnicamente para a quantidade de conteúdo irá ter no SERCOMP.'),
  ];
  @override
  Widget build(BuildContext context) {
    // final List<String> items =
    //     List<String>.generate(_todoList.length, (i) => '$i');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        child: Column(
          children: [
            Card(
              child: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                      labelText: "Título", border: OutlineInputBorder())),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Card(
              child: TextField(
                  controller: _subtitleController,
                  decoration: const InputDecoration(
                      labelText: "Descrição", border: OutlineInputBorder())),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _todoList.add(
                      Todo(
                        title: _titleController.text,
                        subtitle: _subtitleController.text,
                        isDone: false,
                      ),
                    );
                  });
                },
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.orangeAccent),
                ),
                child: const Text(
                  "Adicionar",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            CustomListTileWidget(todosList: _todoList),
          ],
        ),
      ),
    );
  }
}
