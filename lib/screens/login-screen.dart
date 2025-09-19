import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controladores de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Focus nodes
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  // Timers de inactividad
  Timer? _idleTimerEmail;
  Timer? _idleTimerPassword;

  // Animaciones Rive
  StateMachineController? controller;
  SMIBool? isChecking;
  SMIBool? isHandsUp;
  SMINumber? numLook;
  SMITrigger? trigSuccess;
  SMITrigger? trigFail;

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    // Listener para email
    _emailFocusNode.addListener(() {
      if (_emailFocusNode.hasFocus) {
        isChecking?.change(true);
        _startIdleTimerEmail();
      } else {
        isChecking?.change(false);
        _idleTimerEmail?.cancel();
      }
    });

    // Listener para password
    _passwordFocusNode.addListener(() {
      if (_passwordFocusNode.hasFocus) {
        isHandsUp?.change(true);
        _startIdleTimerPassword();
      } else {
        isHandsUp?.change(false);
        _idleTimerPassword?.cancel();
      }
    });
  }

  // Timer para email
  void _startIdleTimerEmail() {
    _idleTimerEmail?.cancel();
    _idleTimerEmail = Timer(const Duration(seconds: 3), () {
      isChecking?.change(false); // deja de mirar si no escribe
    });
  }

  // Timer para password
  void _startIdleTimerPassword() {
    _idleTimerPassword?.cancel();
    _idleTimerPassword = Timer(const Duration(seconds: 3), () {
      isHandsUp?.change(false); // baja manos si no escribe
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _idleTimerEmail?.cancel();
    _idleTimerPassword?.cancel();
    super.dispose();
  }

  void _onLogin() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Credenciales de ejemplo
    if (email == "chanerick@gmail.com" && password == "qwert54321") {
      trigSuccess?.fire(); // Animación de éxito
    } else {
      trigFail?.fire(); // Animación de fallo
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width,
                height: 200,
                child: RiveAnimation.asset(
                  'assets/animated_login_character.riv',
                  stateMachines: ['Login Machine'],
                  onInit: (artboard) {
                    controller = StateMachineController.fromArtboard(
                      artboard,
                      'Login Machine',
                    );

                    if (controller == null) return;
                    artboard.addController(controller!);

                    isChecking = controller!.findSMI<SMIBool>('isChecking');
                    isHandsUp = controller!.findSMI<SMIBool>('isHandsUp');
                    numLook = controller!.findSMI<SMINumber>('numLook');
                    trigSuccess = controller!.findSMI<SMITrigger>('trigSuccess');
                    trigFail = controller!.findSMI<SMITrigger>('trigFail');
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Email
              TextField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                onChanged: (value) {
                  if (isHandsUp != null) {
                    isHandsUp!.change(false);
                  }
                  if (isChecking != null) {
                    isChecking!.change(true);
                  }
                  if (numLook != null) {
                    numLook!.value = value.length.toDouble();
                  }
                  _startIdleTimerEmail();
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Password
              TextField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                onChanged: (value) {
                  if (isChecking != null) {
                    isChecking!.change(false);
                  }
                  if (isHandsUp != null) {
                    isHandsUp!.change(true);
                  }
                  _startIdleTimerPassword();
                },
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Botón de login
              MaterialButton(
                minWidth: size.width,
                height: 50,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onPressed: _onLogin,
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
