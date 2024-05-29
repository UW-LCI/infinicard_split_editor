
import 'package:flutter/material.dart';

class InfinicardStateProvider extends ChangeNotifier{
  String source = '';
  Widget widget = const Placeholder();

  void updateSource(String newSource){
    try{
      final Widget newWidget = _compileInfinicardXML(newSource);
      widget = newWidget;
      source = newSource;
      notifyListeners();
    } on Exception catch (e){
      // do something with this here
    }
  }

  Widget _compileInfinicardXML(source){
    return const Placeholder();
  }

}