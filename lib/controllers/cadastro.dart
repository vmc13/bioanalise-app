import 'package:bioanalise_app/controllers/login.dart';
import 'package:bioanalise_app/views/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../database/usuarios.dart';



class Cadastro extends StatefulWidget {
  Cadastro() ;

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _dataController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _psController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(padding: EdgeInsets.all(32.0),
        child: Column(
          children :[
            
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 150,
              child: Image.asset('images/Bio.png'),
            ),
            //Separarção entre a foto e o espaço de loguin.
            SizedBox(
              height: 20,
            ),
            //classe para incluir o email
            TextFormField(
              keyboardType: TextInputType.name,
                controller: _nomeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    label: Text('Digite seu nome'),
                    prefixIcon:
                    Icon(Icons.account_box_outlined))),
            SizedBox(
              height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _cpfController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    label: Text('Digite seu cpf'),
                    prefixIcon:
                    Icon(Icons.person_search))),
            SizedBox(
              height: 10),
              TextFormField(
                keyboardType: TextInputType.datetime,
                controller: _dataController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    label: Text('Digite Sua Data de nascimento'),
                    prefixIcon:
                    Icon(Icons.dataset))),
            SizedBox(
              height: 10),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    label: Text('Digite seu Telefone'),
                    prefixIcon:
                    Icon(Icons.phone_android))),
            SizedBox(
              height: 10),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    label: Text('Digite seu e-mail'),
                    prefixIcon: Icon(Icons.email))),
              SizedBox(
              height: 10),
            TextFormField(
                controller: _psController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    label: Text('Digite sua senha'), 
                    prefixIcon: Icon(Icons.key_off))),
            SizedBox(
              height: 25,
            ),

             Container(
                height:60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end:Alignment.bottomRight,
                    stops:[0.3,1],
                    colors:[
                      Color(0xFF1090C7),
                      Color(0xFF0EA1DF),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )
                ),
                child:SizedBox.expand(
                  child: TextButton(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(                          
                          "   Cadastrar",
                          style:TextStyle(
                            fontWeight: FontWeight.w600,
                            color:Colors.white,
                            fontSize:18,
                          ),
                          textAlign: TextAlign.left,
                          ),
                      ],
                    ),
                    onPressed: () {
                      cadastrar();
                      
                      final name = _nomeController.text;

                      createUser(name: name);
                    }
                  ),
                ),
              ),

              SizedBox(height: 15),

              Container(
                height:40,
                alignment: Alignment.center,
                child: TextButton(
                  child: Text(
                    "Já tem uma conta? Faça Login!",
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Login()));
                  }
                ),
              ),
            //botao para cadastrar usúario.
            ]
          ),
        ),
      )
    );
  }

  Future createUser({required String name}) async {
  // Reference to document
  final docUser = FirebaseFirestore.instance.collection('usuarios').doc();

  final user = Usuario (
    id: docUser.id,
    nome: name,
    email: _emailController.text,
    cpf: _cpfController.text,
    data: _dataController.text,
    phone: _phoneController.text
  );
  
  final json = user.toJson();
  // Create document and write data to firebase
  await docUser.set(json);
}

  cadastrar() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _psController.text);
      if (userCredential != null) {
        userCredential.user?.updateDisplayName(_nomeController.text);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Login()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Crie uma senha mas forte'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('este e-mail ja foi cadastrado, tente outro e-mail'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}
