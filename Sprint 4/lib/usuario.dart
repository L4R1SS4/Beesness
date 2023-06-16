import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'contatos.dart';

class Usuario extends StatefulWidget {
  final String userId;

  Usuario({required this.userId});

  @override
  State<Usuario> createState() => _UsuarioState();

}

class _UsuarioState extends State<Usuario> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  String nome = '';
  String email = '';
  String telefone = '';
  String empresa = '';
  String cargo = '';
  String biografia = '';
  String links = '';
  String linkedIn = '';
  String facebookController = '';
  String instagram = '';
  String twitter = '';

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('USERS')
          .doc(widget.userId)
          .get();
      final data = snapshot.data();
      if (data != null) {
        setState(() {
          nome = data['nome'];
          email = data['email'];
          telefone = data['telefone'];
          empresa = data['empresa'];
          cargo = data['cargo'];
          biografia = data['biografia'];
          links = data['links'];
          linkedIn = data['linkedin'];
          facebookController = data['facebook'];
          instagram = data['instagram'];
          twitter = data['twitter'];
        });
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
          title: Text("Dados do Contato"),
          automaticallyImplyLeading: false,
        ),

        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
          Container(
            alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                  child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          nome,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22, // Tamanho do texto (em pixels)
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

                        const SizedBox(height: 60),

                        Row(
                            children: <Widget>[
                              const Text(
                                'Email: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                email,
                              ),
                            ]
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: <Widget>[
                            const Text(
                              'Telefone: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              telefone,
                            ),
                          ]
                        ),

                        const SizedBox(height: 10),

                        const Row(
                            children: <Widget>[
                              Text(
                                'Biografia:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]
                        ),

                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                biografia,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Row(
                            children: <Widget>[
                              const Text(
                                'Links: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                links,
                              ),
                            ]
                        ),

                        const SizedBox(height: 10),

                        Row(
                            children: <Widget>[
                              const Text(
                                'LinkedIn: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                linkedIn,
                              ),
                            ]
                        ),

                        const SizedBox(height: 10),

                        Row(
                            children: <Widget>[
                              const Text(
                                'Facebook: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                facebookController,
                              ),
                            ]
                        ),

                        const SizedBox(height: 10),

                        Row(
                            children: <Widget>[
                              const Text(
                                'Instagram: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                instagram,
                              ),
                            ]
                        ),

                        const SizedBox(height: 10 ),

                        Row(
                            children: <Widget>[
                              const Text(
                                'Twitter: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                twitter,
                              ),
                            ]
                          ),
                      ],
                  ),
              ),
          ),
          Positioned(
            bottom: 15,
            child: FilledButton.tonal(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Contatos()),
                );
              },
              child: const Text('   Lista de Contatos   '),
            ),
          ),
        ],
      ),
    );
  }
}