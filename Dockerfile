ARG IMAGE=store/intersystems/iris-aa-community:2020.3.0AA.331.0
ARG IMAGE=intersystemsdc/iris-community:2020.2.0.196.0-zpm
ARG IMAGE=intersystemsdc/iris-aa-community:2020.3.0AA.331.0-zpm
ARG IMAGE=intersystemsdc/irishealth-community:2020.3.0.200.0-zpm
ARG IMAGE=intersystemsdc/iris-community:2020.4.0.524.0-zpm
ARG IMAGE=intersystemsdc/iris-community
FROM $IMAGE

USER root
WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp

USER ${ISC_PACKAGE_MGRUSER}

# copy files
COPY  Installer.cls .
COPY  src src
COPY iris.script /tmp/iris.script
COPY module.xml module.xml


# special extract treatment for hate-speech dataset
# RUN mkdir /data/hate-speech/ \
#	&& tar -xf /data/hate-speech.tar -C /data/

# load demo stuff
RUN iris start IRIS \
	&& iris session IRIS < /tmp/iris.script

COPY /dsw/irisapp.json /usr/irissys/csp/dsw/configs/
