import '/models/models.dart';

enum GameModes { medium, large }

extension GameModeExt on GameModes {
  GameMode get description {
    switch (this) {
      case GameModes.medium:
        return const GameMode(name: "Hàng 4 số", rowSize: 6);
      case GameModes.large:
        return const GameMode(name: "Hàng 5 số", rowSize: 8);
    }
  }
}
