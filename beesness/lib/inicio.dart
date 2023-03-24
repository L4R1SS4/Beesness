import 'package:flutter/material.dart';
import 'edicao.dart';
import 'contatos.dart';
import 'scanner.dart';
import 'sobre.dart';

class Inicio extends StatelessWidget {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              width: 115,
              height: 115,
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
              'Nome do Usuário',
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            Text(
              'Empresa',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            Text(
              'Cargo ocupado',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 30),

            Image.asset('images/qrcode.png', width: 250, height: 250,),

          ]
        ),
      )
    );
  }
}