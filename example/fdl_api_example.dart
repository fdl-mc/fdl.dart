import 'package:fdl_api/fdl_api.dart';

Future<void> main() async {
  final fdl = FdlApi('fdl-api.domain');

  final stats = await fdl.getMainServerStats();
  print(stats.description);

  final payment = await fdl.pay(
    'tokentokentokenblahblahblahblahblah',
    paymentBuilder: PaymentBuilder()
      ..payee = 'Calamity_34'
      ..amount = 5
      ..payee = 'сходи купи бебры пж',
  );
  print(payment.message);
}
