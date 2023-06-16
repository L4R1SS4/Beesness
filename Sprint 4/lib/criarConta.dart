import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:beesness/edicao.dart';

class CriarConta extends StatefulWidget {
  const CriarConta({ Key? key }) : super(key: key);

  @override
  State<CriarConta> createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  bool _isPasswordVisible = false;

  Future<void> cadastro() async {
    try {
      await AuthService().cadastro(email: _controllerEmail.text, senha: _controllerSenha.text);

      FirebaseFirestore.instance.collection('USERS').doc(FirebaseAuth.instance.currentUser!.uid).set({
        'nome': "",
        'email': "",
        'telefone': "",
        'empresa': "",
        'cargo': "",
        'biografia': "",
        'links': "",
        'linkedin': "",
        'facebook': "",
        'instagram': "",
        'twitter': "",
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Edicao()),
      );

    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(

        ),

        body: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(50, 0 , 50, 0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children:  [

                  Text(
                    'Cadastro',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),

                  const SizedBox(height: 60),

                  TextFormField(
                    controller: _controllerEmail,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    controller: _controllerSenha,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    obscureText: !_isPasswordVisible,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  _errorMessage(),

                  const SizedBox(height: 40),

                  FilledButton.tonal(
                    onPressed:
                        cadastro,
                    child: const Text('    Criar Conta    '),
                  )

                ]
            )
        )
    );
  }


}