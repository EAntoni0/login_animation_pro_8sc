# 🐻 Animated Login Screen with Flutter & Rive

This project is an **interactive login screen** built with **Flutter**, featuring an animated character using **Rive**.  
The character reacts to user actions in real-time:  

- 👀 Follows the cursor when typing the email  
- 🙈 Covers its eyes when typing the password  
- 😄 Smiles when the login is correct  
- 😢 Shows a sad animation when the login fails  

---

## 🔹 About Rive & State Machines

[Rive](https://rive.app/) is a powerful tool to create interactive animations that can be embedded in apps.  
A **State Machine** in Rive allows you to control animations dynamically using inputs like:  

- **SMIBool** – boolean states (e.g., isChecking, isHandsUp)  
- **SMINumber** – numerical inputs (e.g., numLook to follow the cursor)  
- **SMITrigger** – triggers to fire one-time animations (e.g., trigSuccess, trigFail)  

---

## 🛠️ Technologies

- [Flutter](https://flutter.dev/) – Cross-platform UI framework  
- [Rive](https://rive.app/) – Interactive animations  
- Dart – Programming language  

---

## 📂 Project Structure

```text
lib/
├── main.dart                 # Entry point of the app
└── login_screen.dart         # Login screen with Rive animation logic

assets/
└── animated_login_character.riv   # Rive animation file
```


## 🎬 Demo

### 👀 Follows the cursor when typing the email




  
