import 'package:firebase_auth/firebase_auth.dart';
import 'services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:beesness/inicio.dart';
class Entrar extends StatefulWidget {
  const Entrar({ Key? key }) : super(key: key);

  @override
  State<Entrar> createState() => _EntrarState();

}

class _EntrarState extends State<Entrar> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  bool _isPasswordVisible = false;

  Future<void> signIn() async {
    try {
      await AuthService().signIn(
        email: _controllerEmail.text,
        senha: _controllerSenha.text,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Inicio()),
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
          margin: EdgeInsets.all(50.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children:  [

              Text(
                'Login',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 70),

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
                signIn,
                /**
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Inicio()),
                  );
                },
                 **/
                child: const Text('        Entrar        '),
              ),
            ],
          )
      ),
/*
      floatingActionButton: TextButton(

        onPressed: (){
          Navigator.pop(context);
        },

        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
*/
    );
  }
}