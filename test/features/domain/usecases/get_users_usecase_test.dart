import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:users_list/features/userlist/domain/entities/user_entity.dart';
import 'package:users_list/features/userlist/domain/repositories/user_repository.dart';
import 'package:users_list/features/userlist/domain/usecases/get_users_usecase.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository mockUserRepository;
  late GetUsersUseCase getUsersUseCase;

  setUp(() {
    mockUserRepository = MockUserRepository();
    getUsersUseCase = GetUsersUseCase(mockUserRepository);
  });

  group('GetUsersUseCase', () {
    test('should return a list of UserEntities', () async {
      final mockUsers = [
        UserEntity(
          name: 'Bob Esponja',
          email: 'bobesponja@gmail.com',
          avatarUrl: 'https://randomuser.me/api/portraits/men/75.jpg',
          phone: '3224-4000',
          city: 'Bikini Bottom',
          state: 'Pacific Ocean',
          country: 'United States',
          birthday: "2007-07-09T05:51:59.390Z",
        ),
        UserEntity(
          name: 'Tony Stark',
          email: 'tonystark@gmail.com',
          avatarUrl: 'https://randomuser.me/api/portraits/men/10.jpg',
          phone: '4002-8922',
          city: 'New York City',
          state: 'New York',
          country: 'United States',
          birthday: "2007-07-09T05:51:59.390Z",
        ),
      ];

      when(() => mockUserRepository.getUsers())
          .thenAnswer((_) async => mockUsers);

      final result = await getUsersUseCase();

      expect(result, mockUsers);
      verify(() => mockUserRepository.getUsers()).called(1);
    });

    test('should throw an exception when data fetch fails', () async {
      when(() => mockUserRepository.getUsers())
          .thenThrow(Exception('Failed to fetch data'));

      expect(() => getUsersUseCase(), throwsException);
      verify(() => mockUserRepository.getUsers()).called(1);
    });

    test('should return an empty list when no users are found', () async {
      when(() => mockUserRepository.getUsers()).thenAnswer((_) async => []);

      final result = await getUsersUseCase();

      expect(result, isEmpty);
      verify(() => mockUserRepository.getUsers()).called(1);
    });
  });
}
