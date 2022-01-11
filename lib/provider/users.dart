import 'dart:math';

import 'package:aluguediretocomdono/data/dummy_users.dart';
import 'package:aluguediretocomdono/models/user.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier{
  final Map<String, User> _items = {...DUMMY_USERS};

  void put(User user){
    if(user == null){
      return;
    }
    if(user.id != null && user.id.trim().isEmpty && _items.containsKey(user.id)){
      _items.update(user.id,(_) => User(
        id: user.id,
        nome: user.nome,
        email: user.email,
        senha: user.senha,
      ));
    }else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent('1000', () => User(
        id: id,
        nome: user.nome,
        email: user.email,
        senha: user.senha,
      ),
      );
    }

    notifyListeners();
  }
}