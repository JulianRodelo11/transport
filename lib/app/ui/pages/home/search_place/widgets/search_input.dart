import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController controllerorigin;
  final TextEditingController controllerdestination;
  final FocusNode focusNodeorigin;
  final FocusNode focusNodedestination;
  final String placeholderorigin;
  final void Function(String) onChangedorigin;
  final String placeholderdestination;
  final void Function(String) onChangeddestination;
  final VoidCallback onClearOrigin;
  final VoidCallback onClearDestination;
  const SearchInput({
    Key? key,
    required this.placeholderorigin,
    required this.onChangedorigin,
    required this.placeholderdestination,
    required this.onChangeddestination,
    required this.focusNodeorigin,
    required this.focusNodedestination,
    required this.controllerorigin,
    required this.controllerdestination,
    required this.onClearOrigin,
    required this.onClearDestination,
  }) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late ValueNotifier<String> _textorigin;
  late ValueNotifier<String> _textdestination;

  @override
  void initState() {
    super.initState();
    _textorigin = ValueNotifier(widget.controllerorigin.text);
    _textdestination = ValueNotifier(widget.controllerdestination.text);
    widget.controllerorigin.addListener(() {
      final textFromControllerOrigin = widget.controllerorigin.text;
      if (textFromControllerOrigin.isEmpty && _textorigin.value.isNotEmpty) {
        _textorigin.value = '';
      } else if (textFromControllerOrigin.isNotEmpty) {
        _textorigin.value = textFromControllerOrigin;
      }
    });
    widget.controllerdestination.addListener(() {
      final textFromControllerDestination = widget.controllerdestination.text;
      if (textFromControllerDestination.isEmpty &&
          _textdestination.value.isNotEmpty) {
        _textdestination.value = '';
      } else if (textFromControllerDestination.isNotEmpty) {
        _textdestination.value = textFromControllerDestination;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 140,
          color: Colors.white,
        ),
        Positioned.fill(
          top: 0,
          bottom: 100,
          left: 70,
          right: 20,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFe6ebf1),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: 50,
          bottom: 50,
          left: 70,
          right: 20,
          child: CupertinoTextField(
            padding: const EdgeInsets.only(left: 20.0, right: 10.0),
            controller: widget.controllerorigin,
            focusNode: widget.focusNodeorigin,
            onChanged: (text) {
              _textorigin.value = text;
              widget.onChangedorigin(text);
            },
            placeholder: widget.placeholderorigin,
            decoration: const BoxDecoration(
              color: Color(0xFFe6ebf1),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            suffix: ValueListenableBuilder<String>(
              valueListenable: _textorigin,
              builder: (_, text, child) {
                if (text.isNotEmpty) {
                  return child!;
                }
                return const SizedBox();
              },
              child: CupertinoButton(
                padding: const EdgeInsets.all(10),
                //color: Colors.black38,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.clear,
                  color: Colors.black,
                  size: 19,
                ),
                onPressed: () {
                  widget.controllerorigin.text = '';
                  _textorigin.value = '';
                  widget.onClearOrigin();
                },
              ),
            ),
            style: const TextStyle(fontSize: 15),
            cursorColor: Colors.black87,
          ),
        ),
        Positioned.fill(
          top: 100,
          bottom: 0,
          left: 70,
          right: 20,
          child: CupertinoTextField(
            padding: const EdgeInsets.only(left: 20.0, right: 10.0),
            controller: widget.controllerdestination,
            focusNode: widget.focusNodedestination,
            onChanged: (text) {
              _textdestination.value = text;
              widget.onChangeddestination(text);
            },
            placeholder: widget.placeholderdestination,
            decoration: const BoxDecoration(
              color: Color(0xFFe6ebf1),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            suffix: ValueListenableBuilder<String>(
              valueListenable: _textdestination,
              builder: (_, text, child) {
                if (text.isNotEmpty) {
                  return child!;
                }
                return const SizedBox();
              },
              child: CupertinoButton(
                padding: const EdgeInsets.all(10),
                //color: Colors.black38,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.clear,
                  color: Colors.black,
                  size: 19,
                ),
                onPressed: () {
                  widget.controllerdestination.text = '';
                  _textdestination.value = '';
                  widget.onClearDestination();
                },
              ),
            ),
            style: const TextStyle(fontSize: 15),
            cursorColor: Colors.black87,
          ),
        ),
        const Positioned.fill(
          top: 65,
          bottom: 15,
          left: 20,
          right: 340,
          child: SizedBox(
            child: RiveAnimation.asset(
              'assets/animation_search.riv',
              antialiasing: true,
            ),
          ),
        ),
      ],
    );
  }
}
