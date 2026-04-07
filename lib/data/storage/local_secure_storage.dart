import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskify_app/data/storage/local_storage.dart';

class LocalSecureStorage implements LocalStorage {
  final secureStorageInstance = const FlutterSecureStorage();

  @override
  Future<bool> create<T>({required String key, required T data}) async {
    try {
      await secureStorageInstance.write(key: key, value: data.toString());
      
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> delete({required String key}) async {
    try {
      await secureStorageInstance.delete(key: key);
      
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<T?> getData<T>({required String key}) async {
    final result = await secureStorageInstance.read(key: key);
    
    return result as T?;
  }
}
