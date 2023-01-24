FROM mcr.microsoft.com/dotnet/sdk:7.0 as sdk
WORKDIR /app
COPY /app .
#RUN dotnet new webapi
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:7.0
ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80
WORKDIR /app
COPY --from=sdk /app/out .
ENTRYPOINT ["dotnet", "app.dll"]