import 'package:flutter/material.dart';
import 'inicio.dart';
import 'edicao.dart';
import 'scanner.dart';
import 'sobre.dart';
import 'usuario.dart';

class Contatos extends StatelessWidget {

  final scaffoldKey = GlobalKey<ScaffoldState>();

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

                ],
              )
          )
      ),

      body: Container(
        //alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextField(
                  onChanged: (text) {
                  },
                  decoration: const InputDecoration(
                    labelText: "Pesquisar",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(25.0)
                      )
                    )
                  ),
                ),
              ),

              ListTile(
                leading: const CircleAvatar(
                  //child: Image.asset('images/user.png'),
                  child: Text('A'),
                ),
                title: Text('Nome'),
                subtitle: Text('Empresa'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usuario()),
                  );
                },
              ),

              ListTile(
                leading: const CircleAvatar(
                  //child: Image.asset('images/user.png'),
                  child: Text('B'),
                ),
                title: Text('Nome'),
                subtitle: Text('Empresa'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usuario()),
                  );
                },
              ),

              ListTile(
                leading: const CircleAvatar(
                  //child: Image.asset('images/user.png'),
                  child: Text('C'),
                ),
                title: Text('Nome'),
                subtitle: Text('Empresa'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usuario()),
                  );
                },
              ),

              ListTile(
                leading: const CircleAvatar(
                  //child: Image.asset('images/user.png'),
                  child: Text('D'),
                ),
                title: Text('Nome'),
                subtitle: Text('Empresa'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usuario()),
                  );
                },
              ),

              ListTile(
                leading: const CircleAvatar(
                  //child: Image.asset('images/user.png'),
                  child: Text('E'),
                ),
                title: Text('Nome'),
                subtitle: Text('Empresa'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usuario()),
                  );
                },
              ),

              ListTile(
                leading: const CircleAvatar(
                  //child: Image.asset('images/user.png'),
                  child: Text('F'),
                ),
                title: Text('Nome'),
                subtitle: Text('Empresa'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usuario()),
                  );
                },
              ),

              ListTile(
                leading: const CircleAvatar(
                  //child: Image.asset('images/user.png'),
                  child: Text('G'),
                ),
                title: Text('Nome'),
                subtitle: Text('Empresa'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usuario()),
                  );
                },
              ),

              ListTile(
                leading: const CircleAvatar(
                  //child: Image.asset('images/user.png'),
                  child: Text('H'),
                ),
                title: Text('Nome'),
                subtitle: Text('Empresa'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usuario()),
                  );
                },
              ),

              ListTile(
                leading: const CircleAvatar(
                  //child: Image.asset('images/user.png'),
                  child: Text('I'),
                ),
                title: Text('Nome'),
                subtitle: Text('Empresa'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usuario()),
                  );
                },
              ),

              ListTile(
                leading: const CircleAvatar(
                  //child: Image.asset('images/user.png'),
                  child: Text('J'),
                ),
                title: Text('Nome'),
                subtitle: Text('Empresa'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usuario()),
                  );
                },
              ),

              ListTile(
                leading: const CircleAvatar(
                  //child: Image.asset('images/user.png'),
                  child: Text('K'),
                ),
                title: Text('Nome'),
                subtitle: Text('Empresa'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usuario()),
                  );
                },
              ),

              ListTile(
                leading: const CircleAvatar(
                  //child: Image.asset('images/user.png'),
                  child: Text('L'),
                ),
                title: Text('Nome'),
                subtitle: Text('Empresa'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usuario()),
                  );
                },
              ),

            ]
          )
        )
      )
    );
  }
}