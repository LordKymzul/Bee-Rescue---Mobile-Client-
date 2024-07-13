import 'package:beerescue_mobile/features/model/user-entity.dart';

class CaseEntity {
  final String? caseID;
  final String? caseStatus;
  final String? caseLocation;
  final DateTime? caseDate;
  final DateTime? caseCreatedAt;
  final UserEntity? caseClient;
  final UserEntity? caseHiver;

  CaseEntity({
    this.caseID,
    this.caseStatus,
    this.caseLocation,
    this.caseDate,
    this.caseCreatedAt,
    this.caseClient,
    this.caseHiver,
  });
}
