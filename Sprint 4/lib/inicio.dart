import 'package:flutter/material.dart';
import 'edicao.dart';
import 'contatos.dart';
import 'scanner.dart';
import 'sobre.dart';
import 'package:beesness/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Inicio extends StatefulWidget {
  const Inicio({ Key? key }) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String nome = "";
  String empresa = "";
  String cargo = "";

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final snapshot = await FirebaseFirestore.instance
            .collection('USERS')
            .doc(currentUser.uid)
            .get();
        final data = snapshot.data();
        if (data != null) {
          setState(() {
            nome = data['nome'];
            empresa = data['empresa'];
            cargo = data['cargo'];
          });
        }
      }
    } catch (e) {
      print('Error retrieving user data: $e');
    }
  }

  QrImageView _qrCode() {

    return QrImageView(
      data: FirebaseAuth.instance.currentUser!.uid,
      version: QrVersions.auto,
      size: 250.0,
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,

        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Home"),
        ),

        drawer: Drawer(
            child: SafeArea(
                child:Column(
                  children: [

                    const SizedBox(height: 10),

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
                      leading: Icon(Icons.camera_alt_outlined),
                      title: Text("Scannear QR Code"),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Scanner()),
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
                      leading: Icon(Icons.info_outline),
                      title: Text("Sobre"),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Sobre()),
                        );
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("Log out"),
                      onTap: (){
                        AuthService().signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                    ),
                  ],
                )
            )
        ),

        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text(
                  nome,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24, // Tamanho do texto (em pixels)
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  cargo,
                  style: const TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 5),

                Text(
                  empresa,
                  style: const TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 30),

                _qrCode(),

                const SizedBox(height: 40),

                Image.asset('images/logo.png', width: 90, height: 90,),

              ]
          ),
        )
    );
  }
}