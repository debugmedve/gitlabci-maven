# Maven with CLI JSON parser

[![](https://images.microbadger.com/badges/image/vereshus/gitlabci-maven.svg)](https://microbadger.com/images/vereshus/gitlabci-maven "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/vereshus/gitlabci-maven.svg)](https://microbadger.com/images/vereshus/gitlabci-maven "Get your own version badge on microbadger.com")


This image is a general build image for Gitlab CI projects which runs [SonarQube](http://www.sonarqube.org). 

To check the quality gates the build image must be able to parse and handle the SonarQube JSON response.

This image can be used for any standard [Maven](https://maven.apache.org) build with JSON parsing feature. 

It based on the [official Maven](https://hub.docker.com/_/maven/) image.

## JQ

It uses the [jq](https://stedolan.github.io/jq/) command line JSON processor to achieve this behavior.

For example you can find the `analysisId`
```
$ wget -qO- http://sonarqube:9000/api/qualitygates/project_status?analysisId=$ID | jq -r .task.analysisId
```

## Tags

`3.3.9-jdk-8`, `latest`: [Dockerfile](https://github.com/debugmedve/gitlabci-maven/tree/master)
`3.3.9-jdk-8-alpine`: [Dockerfile](https://github.com/debugmedve/gitlabci-maven/tree/3.3.9-jdk-8-alpine)

## Alpine

The alpine version also contains the `jq` JSON command line processor and `jruby` because some specific `maven plugin` issue. 

### Known issues

#### Libsass maven plugin issue

The pluging cannot work with alpine image, because it based on a C/C++ [libsass](https://github.com/sass/libsass) library

```
<plugin>
  <groupId>com.github.warmuuh</groupId>
  <artifactId>libsass-maven-plugin</artifactId>
</plugin>
```

[Learn about limitations](https://github.com/jruby/jruby/wiki/JRuby-on-Alpine-Linux#learn-about-limitations)

> Alpine Linux doesn’t use GNU C library (glibc) as conventional distributions like Debian, Red Hat or Gentoo. Instead, it uses musl libc, a lightweight, fast, simple and standards-conform C library.


Use the `jruby` based plugin with alpine image

```
<plugin>
  <groupId>nl.geodienstencentrum.maven</groupId>
  <artifactId>sass-maven-plugin</artifactId>
</plugin>
```
