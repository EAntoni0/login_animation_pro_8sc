import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              //alineacion del eje vertical
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  //ancho de la pantalla calculado con wedia query
                  width: size.width,
                  height: 200,
                  child: RiveAnimation.asset('assets/animated_login_character.riv')
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
            
                    ),
                  ),
            
                  SizedBox(height: 10),
            
                  TextField(
                    //para ocultar la contraseña
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: (){
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  SizedBox(
                    width: size.width,
                    child: const Text('Forgot Password?',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      decoration: TextDecoration.underline
                    ),
                    ),
                  )

              ],
            ),
          )
      ),
    );
  }
}
