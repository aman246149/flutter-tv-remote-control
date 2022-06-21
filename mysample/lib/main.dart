import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

class ColorfulButton extends StatefulWidget {
  const ColorfulButton({super.key});

  @override
  State<ColorfulButton> createState() => _ColorfulButtonState();
}

class _ColorfulButtonState extends State<ColorfulButton> {
  List<int> list = List.generate(100, (index) => index);
  String buttonName = "";
  late FocusNode _node;
  bool _focused = false;
  late FocusAttachment _nodeAttachment;
  Color _color = Colors.white;

  @override
  void initState() {
    super.initState();
    _node = FocusNode(debugLabel: 'Button');
    _node.addListener(_handleFocusChange);
    _nodeAttachment = _node.attach(context, onKey: _handleKeyPress);
  }

  void _handleFocusChange() {
    if (_node.hasFocus != _focused) {
      setState(() {
        _focused = _node.hasFocus;
      });
    }
  }

  KeyEventResult _handleKeyPress(FocusNode node, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      debugPrint(
          'Focus node ${node.debugLabel} got key event: ${event.logicalKey}');
      if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        debugPrint('Changing color to red.');
        setState(() {
          buttonName = "Arrow Right";
          _color = Colors.red;
        });
        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        debugPrint('Changing color to green.');
        setState(() {
          buttonName = "Arrow Left";
          _color = Colors.green;
        });
        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        debugPrint('Changing color to blue.');
        setState(() {
          buttonName = "Arrow Down";
          _color = Colors.blue;
        });
        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        debugPrint('Changing color to blue.');
        setState(() {
          buttonName = "Arrow Up";
          _color = Colors.purple;
        });
        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.select) {
        debugPrint('Changing color to blue.');
        setState(() {
          _color = Colors.yellow;
        });
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  @override
  void dispose() {
    _node.removeListener(_handleFocusChange);
    // The attachment will automatically be detached in dispose().
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _nodeAttachment.reparent();
    return Scaffold(
      body: Center(
        child: Container(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                if (_focused) {
                  _node.unfocus();
                } else {
                  _node.requestFocus();
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        color:
                            buttonName == "Arrow Left" ? _color : Colors.grey,
                        child: Center(
                            child: Text(
                          "1ST BOX",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        )),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color:
                            buttonName == "Arrow Right" ? _color : Colors.grey,
                        child: Center(
                            child: Text(
                          "2nd BOX",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        )),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: buttonName == "Arrow Up" ? _color : Colors.grey,
                        child: Center(
                            child: Text(
                          "3rd BOX",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        )),
                      ),
                      Container(
                        child: Center(
                            child: Text(
                          "4rt BOX",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        )),
                        height: 200,
                        width: 200,
                        color:
                            buttonName == "Arrow Down" ? _color : Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return DefaultTextStyle(
      style: textTheme.headline4!,
      child: const ColorfulButton(),
    );
  }
}
