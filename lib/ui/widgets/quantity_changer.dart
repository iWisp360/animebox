import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuantityChanger extends StatefulWidget {
  final int initialQuantity;
  final int maxQuantity;
  final int minQuantity;
  final Function(int quantity)? onQuantityChanged;

  const QuantityChanger({
    super.key,
    required this.initialQuantity,
    this.maxQuantity = 9999,
    this.minQuantity = 0,
    this.onQuantityChanged,
  }) : assert(minQuantity >= 0, "minQuantity as negative is not allowed");

  @override
  State<QuantityChanger> createState() => _QuantityChangerState();
}

class _QuantityChangerState extends State<QuantityChanger> {
  Timer? _timer;
  Timer? _debounceTimer;
  late final TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController(text: "${widget.initialQuantity}");
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  final double _radius = 25;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Row(
        mainAxisSize: .min,
        children: [
          _button(
            icon: Icon(
              Icons.remove,
              color: _isMin()
                  ? Theme.of(context).disabledColor
                  : Theme.of(context).colorScheme.primary,
            ),
            onTapDown: !_isMin() ? (_) => _startSpamming(_decrease) : null,
            onTapUp: !_isMin() ? (_) => _stopSpamming() : null,
            onTap: !_isMin() ? _decrease : null,
          ),
          Expanded(
            child: TextFormField(
              controller: _textController,
              textAlign: .center,
              decoration: const InputDecoration(border: .none),
              keyboardType: .number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  final parsed = int.parse(value);
                  final clamped = parsed.clamp(
                    widget.minQuantity,
                    widget.maxQuantity,
                  );

                  if (widget.minQuantity < parsed ||
                      parsed > widget.maxQuantity) {
                    setState(() {
                      _textController.text = "$clamped";
                    });
                  }

                  _execOnQuantityChange(clamped);
                } else {
                  setState(() {
                    _textController.text = "${widget.minQuantity}";
                  });
                  _execOnQuantityChange(widget.minQuantity);
                }
              },
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          _button(
            icon: Icon(
              Icons.add,
              color: _isMax()
                  ? Theme.of(context).disabledColor
                  : Theme.of(context).colorScheme.primary,
            ),
            onTapDown: (_) => !_isMax() ? _startSpamming(_increase) : null,
            onTapUp: (_) => !_isMax() ? _stopSpamming() : null,
            onTap: !_isMax() ? _increase : null,
          ),
        ],
      ),
    );
  }

  Widget _button({
    required Widget icon,
    required Function(dynamic)? onTapDown,
    required Function(dynamic)? onTapUp,
    required Function()? onTap,
  }) => ClipRRect(
    borderRadius: .circular(_radius),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTap: onTap,
        child: Padding(padding: const .all(8), child: icon),
      ),
    ),
  );

  void _stopSpamming() => _timer?.cancel();
  void _startSpamming(Function() callback) =>
      _timer = Timer(const Duration(milliseconds: 250), () {
        _timer?.cancel();
        _timer = Timer.periodic(
          const Duration(milliseconds: 50),
          (_) => callback(),
        );
      });

  bool _isMin() => (int.parse(_textController.text) <= widget.minQuantity);
  bool _isMax() => (int.parse(_textController.text) >= widget.maxQuantity);

  void _decrease() {
    int newValue = (int.parse(_textController.text)) - 1;
    if (newValue >= widget.minQuantity) {
      setState(() {
        _textController.text = "$newValue";
      });
      _execOnQuantityChange(newValue);
    }

    if (_isMin()) {
      _timer?.cancel();
    }
  }

  void _increase() {
    int newValue = (int.parse(_textController.text)) + 1;
    if (newValue <= widget.maxQuantity) {
      setState(() {
        _textController.text = "$newValue";
      });
      _execOnQuantityChange(newValue);
    }

    if (_isMax()) {
      _timer?.cancel();
    }
  }

  void _execOnQuantityChange(int value) {
    if (widget.onQuantityChanged != null) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(
        const Duration(milliseconds: 200),
        () => widget.onQuantityChanged!(value),
      );
    }
  }
}
