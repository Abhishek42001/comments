import 'dart:developer';

import 'package:comments/constants/remote_config.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigService {
  FirebaseRemoteConfigService._()
      : _remoteConfig = FirebaseRemoteConfig.instance;

  static FirebaseRemoteConfigService? _instance;
  factory FirebaseRemoteConfigService() =>
      _instance ??= FirebaseRemoteConfigService._();

  final FirebaseRemoteConfig _remoteConfig;

  bool get shouldMaskEmail =>
      _remoteConfig.getBool(RemoteConfig.shouldMaskEmail.name);

  Future<void> _setConfigSettings() async => _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          ///It should be hourly basis
          minimumFetchInterval: const Duration(minutes: 1),
        ),
      );

  Future<void> fetchAndActivate() async {
    bool updated = await _remoteConfig.fetchAndActivate();
    if (updated) {
      log('The config has been updated.');
    } else {
      log('The config is not updated..');
    }
  }

  Future<void> initialize() async {
    await _setConfigSettings();
    await fetchAndActivate();
  }
}
