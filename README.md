# README

## Prerequisites

Make sure you have the following software installed on your machine:

- Ruby 3.2.2
- Rails 7.0.8

## Setup

1. **Install Ruby and Rails:**

   Make sure you have Ruby version 3.2.2 and Rails version 7.0.8 installed on your system. You can install them using your preferred version manager or by following the instructions on the official Ruby and Rails websites.

   ```bash
   # Example using rbenv
   rbenv install 3.2.2
   rbenv global 3.2.2

   gem install rails -v 7.0.8
   ```

2. **Bundle Install:**

    After installing Ruby and Rails, run the following command to install project dependencies:
    ```bash
    bundle install
3. **Database Setup:**

    Run the following commands to set up the database:
    ```bash
    rake db:create
    rake db:migrate
    rake db:seed
    ```

## Running the Application

To start the application, you need to install hivemind. If you don't have it installed, you can install it using:

  ```bash
  gem install hivemind
  ```

After installing hivemind, run the following command:

```bash
hivemind Procfile.dev
```

This will start the development environment for your application.

## Running Test Cases with RSpec
Use RSpec to run test cases. Run the following command:

```bash
rspec
```

## Checking API Endpoints

Use Rails routes to check available API endpoints. Run the following command:

```bash
rails routes
```
This will display a list of available routes along with their associated controllers and actions.



## Note: 

No authentication has been added to API endpoints or controller actions, and the UI is minimal. These aspects were not in the scope of the current project, but the functional part is working fine.

## Questions or Concerns?
If you have any questions or concerns, feel free to reach out to the project owner at pareekkartavya@gmail.com.