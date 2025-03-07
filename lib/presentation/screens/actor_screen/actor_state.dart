import 'package:injectable/injectable.dart';

@singleton
class ActorState {
  bool loading = false;
  String? message;
}
