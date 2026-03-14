library onestop_events;

// Export the setup function so the main app can call it
export 'src/core/di/injection_container.dart' show initEventsPackage;

// Export the main UI wrapper that the parent app's router will point to
// export 'src/presentation/widgets/events_package_scaffold.dart';