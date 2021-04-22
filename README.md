# Docker image with custom JRE
### -- By using jlink --
<br>
This repository contains source code example for build a multi-stage docker.

This project contains a very simple Spring-boot code which responses on http://localhost:8080

And also contains a Dockerfile which is a multi-stage docker file.

## How to run

* Docker must be installed on your system
* In terminal go to root of the project and run : 
    * \#``` docker build -t hello .``` 
    * \#``` docker run hello -p 8080:8080```
    
* Go to browser and browse into http:\\localhost:8080

## Next
Below, a couple of points mentioned which are not described here to keep this sample simple.
* Use -v option of docker for mounting your local maven repository and prevent downloading maven dependencies in build repetitive phase.
* Use Maven plugins for building images instead of direct docker CLI commands.
* Push docker image into a docker hub to make it accessible from hosts outer of your local.

<br>
Thanks for reading<br>
Amir Keshavarz
