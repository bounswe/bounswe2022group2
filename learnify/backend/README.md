# Welcome to Learnify API

We uses Node.js and Express.js for our API.

## Manual Installation

- git clone <https://github.com/bounswe/bounswe2022group2.git>
- cd bounswe2022group2/backend
- npm install
- Prepare the environment variables by generating .env file(you can find details about this bellow)
- npm start

## Docker Installation

You can just run `docker-compose up` to get the DB and the API running.
If you changed the code, you need to run `docker-compose up -- build` to change the code in the image. 
## Requirements

For development, you will need Node.js and MongoDB. In addition, you shall set your .env file.

### Node

- #### Node installation on Windows

  Just go on [official Node.js website](https://nodejs.org/) and download the installer.
Also, be sure to have `git` available in your PATH, `npm` might need it (You can find git [here](https://git-scm.com/)).

- #### Node installation on Ubuntu

  You can install nodejs and npm easily with apt install, just run the following commands.

      sudo apt install nodejs
      sudo apt install npm

- #### Other Operating Systems

  You can find more information about the installation on the [official Node.js website](https://nodejs.org/) and the [official NPM website](https://npmjs.org/).

If the installation was successful, you should be able to run the following command.

    $ node --version
    v18.0.0

    $ npm --version
    8.6.0

If you need to update `npm`, you can make it using `npm`! Cool right? After running the following command, just open again the command line and be happy.

    npm install npm -g
    
### MongoDB

You can use any MongoDB provider, but for a quick setup, official MongoDB container is recommended.


### .env

You can list of environment variables that our API uses for configuration:

#### Compulsory Variables

DB_URI : MongoDB URI of your local development database. 

#### Optional Variables

PORT: The API will be served using this port
