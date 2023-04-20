import 'package:crybse/features/crypto/data/repositories/crypto_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final cryptoRepository = Provider<CryptoRepository>((ref) => CryptoRepository());

final storageProvider = Provider<FlutterSecureStorage>((ref) => const FlutterSecureStorage());
