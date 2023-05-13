import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/product_tile.dart';
import 'models/cart.dart';
import 'models/item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CartModel>(create: (context) => CartModel())
        ],
        child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title),
          ),
          body: CustomScrollView(
            primary: false,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  children: <Widget>[
                    ProductTile(item: Item("Punsch", 1)),
                    ProductTile(item: Item("Glühweihn", 1)),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.green[600],
                      child: const Center(child: Text('Next')),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.green[600],
                      child: const Center(child: Text('Next')),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  childAspectRatio: 2,
                  children: <Widget>[
                    ProductTile(item: Item("100€", -100)),
                    ProductTile(item: Item("50€", -50)),
                    ProductTile(item: Item("20€", -20)),
                    ProductTile(item: Item("10€", -10)),
                    ProductTile(item: Item("5€", -5)),
                    ProductTile(item: Item("2€", -2)),
                    ProductTile(item: Item("1€", -1)),
                    ProductTile(item: Item("50ct", -0.5)),
                    ProductTile(item: Item("20ct", -0.2)),
                    ProductTile(item: Item("10ct", -0.1)),
                    ProductTile(item: Item("5ct", -0.05)),
                    ProductTile(item: Item("2ct", -0.02)),
                    ProductTile(item: Item("1ct", -0.01)),
                  ]
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
