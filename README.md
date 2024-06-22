# Slash

Slash is a Flutter application designed to provide a seamless user experience for browsing various product categories such as Best Selling, New Arrivals, and Recommended Products. 

This project utilizes **modern state management** and **dependency injection** techniques to maintain a **clean** , **testable** and **scalable** architecture.



It also provides **smooth and intuitive user interface** and **offline access to product data**.



## Table of Contents
- [Slash](#slash)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
  - [Installation](#installation)
  - [Dependencies](#dependencies)
  - [Usage](#usage)
  - [Project Structure](#project-structure)
  - [Main Dependencies](#main-dependencies)
  - [Files Description](#files-description)
    - [Data Layer](#data-layer)
    - [Domain Layer](#domain-layer)
      - [Use Cases](#use-cases)
      - [Dependency Injection](#dependency-injection)
  - [Presentation Layer](#presentation-layer)
    - [Screens](#screens)
    - [States](#states)
    - [Bloc](#bloc)


## Features
- Browse Best Selling Products
- View New Arrivals
- Get Recommended Products
- Smooth and intuitive UI
- Offline access to product data
- Modular and maintainable codebase

## Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/ahmedsaad562000/slash.git
   cd slash
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

3. **Run the application:**
   ```sh
   flutter run
   ```


## Dependencies
- `flutter_bloc`: State management
- `injectable`: Dependency injection
- `GetIt`: Dependency injection
- `flutter`: SDK for building the UI

## Usage
- On the home screen, users can navigate through different categories.
- Users can tap on items to view detailed information.

## Project Structure

<img src="assets\view\structure.png">



## Main Dependencies
- `flutter_bloc`: State management with Bloc pattern.
- `injectable & GetIt`: Dependency injection.

## Files Description

### Data Layer
- **data/local**: Contains local data source implementation for offline data access.
  - **local_data_source.dart**: Interface for local data source.
  - **local_data_source_impl.dart**: Implementation of local data source using JSON files.
- **data/repository**: Contains repository implementations.
  - **home_repository.dart**: Interface for home repository.
  - **home_repository_impl.dart**: Implementation of home repository.

### Domain Layer



#### Use Cases
- **usecases/get_best_selling_use_case.dart**: Use case for fetching best-selling products.
- **usecases/get_new_arrival_use_case.dart**: Use case for fetching new arrival products.
- **usecases/get_recommended_use_case.dart**: Use case for fetching recommended products.

#### Dependency Injection
- **home_module.dart**: Configures dependency injection using injectable package.
- **Injection.dart**: Defines the injection configurations for GetIt.

## Presentation Layer
### Screens
- **home_screen.dart**: UI for the home screen, displays product categories.

### States
- **home_state.dart**: Defines various states for the home screen.

### Bloc
- **home_events.dart**: Defines the events that can be triggered in the home bloc.
- **home_bloc.dart**: Manages the state and events related to the home screen.








