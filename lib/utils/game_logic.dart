/// Game logic utility functions for the Tic-Tac-Toe game
class GameLogic {
  /// Winning combinations (rows, columns, diagonals)
  static const List<List<int>> _winPatterns = [
    // Rows
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    // Columns
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    // Diagonals
    [0, 4, 8],
    [2, 4, 6],
  ];

  /// Check if a player has won the game
  /// Returns the winning combination (list of indexes) if there is a win,
  /// or null if there is no winner yet
  static List<int>? checkForWin(List<String?> board, String player) {
    // Check each possible winning pattern
    for (final pattern in _winPatterns) {
      // If all cells in the pattern match the player's symbol, it's a win
      if (board[pattern[0]] == player &&
          board[pattern[1]] == player &&
          board[pattern[2]] == player) {
        return pattern; // Return the winning pattern
      }
    }

    // No win found
    return null;
  }

  /// Check if the board is full (no empty cells)
  static bool isBoardFull(List<String?> board) {
    return !board.contains(null);
  }
}
