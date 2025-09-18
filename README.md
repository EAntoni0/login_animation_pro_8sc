# Pantalla de inicio de sesión animada con Flutter y Rive


Este proyecto se trata de una **pantalla de inicio de sesión interactiva** en Flutter, con un personaje animado en **Rive** que va reaccionando de diferente manera a cada una de las acciones:


- sigue el cursor cuando escribes el email
- se tapa los ojos cuando escribes la contraseña
- sonrie cuando escribes los datos de session correctos
- se pone triste cuando escribes los datos incorrectos


## algunas caracteristicas destacables

- Integración de **Flutter** con **Rive** para animaciones.  
- **FocusNode + Timer** para controlar estados de inactividad:  
  - Si dejas de escribir en email → el oso deja de mirar.  
  - Si dejas de escribir en password → el oso baja las manos.  
- Datos de la session para probar:

  Email: ac817924@gmail.com

  Password: qwert54321


## Estructura basica del proyecto

lib/
├── main.dart
└── login_screen.dart # Pantalla de login con lógica de animación
assets/
└── animated_login_character.riv # Archivo Rive

### Escribir Email


  
