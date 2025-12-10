import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  final Widget child;
  final bool? isSelected;
  final ValueChanged<bool?>? onChanged;

  const CheckBoxWidget(
      {super.key, required this.child, this.isSelected, this.onChanged});

  @override
  CheckBoxState createState() => CheckBoxState();
}

class CheckBoxState extends State<CheckBoxWidget> {
  bool? isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  void didUpdateWidget(covariant CheckBoxWidget oldWidget) {
    if (widget.isSelected != isSelected) isSelected = widget.isSelected;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text('اختار الكل : '),
            Checkbox(
                value: isSelected,
                tristate: true,
                onChanged: (bool? v) {
                  v ??= false;
                  setState(() {
                    isSelected = v;
                    if (widget.onChanged != null) widget.onChanged!(v);
                  });
                }),
          ],
        ),
        Expanded(child: widget.child),
      ],
    );
  }
}
