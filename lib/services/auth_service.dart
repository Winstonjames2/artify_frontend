import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  // Create storage
  final _secureStorage = const FlutterSecureStorage();

  // Create Android options with encryptedSharedPreferences enabled
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  // Save token securely
  Future<void> saveToken(String token) async {
    await _secureStorage.write(
      key: 'authToken',
      value: token,
      aOptions: _getAndroidOptions(), // Pass the Android options here
    );
  }

  // Retrieve token
  Future<String?> getToken() async {
    return await _secureStorage.read(
      key: 'authToken',
      aOptions: _getAndroidOptions(), // Pass the Android options here
    );
  }

  // Delete token
  Future<void> deleteToken() async {
    await _secureStorage.delete(
      key: 'authToken',
      aOptions: _getAndroidOptions(),
    );
  }
}
