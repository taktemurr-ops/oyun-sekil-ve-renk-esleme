import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_sekil_ve_renk_esleme/oyun_sekil_ve_renk_esleme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(sekilRenkConfig.title.length, 33);
    expect(sekilRenkConfig.tagline.length, 33);
    for (final s in sekilRenkConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(sekilRenkConfig.gameId, sekilRenkId);
    expect(sekilRenkRules.gameId, sekilRenkId);
    expect(sekilRenkConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(sekilRenkRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: sekilRenkId, optionalMechanics: sekilRenkRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(sekilRenkRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
