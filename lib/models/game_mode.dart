class GameMode {
  final String name;
  final int rowSize;
  final int columnSize;
  const GameMode({
    required this.name,
    required this.rowSize,
    this.columnSize = 5,
  });
}
