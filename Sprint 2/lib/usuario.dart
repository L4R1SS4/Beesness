import 'package:flutter/material.dart';
import 'inicio.dart';
import 'edicao.dart';
import 'scanner.dart';
import 'sobre.dart';
import 'contatos.dart';

class Usuario extends StatelessWidget {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Dados do Contato"),
      ),
/*
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

            ],
          )
        )
      ),
*/
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

              const Text(
                'Nome do Usuário',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const Text(
                'Empresa',
              ),

              const Text(
                'Cargo ocupado',
              ),

              const SizedBox(height: 30),

              const Row(
                children: <Widget>[
                  Text(
                    'Telefone: (99) 99999-9999',
                  ),
                ]
              ),

              const SizedBox(height: 5),

              const Row(
                children: <Widget>[
                  Text(
                    'Email: nome@mail.com',
                  ),
                ]
              ),

              const SizedBox(height: 5),

              const Column(
                children: <Widget>[
                  Text(
                    'Non enim esse et veniam rerum et dicta quis cum officiis ipsam ex nobis assumenda nam nemo exercitationem. Non deleniti porro est magnam error qui accusamus aspernatur aut enim deserunt est internos doloribus et autem culpa. Ea tenetur voluptas et nisi modi qui pariatur provident et quaerat dolorem est quod deleniti est totam rerum et molestias quidem.',
                    textAlign: TextAlign.justify,
                  )
                ]
              ),

              const SizedBox(height: 5),

              const Row(
                children: <Widget>[
                  Text(
                    'https://links.com\nhttps://links.com\nhttps://links.com',
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