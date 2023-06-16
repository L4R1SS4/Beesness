import 'package:flutter/material.dart';
import 'inicio.dart';
import 'edicao.dart';
import 'contatos.dart';
import 'scanner.dart';
import 'main.dart';
import 'services/auth_service.dart';

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
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Beesness',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 45),

              const Text(
                '   Beesness é um aplicativo para dispositivos móveis desenvolvido por João Vitor Lima de Melo, Larissa Valadares Silqueira, Leonardo Barbosa Brandão e Pedro Correa Rigotto, alunos de Ciência da Computação da Pontifícia Universidade Católica de Minas Gerais.\n\n'
                '   Com o Beesness é possível criar um cartão de visita digital para seu perfil profissional e adicionar e gerenciar os cartões de visita de usuários do seu interesse, como amigos, colegas de trabalho e demais profissionais de diversas áreas.\n\n'
                '   Você pode personalizar o seu cartão de visita virtual adicionando uma foto de perfil, seu cargo atual, o nome da empresa em que trabalha e demais informações de contato como telefone, e-mail, redes sociais e links para sites profissionais, além de ter a opção de adicionar uma pequena biografia.\n\n'
                '   Com o Beesness, você não precisará se preocupar em guardar cartões de visita físicos. Nele, é possível compartilhar o seu cartão com outras pessoas através de um QR Code, e se essas pessoas também estiverem cadastradas no aplicativo, elas poderão visualizar suas informações e adicionar seu cartão em uma lista de contatos para posteriores acessos.\n',
                textAlign: TextAlign.justify,
              ),

              const SizedBox(height: 25),

              Image.asset('images/logo.png', width: 100, height: 100,),
            ]
          )
        )
      )
    );
  }
}