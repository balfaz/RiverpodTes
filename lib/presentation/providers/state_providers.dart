import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/helpers/random_generator.dart';

final CounterProvider = StateProvider<int>((ref) {
  return 0;
});
final isDarkModeProvider = StateProvider<bool>((ref) {
  return false;
});
final randomNameProvider = StateProvider<String>((ref) {
  return RandomGenerator.getRandomName();
});
