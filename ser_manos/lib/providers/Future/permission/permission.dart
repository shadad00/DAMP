
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:permission_handler/permission_handler.dart';


part 'generated/permission.g.dart';

@riverpod
Future<PermissionStatus> eventTrackerPermission(
  EventTrackerPermissionRef ref,
) async =>
    await Permission.appTrackingTransparency.status;

    