FROM openjdk:17-jdk-bullseye

ARG SPIGOT_VERSION

WORKDIR /minecraft

COPY docker-entrypoint.sh .
COPY start.sh .

RUN mkdir -p ./build ./plugins ./data

ADD https://hub.spigotmc.org/jenkins/job/BuildTools/146/artifact/target/BuildTools.jar ./build/BuildTools.jar
ADD https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/1028/artifact/bootstrap/spigot/target/Geyser-Spigot.jar ./plugins/Geyser-Spigot.jar
ADD https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/63/artifact/spigot/target/floodgate-spigot.jar ./plugins/floodgate-spigot.jar

ENV SPIGOT_VERSION "${SPIGOT_VERSION}"

EXPOSE 25565
EXPOSE 19132/udp

ENTRYPOINT [ "./docker-entrypoint.sh" ]

CMD [ "./start.sh" ]
