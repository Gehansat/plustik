class UserNotification {
  bool beforeTwoHours;
  bool beforeOneHour;
  bool beforeThirtyMinutes;

  UserNotification({
    required this.beforeTwoHours,
    required this.beforeOneHour,
    required this.beforeThirtyMinutes,
  });

  Map<String, dynamic> toMap() {
    return {
      'beforeTwoHours': beforeTwoHours,
      'beforeOneHour': beforeOneHour,
      'beforeThirtyMinutes': beforeThirtyMinutes,
    };
  }

  factory UserNotification.fromMap(Map<String, dynamic> data) {
    return UserNotification(
      beforeTwoHours: data['beforeTwoHours'],
      beforeOneHour: data['beforeOneHour'],
      beforeThirtyMinutes: data['beforeThirtyMinutes'],
    );
  }
}