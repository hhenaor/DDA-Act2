import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DDA ACT1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FormularioPage(),
    SobrePage(),
  ];

  static const List<String> _widgetTitles = <String>[
    'DDA ACT1 - Formulario',
    'DDA ACT1 - Sobre',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_widgetTitles[_selectedIndex]),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text('DDA ACT1',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            ListTile(
              title: const Text('Formulario'),
              selected: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              title: const Text('Sobre'),
              selected: _selectedIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
          ],
        ),
      ),
    );
  }
}

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  @override
  State<FormularioPage> createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final _nameController = TextEditingController();
  int _age = 16;

  void _incrementAge() => setState(() => _age++);
  void _decrementAge() => setState(() => _age > 0 ? _age-- : null);

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Ingrese su nombre'),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.person, size: 30),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text('Ingrese su edad'),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                  icon: const Icon(Icons.remove), onPressed: _decrementAge),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text('$_age',
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              IconButton.filled(
                  icon: const Icon(Icons.add), onPressed: _incrementAge),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DisplayPage(
                      name: _nameController.text,
                      age: _age,
                    ),
                  ),
                );
              },
              child: const Text('Enviar'),
            ),
          ),
        ],
      ),
    );
  }
}

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    const boldStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 16, height: 1.5);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CIPA “React”:',
            style: boldStyle.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 16),
          const Text('Sergio Luis Berrio Baena', style: boldStyle),
          const Text('Horacio de Jesús Henao Ripoll', style: boldStyle),
          const Text('Dairo Jesus Montiel Herrera', style: boldStyle),
          const Text('Yoleimis Ruiz Bermudez', style: boldStyle),
        ],
      ),
    );
  }
}

class DisplayPage extends StatelessWidget {
  final String name;
  final int age;

  const DisplayPage({super.key, required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hola ${name.isNotEmpty ? name : 'persona'}, tienes $age años',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Regresar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}