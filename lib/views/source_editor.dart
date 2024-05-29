import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_editor/providers/infinicard_state_provider.dart';

class SourceEditor extends StatefulWidget {
  const SourceEditor({super.key});

  @override
  State<SourceEditor> createState() => _SourceEditorState();
}

class _SourceEditorState extends State<SourceEditor> {
  String currentSourceString = '';

  @override
  void initState(){
    super.initState();
    currentSourceString = _getInfinicardStateProvider(context).source;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
          initialValue: currentSourceString,
          keyboardType: TextInputType.multiline,
          minLines: 1, //Normal textInputField will be displayed
          maxLines: null,
          onChanged: (s) => _compileSource(context, s),
      ),
    );
  }

  void _compileSource(BuildContext context, String newSource){
    final provider = _getInfinicardStateProvider(context);
    provider.updateSource(newSource);
  }

  InfinicardStateProvider _getInfinicardStateProvider(context){
    return Provider.of<InfinicardStateProvider>(context, listen: false);
  }
}