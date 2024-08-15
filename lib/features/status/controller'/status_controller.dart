import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/status/repository/status_repository.dart';

class StatusController {
  final StatusRepository statusRepository;
  final ProviderRef ref;
  StatusController({
    required this.statusRepository,
    required this.ref,
  });
}
