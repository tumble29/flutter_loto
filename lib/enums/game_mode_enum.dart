import '/gen/gen.dart';
import '/models/models.dart';

enum GameModeEnum { medium, large }

extension GameModeExt on GameModeEnum {
  GameMode get description {
    switch (this) {
      case GameModeEnum.medium:
        return GameMode(name: t.game.medium.description, rowSize: 6);
      case GameModeEnum.large:
        return GameMode(name: t.game.large.description, rowSize: 8);
    }
  }
}
