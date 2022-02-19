import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 20),
          _fadeInImage(),
          // Image.network(
          //     'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Descripción de imagen'))
        ],
      ),
    );
  }

  Widget _fadeInImage() {
    return FadeInImage(
      image: NetworkImage(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
      placeholder: AssetImage('assets/jar-loading.gif'),
      fadeInDuration: Duration(milliseconds: 700),
      height: 300,
      fit: BoxFit.cover,
    );
  }

  Widget _cardTipo1() {
    return Center(
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
