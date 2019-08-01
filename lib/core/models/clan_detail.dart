import '../mixins/date_helper.dart';

/// Clan detail model
class ClanDetail with DateHelper {
  /// Clan id
  int clanId;

  /// Clan creation date
  DateTime createdAt;

  /// Clan creator id
  int creatorId;

  /// Clan creator's name
  String creatorName;

  /// Clan description
  String description;

  /// Clan has been deleted.
  /// The deleted clan data contains valid values
  /// for the following fields only:
  /// clanId, isClanDisbanded, updatedAt.
  bool isClanDisbanded;

  /// Commander id
  int leaderId;

  /// Commander's name
  String leaderName;

  /// Number of clan members
  int membersCount;

  /// Clan name
  String name;

  /// Old clan name
  String oldName;

  /// Old clan tag
  String oldTag;

  /// Time (UTC) when clan name was changed
  DateTime renamedAt;

  /// Clan tag
  String tag;

  /// Time when clan details were updated
  DateTime updatedAt;

  /// Clan members
  List<Member> members;

  /// Serializing JSON inside clan detail model
  ClanDetail.fromJSON(Map<String, dynamic> json) {
    clanId = json['clan_id'];
    updatedAt = dateTimeFromSeconds(json['updated_at']);
    isClanDisbanded = json['is_clan_disbanded'];

    if (isClanDisbanded) return;

    createdAt = dateTimeFromSeconds(json['created_at']);
    creatorId = json['creator_id'];
    creatorName = json['creator_name'];
    description = json['description'];
    leaderId = json['leader_id'];
    leaderName = json['leader_name'];
    membersCount = json['members_count'];
    name = json['name'];
    oldName = json['old_name'];
    oldTag = json['old_tag'];
    renamedAt = dateTimeFromSeconds(json['renamed_at']);
    tag = json['tag'];

    final members = <Member>[];
    final List<dynamic> parsedList = json['members'];
    for (final member in parsedList) {
      members.add(Member.fromJSON(member));
    }
    this.members = members;
  }
}

/// Member model
class Member with DateHelper {
  /// User id
  int accountId;

  /// Player name
  String accountName;

  /// Date when player joined clan
  DateTime joinedAt;

  /// Technical position name
  String role;

  ///  Serializing JSON inside member model
  Member.fromJSON(Map<String, dynamic> json) {
    accountId = json['account_id'];
    accountName = json['account_name'];
    joinedAt = dateTimeFromSeconds(json['joined_at']);
    role = json['role'];
  }
}
