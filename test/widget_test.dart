import 'dart:convert';

import 'package:bavera/app/data/entities/match_entities.dart';
import 'package:bavera/app/data/entities/user.dart';
import 'package:bavera/app/data/repositories/bavera_repository.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CLIENT LIST ALL', () async {
    final baveraRepository = BaveraRepository();
    List<MatchEntity> resultUser = await baveraRepository.matchListAll();
    print(jsonEncode(resultUser!.first.toJson()));
  });
}
