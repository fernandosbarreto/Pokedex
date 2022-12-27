# Pokedex
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/fernandosbarreto/Pokedex/blob/master/LICENSE) 

# About this project

This Flutter application was created to study API consumption and use of the BLoC Pattern.
This Pokedex can be used to stay up to date on pokemon types and their details.

## Preview
![Mobile 1](https://github.com/fernandosbarreto/Pokedex/blob/master/assets/pokedex_preview.gif) 

## A Flutter project made using:

- **BLoc Pattern** pattern for state management [[pub.dev]](https://pub.dev/packages/flutter_bloc) [[doc]](https://bloclibrary.dev/#/)

- **Flutter Modular** for dependency injection and routes [[pub.dev]](https://pub.dev/packages/flutter_modular) [[doc]](https://modular.flutterando.com.br/)

## About the modules
This project has been developed using module structure, to allow the separation of each module in packages, facilitating the maintenance end cohesion of each module.

 - **CoreModule**: responsible by providing a basic resources to all modules;
 - **MainMenuModule**: For the user to choose which information he wants to access;
  - **PokeListModule**: To display the list of pokemon and their details;

## To run the project:
```
flutter pub get
flutter run
```

# Autor

Fernando Danza Barreto

https://www.linkedin.com/in/fernando-barreto-75bb841a0/



## If it's your first Flutter Project

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
