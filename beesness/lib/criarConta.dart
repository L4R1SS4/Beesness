import 'package:flutter/material.dart';
import 'inicio.dart';

class CriarConta extends StatelessWidget {
  const CriarConta({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(50.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children:  [

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
            ),

            const SizedBox(height: 10),

            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Confirmar enha',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Inicio()),
                );
              },
              child: const Text('    Criar Conta    '),
            )

          ],
        )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),

        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}