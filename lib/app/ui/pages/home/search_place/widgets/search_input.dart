import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String placeholder;
  final void Function(String) onChanged;
  final VoidCallback onClear;
  const SearchInput({
    Key? key,
    required this.placeholder,
    required this.onChanged,
    required this.focusNode,
    required this.controller,
    required this.onClear,
  }) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late ValueNotifier<String> _text;

  @override
  void initState() {
    super.initState();
    _text = ValueNotifier(widget.controller.text);
    widget.controller.addListener(() {
      final textFromController = widget.controller.text;
      if (textFromController.isEmpty && _text.value.isNotEmpty) {
        _text.value = '';
      } else if (textFromController.isNotEmpty) {
        _text.value = textFromController;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        right: 20.0,
      ),
      child: Container(
        height: 45,
        width: double.infinity,
        color: Colors.white,
        child: CupertinoTextField(
          padding: const EdgeInsets.only(left: 20.0, right: 10.0),
          controller: widget.controller,
          focusNode: widget.focusNode,
          onChanged: (text) {
            _text.value = text;
            widget.onChanged(text);
          },
          suffix: ValueListenableBuilder<String>(
            valueListenable: _text,
            builder: (_, text, child) {
              if (text.isNotEmpty) {
                return child!;
              }
              return const SizedBox();
            },
            child: CupertinoButton(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Icon(
                Icons.clear,
                color: Colors.black,
                size: 19,
              ),
              onPressed: () {
                widget.controller.text = '';
                _text.value = '';
                widget.onClear();
              },
            ),
          ),
          placeholder: widget.placeholder,
          decoration: const BoxDecoration(
            color: Color(0xFFeeeeee),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          style: const TextStyle(fontSize: 15),
          cursorColor: Colors.black87,
        ),
      ),
    );
  }
}
