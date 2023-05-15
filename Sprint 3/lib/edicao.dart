import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'inicio.dart';
import 'contatos.dart';
import 'scanner.dart';
import 'sobre.dart';

class Edicao extends StatefulWidget {

  @override
  State<Edicao> createState() => _EdicaoState();
}

class _EdicaoState extends State<Edicao> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final ImagePicker imgpicker = ImagePicker();

  String imagepath = "";

  late File imagefile;

  openImage() async {
    try {
      var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
      //you can use ImageCourse.camera for Camera capture
      if(pickedFile != null){
        imagepath = pickedFile.path;
        imagefile = File(imagepath);
        setState(() {
          if (pickedFile != null) {
            imagefile = File(pickedFile.path);
          } else {
            print('No image selected.');
          }
        });
      }else{
        print("No image is selected.");
      }
    }catch (e) {
      print("error while picking file.");
    }
  }

/*
  File? _image;

  Future getImage() async {
    final pickedFile =
    await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }
  */
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

      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
/*
                  FilledButton.tonal(
                    onPressed: getImage,
                    child: Text(' Escolher Foto de Perfil '),
                  ),

                  if (_image != null) Image.file(_image!),

 */
                  FilledButton.tonal(
                      onPressed: (){
                        openImage();
                      },
                      child: Text(" Escolher Foto de Perfil ")

                  ),

                  imagepath != ""?Image.file(imagefile!, height: 200,):
                  Container(
                    child: Text("No Image selected."),
                  ),

                ]
              ),

              const SizedBox(height: 10),

              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nome Completo',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 5),

              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 5),

              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Telefone',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 5),

              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Empresa',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 5),

              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Cargo',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 5),

              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Biografia',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 5),

              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Links',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 5),

              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'LinkedIn',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 5),

              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Facebook',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 5),

              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Instagram',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 5),

              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Twitter',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Edicao()),
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
}
