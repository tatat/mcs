FROM openjdk:17-jdk-bullseye

ARG SPIGOT_VERSION

WORKDIR /minecraft

COPY docker-entrypoint.sh .
COPY start.sh .

RUN mkdir -p ./build ./plugins ./data \
    && curl -o ./build/BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar \
    && curl -o ./plugins/Geyser-Spigot.jar https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/spigot/target/Geyser-Spigot.jar \
    && curl -o ./plugins/floodgate-spigot.jar https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/lastSuccessfulBuild/artifact/spigot/target/floodgate-spigot.jar

ENV SPIGOT_VERSION "${SPIGOT_VERSION}"

EXPOSE 25565
EXPOSE 19132/udp

ENTRYPOINT [ "./docker-entrypoint.sh" ]

CMD [ "./start.sh" ]
