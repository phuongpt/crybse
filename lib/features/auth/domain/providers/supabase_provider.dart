import 'package:crybse/features/auth/data/datasource/secure_local_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

/// Exposes [supabase.SupabaseClient] client
final supabaseClientProvider = Provider<supabase.SupabaseClient>(
  (ref) => ref.read(supabaseProvider).asData!.value.client,
);

/// Exposes [supabase.Supabase] instance
final supabaseProvider = FutureProvider<supabase.Supabase>((ref) async {
  return supabase.Supabase.initialize(
    url: dotenv.env['supabaseUrl']!,
    anonKey: dotenv.env['supabaseAnonKey']!,
    debug: kDebugMode,
    localStorage: SecureLocalStorage(),
  );
});
