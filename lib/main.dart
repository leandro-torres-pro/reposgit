import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          buttonTheme: const ButtonThemeData(
          buttonColor: Colors.amber,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const MyHomePage(title: 'Contador'),
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
  int metacounter = 5;
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
    
      _counter++;
    });
  }

  void _desincrementCounter() {
    setState(() {
    if (_counter>0){
      _counter--;
    }
    });
  }
  void _zeroincrementCounter() {
    setState(() {
    
      _counter= 0;
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
  
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                 CircularProgressIndicator(
                  value: _counter / metacounter,
                  color: _counter > metacounter? Colors.red : Colors.green,
                  strokeAlign: 40,
                  strokeCap: StrokeCap.round,
                  
                ),
                Text(
              '$_counter',
              style: TextStyle(
                fontSize: 40,
                color: _counter > metacounter? Colors.red : Colors.green,
              )
              )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:100),
              child: FloatingActionButton(
                onPressed: _zeroincrementCounter,
                tooltip: 'Reiniciar',
                child: const Icon(Icons.refresh)
                  
                ),
            ),
          ],
        ),
      ),

      floatingActionButton: _fab(),
    );
  }
Widget _fab(){
  return  Container(
    margin: const EdgeInsets.only(top: 15, left: 40, bottom: 0, right: 15),
    padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 15),
    decoration:
    const BoxDecoration(
      color: Color.fromRGBO(12, 170, 136, 1),
      borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft:Radius.circular(50)),
    ),
    child: Row(
  
      mainAxisAlignment: MainAxisAlignment.spaceAround,
  
      children: [
      FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Adicionar',
        child: const Icon(Icons.add),
      ),
      ElevatedButton(
        style: 
        ElevatedButton.styleFrom(
          padding: 
          const EdgeInsets.symmetric(horizontal: 50, vertical: 20)
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Definar Meta'),
                content: TextField(
                  onChanged: (value) {
                    // Você pode usar este valor como quiser
                    try {
                      metacounter = int.parse(value);
                    } catch (e) {
                      metacounter = 1;
                    }
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Confimar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Text('Meta'),
      ),
      FloatingActionButton(
        onPressed: _desincrementCounter,
        tooltip: 'Remover',
        child: const Icon(Icons.remove),
      ),
      ],
    ),
  );
}
  
}
