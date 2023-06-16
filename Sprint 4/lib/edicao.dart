import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'inicio.dart';
import 'contatos.dart';
import 'scanner.dart';
import 'sobre.dart';
import 'main.dart';
import 'services/auth_service.dart';

class Edicao extends StatefulWidget {
  const Edicao({ Key? key }) : super(key: key);

  @override
  State<Edicao> createState() => _EdicaoState();
}

class _EdicaoState extends State<Edicao> {

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _empresaController = TextEditingController();
  final TextEditingController _cargoController = TextEditingController();
  final TextEditingController _biografiaController = TextEditingController();
  final TextEditingController _linksController = TextEditingController();
  final TextEditingController _linkedInController = TextEditingController();
  final TextEditingController _facebookController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _twitterController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
            _nomeController.text = data['nome'];
            _emailController.text = data['email'];
            _telefoneController.text = data['telefone'];
            _empresaController.text = data['empresa'];
            _cargoController.text = data['cargo'];
            _biografiaController.text = data['biografia'];
            _linksController.text = data['links'];
            _linkedInController.text = data['linkedin'];
            _facebookController.text = data['facebook'];
            _instagramController.text = data['instagram'];
            _twitterController.text = data['twitter'];
          });
        }
      }
    } catch (e) {
      print('Error retrieving user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        key: scaffoldKey,

        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Editar"),
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

        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    const SizedBox(height: 5),

                    TextFormField(
                      controller: _nomeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
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
                      controller: _empresaController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Empresa',
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
                      controller: _cargoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Cargo',
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
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
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
                      controller: _telefoneController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Telefone',
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
                      controller: _biografiaController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Biografia',
                      ),
                      maxLines: 5, // Definindo o número máximo de linhas
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _linksController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Links',
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
                      controller: _linkedInController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'LinkedIn',
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
                      controller: _facebookController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Facebook',
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
                      controller: _instagramController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Instagram',
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
                      controller: _twitterController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Twitter',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    FilledButton.tonal(
                      onPressed: () {
                        update();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Inicio()),
                        );
                      },
                      child: const Text('        Salvar        '),
                    ),
                  ]
              ),
            )
        )
    );

  }

  update(){
    FirebaseFirestore.instance.collection('USERS').doc(FirebaseAuth.instance.currentUser!.uid).update({
      'nome': _nomeController.text,
      'email': _emailController.text,
      'telefone': _telefoneController.text,
      'empresa': _empresaController.text,
      'cargo': _cargoController.text,
      'biografia': _biografiaController.text,
      'links': _linksController.text,
      'linkedin': _linkedInController.text,
      'facebook': _facebookController.text,
      'instagram': _instagramController.text,
      'twitter': _twitterController.text,
    });
  }
}
