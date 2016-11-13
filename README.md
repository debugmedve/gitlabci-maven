# Maven with CLI JSON parser

[![](https://images.microbadger.com/badges/image/vereshus/gitlabci-maven.svg)](https://microbadger.com/images/vereshus/gitlabci-maven "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/vereshus/gitlabci-maven.svg)](https://microbadger.com/images/vereshus/gitlabci-maven "Get your own version badge on microbadger.com")


This image is a general build image for Gitlab CI projects which runs [SonarQube](http://www.sonarqube.org). 

To check the quality gates the build image must be able to parse and handle the SonarQube JSON response.

This image can be used for any standard [Maven](https://maven.apache.org) build with JSON parsing feature. 

It based on the [official Maven](https://hub.docker.com/_/maven/) image.

## JQ

It uses the [jq](https://stedolan.github.io/jq/) command line JSON processor to achieve this behavior.

For example you can find the ```analysisId```
```
$ wget -qO- http://sonarqube:9000/api/qualitygates/project_status?analysisId=$ID | jq -r .task.analysisId
```

