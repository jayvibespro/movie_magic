# Movie Magic App

## Project Overview

Movie Magic is a Simple Flutter application for browsing and discovering movies. This document
provides a
comprehensive explanation of each package used in the project and its purpose.

## State Management

- **get_it**: A simple service locator for dependency injection
- **injectable**: Generates code for dependency injection, working alongside get_it
- **provider**: A state management solution application Theme
- **get**: For easy navigation and show SnackBar

## UI Components and Styling

- **flutter_svg**: Renders SVG files as Flutter widgets
- **heroicons**: Provides a set of beautifully designed SVG icons
- **shimmer**: Creates shimmer/skeleton loading effects for a better user experience
- **flutter_form_builder**: Simplifies form creation and validation
- **form_builder_validators**: Provides validators for flutter_form_builder

## Data Handling and Network

- **http**: Makes HTTP requests to fetch data from APIs
- **json_annotation**: Annotations for JSON serialization/deserialization
- **json_serializable**: Generates code for JSON serialization/deserialization
- **intl**: For String formatting ie date and time
- **flutter_cache_manager**: Caches image files downloaded from the web
- **connectivity_plus**: Monitors network connectivity status

## Authentication

- **firebase_core**: Core functionality for Firebase services
- **firebase_auth**: Firebase authentication services
- **google_sign_in**: Google Sign-In authentication
- **cloud_firestore**: For safe storage of the api key and access_token

## Local Storage

- **shared_preferences**: Persistent storage for simple data
- **sqflite**: SQLite database plugin for local data storage
- **path**: Provides common operations for file system paths
- **flutter_secure_storage**: For local storage of access_token for the api calls

## Development Tools

- **build_runner**: Generates code for various Flutter packages
- **injectable_generator**: Generates code for dependency injection
- **flutter_lints**: Provides lint rules to encourage good coding practices
- **flutter_test**: Testing framework for Flutter applications

## Development Notes

- This application uses a combination of get_it and Injectable for state management
- Firebase is used for authentication services
- Local data is stored using SQLite
- The app implements dependency injection using get_it and injectable
