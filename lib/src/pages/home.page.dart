import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temp'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      // initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(context, snapshot.data),
        );
      },
    );
  }

  List<Widget> _listItems(BuildContext context, List<dynamic>? data) {
    final List<Widget> lista = [];
    data?.forEach((element) {
      lista
        ..add(ListTile(
          title: Text(element['texto']),
          // subtitle: Text('Cualquier cosa'),
          leading: getIcon(element['icon']),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, element['ruta']);
            // final route = MaterialPageRoute(builder: (context) => AlertPage());
            // Navigator.push(context, route);
          },
        ))
        ..add(Divider());
    });

    return lista;
  }
}
