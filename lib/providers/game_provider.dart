import 'package:flutter/material.dart';
import '../utils/game_logic.dart';

class GameProvider extends ChangeNotifier {
  // Game board represented as a list of strings
  // null = empty, 'X' or 'O' = player moves
  List<String?> _board = List.filled(9, null);

  // Current player: 'X' starts the game
  String _currentPlayer = 'X';

  // Game status
  bool _gameOver = false;
  bool _isDraw = false;

  // Winning combination (indexes of the winning cells)
  List<int>? _winningCombination;

  // Getters
  List<String?> get board => _board;
  String get currentPlayer => _currentPlayer;
  bool get gameOver => _gameOver;
  bool get isDraw => _isDraw;
  List<int>? get winningCombination => _winningCombination;

  // Make a move on the board
  void makeMove(int index) {
    // Ignore if the game is over or the cell is already filled
    if (_gameOver || _board[index] != null) {
      return;
    }

    // Update the board with the current player's move
    _board[index] = _currentPlayer;

    // Check for a win
    _winningCombination = GameLogic.checkForWin(_board, _currentPlayer);
    if (_winningCombination != null) {
      _gameOver = true;
      notifyListeners();
      return;
    }

    // Check for a draw
    if (GameLogic.isBoardFull(_board)) {
      _gameOver = true;
      _isDraw = true;
      notifyListeners();
      return;
    }

    // Switch to the next player
    _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';

    // Notify listeners of state change
    notifyListeners();
  }

  // Reset the game
  void resetGame() {
    _board = List.filled(9, null);
    _currentPlayer = 'X';
    _gameOver = false;
    _isDraw = false;
    _winningCombination = null;
    notifyListeners();
  }
}
