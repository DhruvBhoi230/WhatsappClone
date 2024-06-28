import 'package:flutter/foundation.dart';

enum CallType {
  incoming,
  outgoing,
  missed,
}

class Call {
  final String callerName;
  final String id;
  final String callerId;
  final String receiverId;
  final DateTime callTime;
  final Duration callDuration;
  final CallType callType;
  final bool isVideoCall;

  Call({
    required this .callerName,
    required this.id,
    required this.callerId,
    required this.receiverId,
    required this.callTime,
    required this.callDuration,
    required this.callType,
    required this.isVideoCall,
  });
}
