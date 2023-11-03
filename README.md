
# Offline ChatBot App

## Subject
The target is to build an iOS application using state-of-the-art languages and frameworks, presenting basic client <-> server
communication from the application. The server will be integrated into the application and his job will be only to acknowledge
request. Where you don’t need to create a real server; the use of Mock/Stub is highly recommended.

## Approach and Explanation

This README provides an in-depth explanation of my approach, technical choices, architectural decisions, and future directions for the ChatBot project. I aim to provide insights into my thought process and what could be improved with more time.

## Technical Choices

### SwiftUI and Combine

I chose SwiftUI as it offers a modern, declarative approach to building user interfaces for Apple platforms. Combine complements SwiftUI by providing reactive and declarative programming capabilities. These technologies are native to the Apple ecosystem, ensuring a seamless and efficient user experience.

### MVVM Architecture

To maintain a clear and organized codebase, I adopted the Model-View-ViewModel (MVVM) architectural pattern. This separation of concerns improves code maintainability and allows for more straightforward unit testing. The components are structured as follows:

- **Model**: Represents data structures, including `Message` and `MockMessage`.
- **View**: Contains SwiftUI views and user interface components.
- **ViewModel**: Manages the application's state, user interactions, and message handling.

### Test-Driven Development (TDD)

I followed a test-driven development (TDD) approach to ensure the reliability and correctness of the application. I wrote test cases for key components, including message sending and receiving in `MockChatInteractorTests` and `ChatViewModelTests`. While the test coverage is limited due to time constraints, I plan to expand it to cover more edge cases.

## Architectural Decisions

### Code Organization

I organized the code into separate files and components to promote maintainability. Key components include the `ChatViewModel`, `MessageView`, `MessageStatusView`, and `MockChatInteractor`. This separation makes it easier to understand and work on individual parts of the application.

### Good Practices

I applied SOLID principles, such as single responsibility, open-closed, and dependency inversion. Additionally, I followed the KISS (Keep It Simple, Stupid) and DRY (Don't Repeat Yourself) principles to ensure that the code remains straightforward and avoids redundancy.

## Future Directions

Given more time, I would focus on the following improvements and features:

1. **Enhanced Test Coverage**: I would expand the test coverage to include more scenarios, such as error handling, concurrent user interactions, and complex message sequences.

2. **User Authentication**: Implement user authentication to manage users' identities and profiles, allowing them to have personalized avatars and display names.

3. **Message History**: Add the ability to retrieve and display message history, including older messages beyond the current session.

4. **Message Editing and Deletion**: Implement features for users to edit and delete their messages.

5. **Real Server Integration**: Currently, the application uses a mock chat interactor. I would integrate a real server with WebSocket support to simulate real-time messaging.

## Challenge Timeframe

I completed the ChatBot challenge within the provided time frame of approximately 5 hours. This includes initial code implementation, unit tests, and documentation.

## Sub-Task Splitting

In a real work environment, I would split the project into the following reviewable sub-tasks:

1. **Initial Setup and Project Structure (1 hour)**:
   - Create a new SwiftUI project.
   - Organize the project structure with appropriate folders.
   - Set up the initial user interface.

2. **MVVM Architecture and Data Models (1.5 hour)**:
   - Define data models like `Message` and `MockMessage`.
   - Create view models for message handling.

3. **Mock Chat Interactor and SwiftUI Views (1 hours)**:
   - Implement a mock chat interactor for generating messages.
   - Create SwiftUI views for displaying messages and user interactions.

4. **Unit Testing (1.0 hour)**:
   - Write unit tests for message sending and receiving.
   - Ensure correct application behavior.

5. **Documentation and README (0.5 hours)**:
   - Create detailed explanations of the project, architectural choices, and future improvements in the README.md file.

## Screenshots
| Status | Default | Dark Mode |
:-------------------------:|:-------------------------:|:-------------------------:
Sending|![Simulator Screen Shot - iPhone 14 Pro - 2023-11-03 at 10 48 24](https://github.com/rallahaseh/chat-bot/assets/10099935/af3c3a6d-b2ec-4258-abb2-d342e51e4f84)|![Simulator Screen Shot - iPhone 14 Pro - 2023-11-03 at 10 45 59](https://github.com/rallahaseh/chat-bot/assets/10099935/85d9473b-300f-4747-bfa9-961c2a3a8867)
Sent|![Simulator Screen Shot - iPhone 14 Pro - 2023-11-03 at 10 48 34](https://github.com/rallahaseh/chat-bot/assets/10099935/8bd011e5-4ff4-49af-a15f-db59063d99b2)|![Simulator Screen Shot - iPhone 14 Pro - 2023-11-03 at 10 46 07](https://github.com/rallahaseh/chat-bot/assets/10099935/27afc5ae-9f2a-4b70-864a-98504f78f0b3)
Read|![Simulator Screen Shot - iPhone 14 Pro - 2023-11-03 at 10 48 44](https://github.com/rallahaseh/chat-bot/assets/10099935/92e21855-22c0-4fa6-9117-13b1b3c1ec06)|![Simulator Screen Shot - iPhone 14 Pro - 2023-11-03 at 10 46 17](https://github.com/rallahaseh/chat-bot/assets/10099935/d8cfd781-7f3f-4494-9bb5-0b6cb3d358b7)
Error|![Simulator Screen Shot - iPhone 14 Pro - 2023-11-03 at 10 49 35](https://github.com/rallahaseh/chat-bot/assets/10099935/53eced83-75d5-440f-85c3-40396ff05efa)|![Simulator Screen Shot - iPhone 14 Pro - 2023-11-03 at 10 45 21](https://github.com/rallahaseh/chat-bot/assets/10099935/22485955-bcd4-45dc-928a-a256e592b2c7)

## Dependencies
- [LoremSwiftum](https://github.com/lukaskubanek/LoremSwiftum#loremswiftum)

## Summary
In this challenge, I tackled the TestChatBot project within a time frame of approximately 3.5 hours. I chose SwiftUI and Combine to create a modern, efficient user interface in the Apple ecosystem. My architectural choice of MVVM and adherence to SOLID, KISS, and DRY principles ensured maintainable, high-quality code. The project is organized for clarity, and test-driven development practices guarantee code reliability. While I achieved a solid foundation, future directions involve enhancing test coverage, real server integration, and advanced features like user authentication and message editing. In a professional setting, splitting the project into reviewable sub-tasks can improve collaboration and project management.

At the end, I hope this detailed explanation provides insight into my thought process and approach to the ChatBot challenge. I am open to feedback and further collaboration to enhance the project.

