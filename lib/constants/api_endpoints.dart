// ignore_for_file: avoid_classes_with_only_static_members

abstract final class Endpoints {
  static const baseUrl = "https://hardy-crane-66.hasura.app/api/rest/";

  static const createUser = "createUser";
  static String getUser(String userId) => "getUser/$userId";

  static const getStatusType = "getStatusType";
  static const getTaskList = "getTaskList";
}
