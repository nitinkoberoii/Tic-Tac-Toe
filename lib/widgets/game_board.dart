import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import 'game_tile.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    final size = MediaQuery.of(context).size;

    // Calculate board size based on screen width
    // The board should take up 90% of the screen width on small screens
    // and be capped at a reasonable size on larger screens
    final boardSize = size.width > 600 ? 400.0 : size.width * 0.9;

    return Container(
      width: boardSize,
      height: boardSize,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            final isWinningTile =
                gameProvider.winningCombination?.contains(index) ?? false;

            return GameTile(
              index: index,
              value: gameProvider.board[index],
              isWinning: isWinningTile,
              onTap: () => gameProvider.makeMove(index),
            );
          },
        ),
      ),
    );
  }
}
