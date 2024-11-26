# Flutter Clean Architecture Project

Code Challenge using Clean Architecture. The app shows a user list displaying `name`, `email` and `avatar`. You can pull down to reload the data. Tapping the card will navigate to the `User Details Page`.

## Preview

[gifs]

## Dependencies

- GetX for state management and navigation
- Dio for HTTP request
- mocktail for testing
- intl for date formatting

## Code Structure

```
lib
├── features
│   └── userlist
│       ├── data
│       │   ├── data_source
│       │   │   └── user_data_source.dart
│       │   ├── models
│       │   │   └── user_model.dart
│       │   └── repositories
│       │       └── user_repository_impl.dart
│       ├── domain
│       │   ├── entities
│       │   │   └── user_entity.dart
│       │   ├── repositories
│       │   │   └── user_repository.dart
│       │   └── usecases
│       │       └── get_users_usecase.dart
│       └── presentation
│           ├── controllers
│           │   └── user_list_controller.dart
│           └── pages
│               ├── user_details_page.dart
│               └── user_list_page.dart
├── main.dart
└── utils
    └── constants.dart
```

For each feature, we set up the Clean Architecture layers: `Data`, `Domain` and `Presentation`.

- The Data Layer will provide data to the domain layer.
  - Data Source can be Remote or Local
  - Model will contain the data structure
  - Repository will implement the Domain Repository interfaces
- The Domain Layer will contain the core business logic of the app and must be independent of any framework
  - Entities will containt the business object
  - Use Cases implement business logic and creates a bridge between Presentation and Domain layers.
- The Presentation Layer contains the UI and everything related to it
  - Controller will manage UI state (in this case, using GetX) and hold the logic that connects the UI and the domain layer.
  - Pages have all the pages in the app. We could also add a `Widgets` folder here to organize and reuse widgets.
- Utils should contain any file that is common to every part of the project, like constants, helpers, etc. In this project I created constants for spacing and border radius to illustrate.
