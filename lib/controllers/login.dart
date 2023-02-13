import 'package:bioanalise_app/controllers/cadastro.dart';
import 'package:bioanalise_app/views/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


class Login extends StatefulWidget {
  const Login({key, title}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;
  
  bool _showPassword = false;

   @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user==null) {
        print('Você não tem um usuário logado!');
      } else {
        print('Você tem um usuário logado!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: [
            
              SizedBox(
                height: 75,
              ),
              Container(
                height: 200,
                child: Image.asset('images/Bio.png'),
              ),
              SizedBox(
                height: 60,
              ),
              TextField(
                controller: _emailController,
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    prefixIcon: Icon(Icons.person_rounded),
                    hintText: "Digite E-mail"),

              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _senhaController,
                obscureText: _showPassword == false ? true : false,
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    prefixIcon: Icon(Icons.key),
                    hintText: 'Digite Senha',
                    suffixIcon: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                      child: Icon( _showPassword == false ? Icons.visibility_off : Icons.visibility, color: 
                      Colors.grey,),
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                      });
                    },
                  ),
                ),
              ),),

              SizedBox(height: 5),

              Container(
                height:40,
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(
                    "Recuperar Senha", 
                  ),
                  onPressed: (){}
                ),
              ),

              const SizedBox(height: 15),

              // TESTE
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
                          "   Login",
                          style:TextStyle(
                            fontWeight: FontWeight.w600,
                            color:Colors.white,
                            fontSize:18,
                          ),
                          textAlign: TextAlign.left,
                          ),
                      ],
                    ),
                    onPressed: () => {
                      login()
                    },
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Container(
                height: 40,
                child: TextButton(
                  child: Text(
                    "Cadastre-se",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Cadastro()));
                  },
                )
              )
              // TESTE
            ],
          ),
        ),
      ),
    );
  }

  login() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _senhaController.text,
      );
      if (userCredential != null) {
        Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Usuário nao encontrado"),
          backgroundColor: Colors.redAccent,
        ),);
      } else if (e.code == 'wrong password') {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sua senha está errada"),
          backgroundColor: Colors.redAccent,
        ),
        );
      }
    }
  }
}





