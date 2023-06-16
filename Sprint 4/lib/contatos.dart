import 'package:flutter/material.dart';
import 'inicio.dart';
import 'edicao.dart';
import 'scanner.dart';
import 'sobre.dart';
import 'usuario.dart';
import 'main.dart';
import 'package:beesness/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Contatos extends StatefulWidget {
  @override
  _ContatosState createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  final ScrollController controller = ScrollController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Contatos"),
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
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 7.0),
              child: TextField(
                controller: _searchController,
                onChanged: (text) {
                  setState(() {}); // Rebuild the UI based on the new search text
                },
                decoration: const InputDecoration(
                  labelText: "Pesquisar",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: CustomScrollView(
                controller: controller,
                slivers: <Widget>[
                  SliverFillRemaining(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('USERS').orderBy('nome').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        final contacts = snapshot.data!.docs;
                        final searchText = _searchController.text.toLowerCase();

                        // Filter contacts based on search text
                        final filteredContacts = contacts.where((contact) {
                          final data = contact.data() as Map<String, dynamic>;
                          final nome = (data['nome'] as String?)?.toLowerCase() ?? '';
                          final empresa = (data['empresa'] as String?)?.toLowerCase() ?? '';

                          return nome.contains(searchText) || empresa.contains(searchText);
                        }).toList();

                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: filteredContacts.length,
                          itemBuilder: (context, index) {
                            final contact = filteredContacts[index];
                            final data = contact.data() as Map<String, dynamic>;
                            final nome = data['nome'] as String?;
                            final empresa = data['empresa'] as String?;

                            return ListTile(
                              leading: CircleAvatar(
                                child: Text(nome?.substring(0, 1) ?? ''),
                              ),
                              title: Text(nome ?? ''),
                              subtitle: Text(empresa ?? ''),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Usuario(userId: contact.id),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}