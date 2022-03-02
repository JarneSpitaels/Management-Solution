
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GetItemsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getItems',
      apiUrl:
          'https://workflow-automation.podio.com/podiofeed.php?c=7168&a=542389&f=5905',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}
