import 'package:flutter/material.dart';
import 'package:todoapp/todo.dart';
import 'package:todoapp/widgets/custom_list_tile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();

  final List<Todo> _todoList = [
    Todo(title: 'Padaria', subtitle: 'Ir a padaria comprar leite em pó desnatado e 3 reais de pão às 15:30'),
    Todo(title: 'Mercado', subtitle: 'Ir ao mercado comprar café Santa Clara e 1 bandeija de 30 ovos de capoeira.'),
    Todo(
        title: 'Coworking - Sertão Desenvolve',
        subtitle: 'Ir ao coworking me preparar tecnicamente para a quantidade de conteúdo irá ter no SERCOMP.'),
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
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: "Título", border: OutlineInputBorder())),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Card(
              child: TextField(
                  controller: _subtitleController,
                  decoration: const InputDecoration(labelText: "Descrição", border: OutlineInputBorder())),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Divider(
                height: 25,
              ),
            ),
            Text('V Sercomp'),
            SizedBox(
              height: 15,
            ),
            CustomListTileWidget(todosList: _todoList),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () {
          setState(
            () {
              _todoList.add(
                Todo(
                  title: _titleController.text,
                  subtitle: _subtitleController.text,
                  isDone: false,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
