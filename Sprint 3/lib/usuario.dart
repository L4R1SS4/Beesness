import 'package:flutter/material.dart';
import 'inicio.dart';
import 'edicao.dart';
import 'scanner.dart';
import 'sobre.dart';
import 'contatos.dart';
import 'database_helper.dart';

final DatabaseHelper dbHelper = DatabaseHelper();

class Usuario extends StatelessWidget {
  final Map contato;

  Usuario({super.key, required this.contato});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Dados do Contato"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://cdn-icons-png.flaticon.com/512/1373/1373255.png")
                  )
                ),
              ),

              const SizedBox(height: 5),

              Text(
                contato[DatabaseHelper.columnNomeUsuario],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              Text(
                contato[DatabaseHelper.columnEmpresaUsuario],
              ),

              Text(
                contato[DatabaseHelper.columnCargoUsuario],
              ),

              const SizedBox(height: 30),

              Row(
                children: <Widget>[
                  Text(
                    'Telefone: '+contato[DatabaseHelper.columnTelefoneUsuario],
                  ),
                ]
              ),

              const SizedBox(height: 5),

              Row(
                children: <Widget>[
                  Text(
                    'Email: '+contato[DatabaseHelper.columnEmailUsuario],
                  ),
                ]
              ),

              const SizedBox(height: 5),

              Column(
                children: <Widget>[
                  Text(
                    contato[DatabaseHelper.columnBiografiaUsuario],
                    textAlign: TextAlign.justify,
                  )
                ]
              ),

              const SizedBox(height: 5),

              Row(
                children: <Widget>[
                  Text(
                    contato[DatabaseHelper.columnLinkUsuario],
                  ),
                ]
              ),

              const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              FloatingActionButton(
                onPressed: (){
                  //Navigator.pop(context);
                },

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),

                child: const Icon(Icons.work),
              ),

              FloatingActionButton(
                onPressed: (){
                  //Navigator.pop(context);
                },

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),

                child: const Icon(Icons.facebook),
              ),

              FloatingActionButton(
                onPressed: (){
                  //Navigator.pop(context);
                },

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),

                child: const Icon(Icons.camera_alt_outlined),
              ),

              FloatingActionButton(
                onPressed: (){
                  //Navigator.pop(context);
                },

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),

                child: const Icon(Icons.text_fields),
              ),
]),

              const SizedBox(height: 30),

              FilledButton.tonal(
                onPressed: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Inicio()),
                  );*/
                },
                child: const Text('    Salvar Contato    '),
              )

            ]
          )
        )
      )
    );
  }
}