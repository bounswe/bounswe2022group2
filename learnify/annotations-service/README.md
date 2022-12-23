# Learnify Source Code 

## Running Docker Compose Instructions

### Environment Files

#### Backend

Go to backend folder and create a .env file
Your .env file shall include:

JWT_KEY: key to be used for jwt tokens generation.
MAIL: mailaddress the API uses, currently only gmail is supported.
MAIL_PASS: application password of MAIL, please refer to : https://support.google.com/mail/answer/185833?hl=en

You can contact us for getting MAIL and MAIL_PASS used for our Milestone 1 presentation.

#### Semantic server

You should add API key used for semantic analysis API, please contact us for the required .env file.

#### Frontend

No environment files are required.

### Getting the server up

`docker compose up` command will get our frontend and backend clients up and running on your local.

## Running our APK

Please refer to the [System Manual](https://github.com/bounswe/bounswe2022group2/wiki/System-Manual) for getting our APK running.

