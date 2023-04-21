import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final storageProvider = Provider<FlutterSecureStorage>((ref) => const FlutterSecureStorage());
