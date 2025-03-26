import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supermercado',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const IniciarComponentePrincipalDoApp(),
    );
  }
}

class IniciarComponentePrincipalDoApp extends StatelessWidget {
  const IniciarComponentePrincipalDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF07400),
        title: const Text('Lista de Tarefas'),
        centerTitle: true,
      ), //Cabeçalho
      drawer: Drawer(
        child: ListView(
          children: [
            const Text(
              'Departamentos',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Tauste Supermercados'),
              subtitle: Text('Bem-vindo ao Tauste!'),
              tileColor: Colors.indigo[900],
              textColor: Colors.white,
              onTap: () => showAboutDialog(
                  applicationName: 'Tauste',
                  applicationVersion: '1.0',
                  context: context),
            ),
            ListTile(
              title: Text('Concorrencia'),
              subtitle: Text('Bem-vindo a concorrencia!'),
              tileColor: Colors.green,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
      body: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
