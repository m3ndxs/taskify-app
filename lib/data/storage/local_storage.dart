abstract class LocalStorage {
  Future<bool> create<T>({required String key, required T data});
  Future<T?> getData<T>({required String key});
  Future<bool> delete({required String key});
}