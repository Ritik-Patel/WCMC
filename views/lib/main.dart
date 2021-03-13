
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
      Views()
  );
}

class Views extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ViewState();
  }

}
class ViewState extends State<Views>{

  final navigatorKey = GlobalKey<NavigatorState>();
  final List<String> entries = <String>['CardView', 'ListView', 'GridView', 'ScrollView', 'Fragment', 'TabbedView', 'WebView'];
  int _selectedDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < entries.length; i++) {
      var d = entries[i];
      drawerOptions.add(
          new ListTile(
            title: new Text('$d'),
            selected: i == _selectedDrawerIndex,
            onTap: () => onSelectItem(i),
          )
      );
    }
    return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: new AppBar(
            // here we display the title corresponding to the fragment
            // you can instead choose to have a static title
            title: Text("Fragment View"),
          ),
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                    accountName: new Text("Ritik Patel"), accountEmail: Text("18IT099@charusat.edu.org")),
                new Column(children: drawerOptions)
              ],
            ),
          ),
          body: cardView(),
        )
    );
  }
  onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  Widget cardView() {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "This is Card View",
            style: TextStyle(fontSize: 30.0),
          ),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  navigatorKey.currentState.push(
                    MaterialPageRoute(builder: (context) {
                      return ListV();
                    }),
                  );
                },
                child: ListTile(
                  title: Text("ListView"),
                ),
              )),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  navigatorKey.currentState.push(
                    MaterialPageRoute(builder: (context) {
                      return GridV();
                    }),
                  );
                },
                child: ListTile(
                  title: Text("GridView & Scroll View"),
                ),
              )),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                },
                child: ListTile(
                  title: Text("Fragment"),
                ),
              )),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  navigatorKey.currentState.push(
                    MaterialPageRoute(builder: (context) {
                      return TabV();
                    }),
                  );
                },
                child: ListTile(
                  title: Text("TabbedView"),
                ),
              )),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  navigatorKey.currentState.push(
                    MaterialPageRoute(builder: (context) {
                      return WebV();
                    }),
                  );
                },
                child: ListTile(
                  title: Text("WebView"),
                ),
              )),
        ],
      ),
    );
  }
}

class TabV extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('18IT099'),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        )
    );
  }
}


class ListV extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("18IT099"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.lightBlueAccent,
            child: const Center(child: Text('Welcome')),

          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('To')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('List View')),
          ),
        ],
      ),
    );
  }
}

class GridV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("18IT099"),
        ),
        body: Container(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text("This is grid and scroll view"),
                  color: Colors.teal[50],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text("CardView"),
                  color: Colors.teal[100],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('ListView'),
                  color: Colors.teal[200],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('GridView'),
                  color: Colors.teal[300],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('ScrollView'),
                  color: Colors.teal[400],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Fragment'),
                  color: Colors.teal[500],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('TabbedView'),
                  color: Colors.teal[600],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('WebView'),
                  color: Colors.teal[600],
                ),
              ],
            )
        )
    );
  }
}

class WebV extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebState();
  }
}
class WebState extends State<WebV>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: WebView(
        initialUrl: 'https://github.com/Ritik-Patel',
      ),
    );
  }
}