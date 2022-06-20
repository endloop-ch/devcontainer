# devcontainer
Docker container for development

## Installation
- Create a folder `.devcontainer` in your project's root folder. 
- Copy the content to this folder 
- Specify the following data in the `.env` file:
    - Username
    - User group
    - Workdir of container
    - Container/Image name
    - Port to be exposed
- Run `docker-compose up -d --build`

Done!