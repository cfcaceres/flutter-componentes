import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _password = "";
  String _fecha = '';

  final OutlineInputBorder _border =
      OutlineInputBorder(borderRadius: BorderRadius.circular(15));

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createInputEmail(),
          SizedBox(height: 20),
          _createInputPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          Text('Nombre es: $_nombre'),
          Text('Email: $_email'),
          Text('Password: $_password'),
        ],
      ),
    );
  }

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];
  String _opcionSeleccionada = 'Volar';
  // drow
  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        DropdownButton(
          value: _opcionSeleccionada,
          items: getOpcionesDropdown(),
          onChanged: (opt) {
            setState(() {
              _opcionSeleccionada = opt.toString();
            });
          },
        ),
      ],
    );
  }
  // drow

  Widget _createInputPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Contraseña',
          hintText: 'Ingresar Contraseña',
          border: _border,
          icon: Icon(Icons.lock),
          suffixIcon: Icon(Icons.lock_open)),
      onChanged: (valor) => setState(() => _password = valor),
    );
  }

  Widget _createInputEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Ingresar Correo',
          labelText: 'Correo',
          border: _border,
          icon: Icon(Icons.email),
          suffixIcon: Icon(Icons.alternate_email)),
      onChanged: (valor) => setState(() => _email = valor),
    );
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          hintText: 'Ingresar nombre',
          labelText: 'Nombre',
          helperText: 'Solo nombres',
          counter: Text('Letras: ${_nombre.length}'),
          border: _border,
          icon: Icon(Icons.account_circle),
          suffixIcon: Icon(Icons.accessibility)),
      onChanged: (valor) => setState(() {
        _nombre = valor;
      }),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: _border,
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        // Quita el foco del input y lo pone al dialogo
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
}
