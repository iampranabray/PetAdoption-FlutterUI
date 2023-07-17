# Pet Adoption

This is a pet adoption app built with Flutter that allows users to browse and adopt pets. It includes pagination listing, search functionality, and a history of adoption feature.

## Features

- Pagination listing: The app fetches and displays a list of pets in a paginated manner, allowing users to browse through multiple pages of available pets.

- Search: Users can search for pets based on different criteria such as name age, gender, etc. The app provides a search bar where users can enter their search query and receive filtered results.

- History of adoption: The app keeps track of pets that users have adopted in the past. It provides a history section where users can view the details of previously adopted pets.

## Screenshots
<img src="/assets/screenshot.png"/> 

## Architecture

### Data Layer

This layer is the lowest layer and is responsible for retrieving raw data from external sources such as a databases, APIs, and more.

### Domain Layer

This layer combines one or more data providers and applies "business rules" to the data. Each component in this layer is called a repository and each repository generally manages a single domain. Packages in the repository layer should generally only interact with the data layer.

### Feature Layer

This layer contains all of the application-specific features and use cases. Each feature generally consists of some **UI and business logic**. Features should generally be independent of other features so that they can easily be added/removed without impacting the rest of the codebase. Within each feature, the state of the feature along with any business logic is managed by blocs. Blocs interact with zero or more repositories. Blocs react to events and emit states which trigger changes in the UI. Widgets within each feature should generally only depend on the corresponding bloc and render UI based on the current state. The UI can notify the bloc of user input via events.

<img src="/assets/architecture.png"/> 

Now that we've gone over the layers at a high level, let's start building our application starting with the data layer!

#### Database queries are:
- Find Records of Limit n.
  
  **final List<PetDataModel?> dataModel =
          await isar.petDataModels.where().limit(20).findAll();**
- Pagination using ISAR Data Base.
  
  **var offsetCount = index * perPage;**
  
  **await dataModel.where().offset(offsetCount).limit(10).findAll();**
- Searching items(AKA Pets)
  
  **List<PetDataModel?> dataModel = await isar.petDataModels
          .filter()
          .nameContains(searchText ?? "")
          .findAll();**
  
- Setting up model attributes
  
  **await isar.petDataModels.filter().isAdoptedEqualTo(true).findAll();**

## Getting Started

To get started with this project, follow these steps:

1. Clone the repository:
  
2. Change into the project directory:
   
3. Install dependencies:


4. Run the app:


## Dependencies

This project relies on the following famous dependencies:

- [flutter_bloc](https://pub.dev/packages/flutter_bloc): State management library that provides a predictable way to manage app state.
- [isar](https://pub.dev/packages/isar): Super Fast Cross-Platform Database for Flutter
- [provider](https://pub.dev/packages/provider): State management library that provides a predictable way to manage app state.
- [get_it](https://pub.dev/packages/get_it): This is a simple Service Locator for Dart and Flutter projects with some additional goodies highly inspired by Splat. It can be used instead of InheritedWidget or Provider to access objects e.g. from your UI.
  


Make sure to check the `pubspec.yaml` file for the specific versions of these dependencies used in the project.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

[Add your license information here]



