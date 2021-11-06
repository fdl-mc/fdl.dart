import 'package:fdl_api/fdl_api.dart';

Future<void> main() async {
  final fdl = FdlApi('api.fdl-mc.ru');
  final players = await fdl.findUsers(nickname: 'a');
  players.forEach((p) => print(p.nickname));
}
