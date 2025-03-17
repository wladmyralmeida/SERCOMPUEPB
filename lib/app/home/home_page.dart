import 'package:flutter/material.dart';
import 'package:todoapp/todo.dart';
import 'package:todoapp/widgets/custom_list_tile_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  final VoidCallback onToggleTheme;

  const HomePage({super.key, required this.title, required this.onToggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  List<Todo> filteredTodosList = [];
  final List<Todo> _todoList = [
    Todo(title: 'Padaria', subtitle: 'Comprar leite em pó e pão às 15:30'),
    Todo(title: 'Mercado', subtitle: 'Comprar café Santa Clara e ovos.'),
    Todo(title: 'Coworking', subtitle: 'Preparação técnica para o SERCOMP.'),
  ];

  @override
  void initState() {
    super.initState();
    filteredTodosList = List.from(_todoList);
  }

  void filterTodos(String query) {
    setState(() {
      filteredTodosList = _todoList
          .where(
              (todo) => todo.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void addTodo() {
    if (_titleController.text.isNotEmpty &&
        _subtitleController.text.isNotEmpty) {
      setState(() {
        final newTodo = Todo(
          title: _titleController.text,
          subtitle: _subtitleController.text,
          isDone: false,
        );
        _todoList.add(newTodo);
        filteredTodosList.add(newTodo);
        _titleController.clear();
        _subtitleController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          // ✅ Botão de alternar tema
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputField(
              controller: _titleController,
              label: "Título",
              onChanged: filterTodos,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildInputField(
                      controller: _subtitleController, label: "Descrição"),
                ),
                IconButton(
                  icon: const Icon(Icons.format_clear),
                  onPressed: () {
                    setState(() {
                      _titleController.clear();
                      _subtitleController.clear();
                    });
                  },
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(),
            ),
            const Center(
              child: Text(
                'Minhas tarefas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: filteredTodosList.isEmpty
                  ? const Center(child: Text('Nenhuma tarefa encontrada!'))
                  : CustomListTileWidget(todosList: filteredTodosList),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    void Function(String)? onChanged,
  }) {
    return Card(
      elevation: 2,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
      ),
    );
  }
}
