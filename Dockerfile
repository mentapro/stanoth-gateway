FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
WORKDIR /app

COPY *.sln ./
COPY src/*/*.csproj ./
RUN for file in $(ls *.csproj); do mkdir -p src/${file%.*}/ && mv $file src/${file%.*}/; done
RUN dotnet restore

COPY . ./
RUN dotnet build -c Release
RUN dotnet publish -c Release -o /published --no-build --no-restore

# Runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /app
COPY --from=build-env /published ./

ENTRYPOINT ["dotnet", "Gateway.Api.dll"]