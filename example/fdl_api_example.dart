import 'package:fdl_api/fdl_api.dart';

Future<void> main() async {
  final fdl = FdlApi('fdl-api.domain');

  final stats = await fdl.getMainServerStats();
  print(stats.desciption);

  final payment = await fdl.pay(
    PaymentBuilder()
      ..payer = 'arslee'
      ..payee = 'Calamity_34'
      ..amount = 5,
  );
  print(payment.message);
}
