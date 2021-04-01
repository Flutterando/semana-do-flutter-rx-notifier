import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  test(' from json to json', () {
    final json = {'name': 'Maria', 'room': 'sala 1', 'text': '', 'type': 'SocketEventType.enter_room'};

    final event = SocketEvent.fromJson(json);

    expect(event.name, 'Maria');
    expect(event.type, SocketEventType.enter_room);
    expect(event.toJson(), json);
  });
}
