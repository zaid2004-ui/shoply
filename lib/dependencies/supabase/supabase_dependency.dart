import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDependency {
  static Future<void> supabaseInitDependency() async {
    await Supabase.initialize(
      url: 'https://wmhrzbvgbdasmbmmzltk.supabase.co',
      publishableKey: 'sb_publishable_v1ybkpco9VFQfjtZoVpiEw_WSxU6gBf',
    );
  }
}
