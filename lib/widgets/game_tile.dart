import 'package:flutter/material.dart';

class GameTile extends StatefulWidget {
  final int index;
  final String? value;
  final bool isWinning;
  final VoidCallback onTap;

  const GameTile({
    Key? key,
    required this.index,
    required this.value,
    required this.isWinning,
    required this.onTap,
  }) : super(key: key);

  @override
  State<GameTile> createState() => _GameTileState();
}

class _GameTileState extends State<GameTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
  }

  @override
  void didUpdateWidget(GameTile oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Trigger animation when the value changes
    if (oldWidget.value != widget.value && widget.value != null) {
      _animationController.reset();
      _animationController.forward();
    }

    // Reset animation if the board has been reset
    if (oldWidget.value != null && widget.value == null) {
      _animationController.reset();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color tileColor =
        widget.isWinning ? Colors.yellow.withOpacity(0.3) : Colors.white;

    return GestureDetector(
      onTap: widget.value == null ? widget.onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child:
            widget.value != null
                ? ScaleTransition(
                  scale: _scaleAnimation,
                  child: Center(child: _buildSymbol(widget.value!)),
                )
                : null,
      ),
    );
  }

  Widget _buildSymbol(String symbol) {
    final Color symbolColor = symbol == 'X' ? Colors.blue : Colors.red;

    // Different symbols for X and O with custom styles
    if (symbol == 'X') {
      return Icon(Icons.close, size: 60, color: symbolColor);
    } else {
      return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: symbolColor, width: 8),
        ),
      );
    }
  }
}
