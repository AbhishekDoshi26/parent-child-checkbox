import 'package:flutter/material.dart';

class ParentChildCheckbox extends StatefulWidget {
  final Text? parent;
  final List<Text>? children;
  final Color? parentColor;
  final Color? childrenColor;

  ParentChildCheckbox({
    Key? key,
    this.parent,
    this.children,
    this.parentColor,
    this.childrenColor,
  }) : super(key: key);
  static Map<String?, bool?> isParentSelected = {};
  static Map<String?, List<String?>> selectedChildrenMap = {};
  @override
  _ParentChildCheckboxState createState() => _ParentChildCheckboxState();
}

class _ParentChildCheckboxState extends State<ParentChildCheckbox> {
  bool? _parentValue = false;
  List<bool?> _childrenValue = [];

  @override
  void initState() {
    super.initState();
    _childrenValue = List.filled(widget.children!.length, false);
    ParentChildCheckbox.selectedChildrenMap.addAll({widget.parent!.data: []});
    ParentChildCheckbox.isParentSelected.addAll({widget.parent!.data: false});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: _parentValue,
              splashRadius: 0.0,
              activeColor: widget.parentColor,
              onChanged: (value) => _parentCheckBoxClick(),
              tristate: true,
            ),
            SizedBox(
              width: 10.0,
            ),
            widget.parent!,
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        for (int i = 0; i < widget.children!.length; i++)
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Row(
              children: [
                Checkbox(
                  splashRadius: 0.0,
                  activeColor: widget.childrenColor,
                  value: _childrenValue[i],
                  onChanged: (value) => _childCheckBoxClick(i),
                ),
                SizedBox(
                  width: 10.0,
                ),
                widget.children![i],
              ],
            ),
          ),
      ],
    );
  }

  void _childCheckBoxClick(int i) {
    setState(() {
      _childrenValue[i] = !_childrenValue[i]!;
      if (!_childrenValue[i]!) {
        ParentChildCheckbox.selectedChildrenMap.update(widget.parent!.data, (value) {
          value.removeWhere((element) => element == widget.children![i].data);
          return value;
        });
      } else {
        ParentChildCheckbox.selectedChildrenMap.update(widget.parent!.data, (value) {
          value.add(widget.children![i].data);
          return value;
        });
      }

      _parentCheckboxUpdate();
    });
  }

  void _parentCheckBoxClick() {
    setState(() {
      if (_parentValue != null) {
        _parentValue = !_parentValue!;
        ParentChildCheckbox.isParentSelected.update(widget.parent!.data, (value) => _parentValue);
        ParentChildCheckbox.selectedChildrenMap.addAll({
          widget.parent!.data: [],
        });
        for (int i = 0; i < widget.children!.length; i++) {
          _childrenValue[i] = _parentValue;
          if (_parentValue!) {
            ParentChildCheckbox.selectedChildrenMap.update(widget.parent!.data, (value) {
              value.add(widget.children![i].data);
              return value;
            });
          }
        }
      } else {
        _parentValue = false;
        ParentChildCheckbox.isParentSelected.update(widget.parent!.data, (value) => _parentValue);
        ParentChildCheckbox.selectedChildrenMap.update(widget.parent!.data, (value) => []);
        for (int i = 0; i < widget.children!.length; i++) _childrenValue[i] = false;
      }
    });
  }

  void _parentCheckboxUpdate() {
    setState(() {
      if (_childrenValue.contains(false) && _childrenValue.contains(true)) {
        _parentValue = null;
        ParentChildCheckbox.isParentSelected.update(widget.parent!.data, (value) => false);
      } else {
        _parentValue = _childrenValue.first;
        ParentChildCheckbox.isParentSelected.update(widget.parent!.data, (value) => _childrenValue.first);
      }
    });
  }
}
