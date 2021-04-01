FROM google/dart AS build
WORKDIR /server
COPY ./common /common
COPY ./server /server
RUN dart pub get
RUN dart compile exe bin/server.dart -o bin/server

FROM subfuzion/dart:slim
COPY --from=build /server/bin/server /server/bin/server
ENTRYPOINT [ "/server/bin/server" ]