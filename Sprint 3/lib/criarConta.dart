import 'package:flutter/material.dart';
import 'inicio.dart';
import 'database_helper.dart';

final dbHelper = DatabaseHelper();

class CriarContaPage extends StatefulWidget {
  const CriarContaPage({super.key});

  @override
  State<CriarContaPage> createState() => _CriarContaPageState();
}

class _CriarContaPageState extends State<CriarContaPage> {
  String? _email;
  String? _senha;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          appBar: AppBar(),
          body: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cadastro',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 60),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Senha',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _senha = value!;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Confirmar Senha',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),
                    FilledButton.tonal(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final row = {
                            DatabaseHelper.columnKeyQRCode: 'key_qrcode',
                            DatabaseHelper.columnEmailUsuario: _email,
                            DatabaseHelper.columnSenhaUsuario: _senha,
                            DatabaseHelper.columnNomeUsuario: 'ni',
                            DatabaseHelper.columnEmpresaUsuario: 'ni',
                            DatabaseHelper.columnCargoUsuario: 'ni',
                            DatabaseHelper.columnLinkUsuario: 'ni',
                            DatabaseHelper.columnBiografiaUsuario: 'ni',
                            DatabaseHelper.columnTelefoneUsuario: 'ni',
                            DatabaseHelper.columnLinkedinUsuario: 'ni',
                            DatabaseHelper.columnFacebookUsuario: 'ni',
                            DatabaseHelper.columnInstagramUsuario: 'ni',
                          };
                          dbHelper.insertUsuario(row);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Inicio()),
                          );
                        }
                      },
                      child: const Text('    Criar Conta    '),
                    )
                  ]))),
    );
  }
}
