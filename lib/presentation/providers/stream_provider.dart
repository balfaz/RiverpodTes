import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prima_riverpod/config/config.dart';

final UsersInChatProvider = StreamProvider<List<String>>((ref) async* {
  final names = <String>[];
  yield [];

  await for (final name in RandomGenerator.randomNameStream()) {
    names.add(name);
    yield names;
  }
});
