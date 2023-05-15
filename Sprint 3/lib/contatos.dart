import 'package:flutter/material.dart';
import 'inicio.dart';
import 'edicao.dart';
import 'scanner.dart';
import 'sobre.dart';
import 'usuario.dart';
import 'database_helper.dart';

final DatabaseHelper dbHelper = DatabaseHelper();

class Contatos extends StatefulWidget {
  const Contatos({super.key});

  Future<List<Widget>> contatosWidget(int idUsuario) async {
    List contatos = await dbHelper.getAllContatoFromUsuario(idUsuario);

    List<Widget> contatosCards = [];
    for (var contato in contatos) {
      contatosCards.add(ContatoCard(contato: contato));
    }

    contatosCards.insert(
        0,
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: TextField(
            onChanged: (text) {},
            decoration: const InputDecoration(
                labelText: "Pesquisar",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ));

    return contatosCards;
  }

  @override
  State<Contatos> createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Contatos"),
        ),
        drawer: Drawer(
            child: SafeArea(
                child: Column(
          children: [
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Inicio()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Editar Perfil"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Edicao()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt_outlined),
              title: Text("Scannear QR Code"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Scanner()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("Sobre"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sobre()),
                );
              },
            ),
          ],
        ))),
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: FutureBuilder<List<Widget>>(
                    future: widget.contatosWidget(4),
                    builder: (context, snapshot) {
                      List<Widget>? items = snapshot.data;

                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Center(
                            child: Column(
                              children: [
                                CircularProgressIndicator(),
                                Text('Carregando..')
                              ],
                            ),
                          );
                          break;
                        case ConnectionState.waiting:
                          return const Center(
                            child: Column(
                              children: [
                                CircularProgressIndicator(),
                                Text('Carregando..')
                              ],
                            ),
                          );
                          break;
                        case ConnectionState.active:
                          return const Center(
                            child: Column(
                              children: [
                                CircularProgressIndicator(),
                                Text('Carregando..')
                              ],
                            ),
                          );
                          break;
                        case ConnectionState.done:
                          if (snapshot.hasData && items != null) {
                            if (items.isNotEmpty) {
                              return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: items);
                            }
                            return const Center(
                                child: Column(children: [
                              Icon(Icons.error_outline, size: 128),
                              Text('Você não possui contatos.',
                                  style: TextStyle(fontSize: 32))
                            ]));
                          }
                          return const Text(' Erro ao carregar contatos. ');
                          break;
                      }
                      return const Text('Erro desconhecido.');
                    }))));
  }
}

class ContatoCard extends StatelessWidget {
  final Map contato;

  const ContatoCard({required this.contato, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        //child: Image.asset('images/user.png'),
        child: contato[DatabaseHelper.columnNomeUsuario]!='ni'?Text(contato[DatabaseHelper.columnNomeUsuario][0]):
                                                               Text(contato[DatabaseHelper.columnEmailUsuario][0])
      ),
      title: contato[DatabaseHelper.columnNomeUsuario]!='ni'?Text(contato[DatabaseHelper.columnNomeUsuario]):
                                                             Text(contato[DatabaseHelper.columnEmailUsuario]),
      subtitle: Text(contato[DatabaseHelper.columnEmpresaUsuario]),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Usuario(contato: contato)),
        );
      },
    );
  }
}
