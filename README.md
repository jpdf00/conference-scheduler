# Conference Scheduler

> Conference Scheduler is an app developed to help create and easely organize conferences from a single text file!.

On your first access you will enter the Conferences Page.
From there you can:

- Creating a New Conference.
   - The creation of a new conference requires only a name that has to exist but doesn't have any other requirements.
   - This will create only a new conference, without tracks or lectures.
   - This will redirect you to the conference page where you will be able to change the conference name or delete the conference(Deleting a Conference will delete all tracks and all lectures associeted with it).
   - In this Page you will also be able to create a new track(See below for more information on creating tracks or lectures).

- Creating a new conference from a file.
   - This functionality accepts a simple text and from there creates an conference, the tracks needed for the conference and the lectures already organized per track including a lunch break at 12:00 and a Networking event that starts between 16:00 and 17:00 at each track
   - DO NOT use a docx, doc, or pdf file, the app still doesn't support those formats yet.
   - In the `public` folder of this app you will find a file named `conference_example.txt`. This file is an example and can be use test the functionality of the import function.
   - The formmating used on the file should be `Lecture Title 50min`(where 50 min is the duration) or `Lecture Title lightning` which implies a 5min duration. The duration should always be in minutes.
   - This enpoint(`POST lectures/import`) is externally exposed and can accessed by postman or other external services. Making a POST request containing a file that matches the requirements above to that endpoint will return a json with the data organized and ready to be shown as desired.
   - In the `public` folder of this app you will find a file named `response_example.json`. This file is an example of the response you will receive when sending a POST request to the endpoint `lectures\import` with a file that matches the requirements above.

Clicking on the name of the Conference will take you to the conference page where you can add a new track to the conference

 - Creating a New Track:
   - This will created a new track for that especific conference.
   - The Tracks are named automatically using the latin alphabet letters ('A' to 'Z'). There is no need to add any extra information.
   - This will redirect you to the track page where you will be able to delete the track(Deleting a track will delete all lectures associeted with it) or to create a new Lecture for that track.

 - Creating a New Lecture:
   - On the Track page you will find a form to create a new lecture.
   - This will created a new Lecture for that especific Track.
   - The only field that is not-required is lecturer. All other fields are required.
   - This will redirect you to the lecture page where you will be able to edit the lecture or delete the lecture.

Obs.: 
 - The manual creation system does NOT cross check with the Import system. So if you are editing a lecture created with the Import system or creating a new lecture for a track built with the import system it IS possible to create time overlaps. Be careful.

## Next Steps

These are functionalities that can be expected in future versions.
 - Using the [docx gem](https://rubygems.org/gems/docx) to suport the upload of `.docx` files.
 - Using the [pdf-reader gem](https://rubygems.org/gems/pdf-reader) to suport the upload of `.pdf` files.
 - Integrating the manual system with the import system making it impossible to manually create a lecture that overlaps with other lectures.
 - Better error handling for the import system.
 - User authentication.

## Built With

- Ruby 3.0.2
- Rails 6.1.5
- Tested with:
  - Rspec
  - Capybara
  - shoulda-matchers
  - factory-bot
- Database with:
  - PostgreSQL 13

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Ruby 3.0.2
- Rails 6.1.5
- Yarn
- PostgreSQL

### Setup

- On the top of this repo click on the button named "Clone"
- Copy the HTTP URL or SSH.
- On the terminal type `git clone <copied-value>` where <copied-value> is the value you copied on the previous step.
- On the terminal `cd` to the folder you cloned.

### Install

- Open the file 'database.yml' on the folder 'config'
- On development: and on test: change the values of username: and password: to the username and password of your local postgres server.
- On the terminal type `rails db:create`.
- On the terminal type `rails db:migrate`.

### Usage

- On the terminal type `rails s`
- On the browser type `localhost:3000`

### Run tests

- On the terminal `cd` to the folder you just cloned.
- On the terminal type `rspec`.

## Author

👤 **João Paulo Dias França**

- GitHub: [@jpdf00](https://github.com/jpdf00)
- LinkedIn: [João Paulo Dias França](https://www.linkedin.com/in/jpdf00/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/jpdf00/conference-scheduler/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Web-challenge proposed by [Stant](https://www.stant.com.br/)

## 📝 License

This project is [MIT](./LICENSE) licensed.
