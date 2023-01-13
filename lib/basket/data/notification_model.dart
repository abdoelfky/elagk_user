class NotificationModel {
  int? notifiactionId;
  String? notifiactionTitle;
  String? notifiactionDescription;
  String? action;
  String? table;
  String? data;
  User? user;
  String? userId;
  String? createdAt;

  NotificationModel(
      {this.notifiactionId,
        this.notifiactionTitle,
        this.notifiactionDescription,
        this.action,
        this.table,
        this.data,
        this.user,
        this.userId,
        this.createdAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notifiactionId = json['notifiactionId'];
    notifiactionTitle = json['notifiactionTitle'];
    notifiactionDescription = json['notifiactionDescription'];
    action = json['action'];
    table = json['table'];
    data = json['data'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    userId = json['userId'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notifiactionId'] = this.notifiactionId;
    data['notifiactionTitle'] = this.notifiactionTitle;
    data['notifiactionDescription'] = this.notifiactionDescription;
    data['action'] = this.action;
    data['table'] = this.table;
    data['data'] = this.data;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class User {
  String? id;
  String? userName;
  String? normalizedUserName;
  String? email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  String? phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  String? lockoutEnd;
  bool? lockoutEnabled;
  int? accessFailedCount;
  String? firstName;
  String? lastName;
  String? profilePicturePath;
  String? profilePicture;
  bool? isDeleted;
  List<String>? userPhones;
  List<UserActivations>? userActivations;
  int? point;

  User(
      {this.id,
        this.userName,
        this.normalizedUserName,
        this.email,
        this.normalizedEmail,
        this.emailConfirmed,
        this.passwordHash,
        this.securityStamp,
        this.concurrencyStamp,
        this.phoneNumber,
        this.phoneNumberConfirmed,
        this.twoFactorEnabled,
        this.lockoutEnd,
        this.lockoutEnabled,
        this.accessFailedCount,
        this.firstName,
        this.lastName,
        this.profilePicturePath,
        this.profilePicture,
        this.isDeleted,
        this.userPhones,
        this.userActivations,
        this.point});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    normalizedUserName = json['normalizedUserName'];
    email = json['email'];
    normalizedEmail = json['normalizedEmail'];
    emailConfirmed = json['emailConfirmed'];
    passwordHash = json['passwordHash'];
    securityStamp = json['securityStamp'];
    concurrencyStamp = json['concurrencyStamp'];
    phoneNumber = json['phoneNumber'];
    phoneNumberConfirmed = json['phoneNumberConfirmed'];
    twoFactorEnabled = json['twoFactorEnabled'];
    lockoutEnd = json['lockoutEnd'];
    lockoutEnabled = json['lockoutEnabled'];
    accessFailedCount = json['accessFailedCount'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profilePicturePath = json['profilePicturePath'];
    profilePicture = json['profilePicture'];
    isDeleted = json['isDeleted'];
    userPhones = json['userPhones'].cast<String>();
    if (json['userActivations'] != null) {
      userActivations = <UserActivations>[];
      json['userActivations'].forEach((v) {
        userActivations!.add(new UserActivations.fromJson(v));
      });
    }
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['normalizedUserName'] = this.normalizedUserName;
    data['email'] = this.email;
    data['normalizedEmail'] = this.normalizedEmail;
    data['emailConfirmed'] = this.emailConfirmed;
    data['passwordHash'] = this.passwordHash;
    data['securityStamp'] = this.securityStamp;
    data['concurrencyStamp'] = this.concurrencyStamp;
    data['phoneNumber'] = this.phoneNumber;
    data['phoneNumberConfirmed'] = this.phoneNumberConfirmed;
    data['twoFactorEnabled'] = this.twoFactorEnabled;
    data['lockoutEnd'] = this.lockoutEnd;
    data['lockoutEnabled'] = this.lockoutEnabled;
    data['accessFailedCount'] = this.accessFailedCount;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['profilePicturePath'] = this.profilePicturePath;
    data['profilePicture'] = this.profilePicture;
    data['isDeleted'] = this.isDeleted;
    data['userPhones'] = this.userPhones;
    if (this.userActivations != null) {
      data['userActivations'] =
          this.userActivations!.map((v) => v.toJson()).toList();
    }
    data['point'] = this.point;
    return data;
  }
}

class UserActivations {
  String? userId;
  int? activationCode;
  String? expireOn;
  String? createdAt;
  bool? isActivated;

  UserActivations(
      {this.userId,
        this.activationCode,
        this.expireOn,
        this.createdAt,
        this.isActivated});

  UserActivations.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    activationCode = json['activationCode'];
    expireOn = json['expireOn'];
    createdAt = json['createdAt'];
    isActivated = json['isActivated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['activationCode'] = this.activationCode;
    data['expireOn'] = this.expireOn;
    data['createdAt'] = this.createdAt;
    data['isActivated'] = this.isActivated;
    return data;
  }
}
