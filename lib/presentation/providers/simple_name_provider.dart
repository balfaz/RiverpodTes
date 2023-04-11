import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prima_riverpod/config/config.dart';

final simpleNameProvider = Provider.autoDispose<String>((ref) {
  return RandomGenerator.getRandomName();
});
