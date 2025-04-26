import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../widgets/game_board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStatusText(gameProvider),
              const SizedBox(height: 30),
              const GameBoard(),
              const SizedBox(height: 40),
              _buildRestartButton(gameProvider),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusText(GameProvider gameProvider) {
    String statusText;
    TextStyle statusStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );

    if (gameProvider.gameOver) {
      if (gameProvider.isDraw) {
        statusText = "It's a Draw!";
      } else {
        statusText = "${gameProvider.currentPlayer} Wins!";
      }
    } else {
      statusText = "Player ${gameProvider.currentPlayer}'s Turn";
    }

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        decoration: BoxDecoration(
          color: _getStatusColor(gameProvider),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          statusText,
          style: statusStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Color _getStatusColor(GameProvider gameProvider) {
    if (gameProvider.gameOver) {
      if (gameProvider.isDraw) {
        return Colors.orange;
      } else {
        return gameProvider.currentPlayer == 'X' ? Colors.blue : Colors.red;
      }
    } else {
      return gameProvider.currentPlayer == 'X' ? Colors.blue : Colors.red;
    }
  }

  Widget _buildRestartButton(GameProvider gameProvider) {
    return ElevatedButton.icon(
      onPressed: () => gameProvider.resetGame(),
      icon: const Icon(Icons.refresh),
      label: const Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Text(
          'Restart Game',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
