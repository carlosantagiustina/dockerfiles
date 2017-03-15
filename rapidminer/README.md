# Rapidminer studio
Run Rapidminer studio community edition and view the interface in your browser

# Usage
Use the run.sh script to run the image and then point your browser to http://<image host>:<port>

Usage: run.sh [-h] [-q] [-c CONTAINER] [-i IMAGE] [-p PORT] [-r DOCKER_RUN_FLAGS] 

  -h             Display this help and exit.
  -c             Container name to use (default ${container}).
  -i             Image name (default ${image}).
  -p             Port to expose HTTP server (default ${port}). If an empty
                 string, the port is not exposed.
  -r             Extra arguments to pass to 'docker run'. E.g.
                 --env="APP=glxgears"
  -q             Do not output informational messages.

run.sh
- Makes sure docker is available
- On Windows and Mac OSX, creates a docker machine if required
- Informs the user of the URL to access the container with a web browser
- Stops and removes containers from previous runs to avoid conflicts
- Mounts the present working directory to /home/user/work on Linux and Mac OSX
- Prints out the graphical app output log following execution
- Exits with the same return code as the graphical app

# Note
This is an 1.38GB image and requires 2GB RAM to run

# Tips
After the first run you can create a registered image like

docker commit rapidminerstudio ckir/rapidminer

# Build
To rebuild the image download the latest version of Rapidminer Studio from their site

Unzip it in this folder in a folder called rapidminer-studio

Edit the build.sh script to specify your names

Run ./build.sh


