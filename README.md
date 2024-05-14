
# Contact Manager App

This is a simple iOS application developed in Swift using the MVVM architecture pattern and SQLite for data persistence. The application allows users to manage their contacts by adding, updating, and deleting contact entries.

## Features

- **Add Contact:** Users can add new contacts by providing their name and phone number.
- **Update Contact:** Existing contact information can be updated with new details.
- **Delete Contact:** Users can remove contacts from the list.
- **View Contacts:** Displays a list of all saved contacts.

## Requirements

- Xcode 12.0 or later
- iOS 14.0 or later

## Installation

1. Clone or download the repository.
2. Open the project in Xcode.
3. Build and run the application on a simulator or a physical device.

## How to Use

1. Launch the application on your iOS device.
2. Navigate to the "Contacts" tab to view your existing contacts.
3. To add a new contact, tap on the "+" button and fill in the required information.
4. To update an existing contact, select the contact from the list and tap on the "Kaydet" button.
5. To delete a contact, swipe left on the contact entry and tap on the "Delete" button.

## Architecture

The application follows the MVVM (Model-View-ViewModel) architectural pattern:

- **Model:** Represents the data structure of a contact.
- **View:** Displays the user interface elements and interacts with the user.
- **ViewModel:** Acts as an intermediary between the View and the Model. It processes user inputs, retrieves data from the Model, and updates the View accordingly.

## Data Persistence

SQLite is used for data persistence in this application. Contact information is stored locally on the device, allowing users to access their contacts even when offline.
