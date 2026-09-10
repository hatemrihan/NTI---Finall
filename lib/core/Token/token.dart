import 'package:flutter_secure_storage/flutter_secure_storage.dart';

String token = '';

const storage = FlutterSecureStorage();

Future<void> saveToken(String value) async {
  token = value;

  await storage.write(
    key: 'token',
    value: value,
  );
}

Future<void> loadToken() async {
  token = await storage.read(key: 'token') ?? '';
}