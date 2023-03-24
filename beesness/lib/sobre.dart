import 'package:flutter/material.dart';
import 'inicio.dart';
import 'edicao.dart';
import 'contatos.dart';
import 'scanner.dart';

class Sobre extends StatelessWidget {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sobre o App"),
      ),

      drawer: Drawer(
          child: SafeArea(
              child:Column(
                children: [

                  const SizedBox(height: 10),

                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Inicio()),
                      );
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text("Editar Perfil"),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Edicao()),
                      );
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.contacts_outlined),
                    title: Text("Meus Contatos"),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Contatos()),
                      );
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.camera_alt_outlined),
                    title: Text("Scannear QR Code"),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Scanner()),
                      );
                    },
                  ),

                ],
              )
          )
      ),
    );
  }
}