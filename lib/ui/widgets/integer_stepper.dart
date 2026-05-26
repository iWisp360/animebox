import 'package:flutter/material.dart';

class IntegerStepper extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final Function(int value) onChanged;
  const IntegerStepper({
    super.key,
    required this.initialValue,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
  });

  @override
  State<IntegerStepper> createState() => _IntegerStepperState();
}

class _IntegerStepperState extends State<IntegerStepper> {
  late int value;

  @override
  void initState() {
    super.initState();

    value = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant IntegerStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      setState(() {
        value = widget.initialValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: value <= widget.minValue
              ? null
              : () => setState(() {
                  value--;
                  widget.onChanged(value);
                }),
          icon: const Icon(Icons.remove),
        ),
        Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
          child: SizedBox(
            width: 20,
            child: Text(
              "$value",
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        IconButton(
          onPressed: value >= widget.maxValue
              ? null
              : () => setState(() {
                  value++;
                  widget.onChanged(value);
                }),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
