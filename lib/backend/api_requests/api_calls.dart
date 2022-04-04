import '../../flutter_flow/flutter_flow_util.dart';

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

class PostOrderCall {
  static Future<ApiCallResponse> call({
    double totalPrice,
    String productName = '',
    int quantity,
  }) {
    final body = '''
{"totalPrice": "${totalPrice}",
"productName":"${productName}",
"quantity":"${quantity}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postOrder',
      apiUrl: 'https://workflow-automation.podio.com/catch/96w22jm146hnrmq',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'totalPrice': totalPrice,
        'productName': productName,
        'quantity': quantity,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetAccommodationsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getAccommodations',
      apiUrl:
          'https://workflow-automation.podio.com/podiofeed.php?c=7168&a=543779&f=5926',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class GetCategoriesCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getCategories',
      apiUrl:
          'https://workflow-automation.podio.com/podiofeed.php?c=7168&a=543779&f=5936',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class GetEventsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getEvents',
      apiUrl:
          'https://workflow-automation.podio.com/podiofeed.php?c=7168&a=545236&f=5937',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class GetOrdersCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getOrders',
      apiUrl:
          'https://workflow-automation.podio.com/podiofeed.php?c=7168&a=545433&f=5939',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class CreateEventCall {
  static Future<ApiCallResponse> call({
    String name = '',
    String description = '',
    double price,
    String image = '',
    String dateEvent = '',
    String startTime = '',
    String endTime = '',
  }) {
    final body = '''
{
  "name": "${name}",
  "description": "${description}",
  "price": "${price}",
  "image": "${image}",
  "dateEvent": "${dateEvent}",
  "startTime": "${startTime}",
  "endTime": "${endTime}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createEvent',
      apiUrl: 'https://workflow-automation.podio.com/catch/849rk6t1454x5j5',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': name,
        'description': description,
        'price': price,
        'image': image,
        'dateEvent': dateEvent,
        'startTime': startTime,
        'endTime': endTime,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class CreateItemCall {
  static Future<ApiCallResponse> call({
    String name = '',
    String description = '',
    String image = '',
    String type = '',
    double value,
    String firestoreID = '',
  }) {
    final body = '''
{
  "name": "${name}",
  "description": "${description}",
  "image": "${image}",
  "type": "${type}",
  "value": "${value}",
  "firestoreID": "${firestoreID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createItem',
      apiUrl: 'https://workflow-automation.podio.com/catch/925ybo42874h790',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': name,
        'description': description,
        'image': image,
        'type': type,
        'value': value,
        'firestoreID': firestoreID,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetStockCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getStock',
      apiUrl:
          'https://workflow-automation.podio.com/podiofeed.php?c=7168&a=549313&f=5959',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class PostStockItemCall {
  static Future<ApiCallResponse> call({
    String name = '',
    double maximumStockLevel,
    String image = '',
    double currentStockLevel,
  }) {
    final body = '''
{
  "name": "${name}",
  "maximumStockLevel": "${maximumStockLevel}",
  "image": "${image}",
  "currentStockLevel": "${currentStockLevel}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postStockItem',
      apiUrl: 'https://workflow-automation.podio.com/catch/ko3m4gt112g2a97',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': name,
        'maximumStockLevel': maximumStockLevel,
        'image': image,
        'currentStockLevel': currentStockLevel,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class CreateMeetingRoomCall {
  static Future<ApiCallResponse> call({
    String name = '',
    String category = '',
    int seats,
    String image = '',
  }) {
    final body = '''
{
  "name": "${name}",
  "seats": "${seats}",
  "image": "${image}",
  "category": "${category}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createMeetingRoom',
      apiUrl: 'https://workflow-automation.podio.com/catch/70k4n38zvs1574g',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': name,
        'category': category,
        'seats': seats,
        'image': image,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
