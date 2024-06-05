# Use the .NET SDK to build the app
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

# Arguments for target platform and architecture
ARG TARGETPLATFORM
ARG TARGETARCH
ARG BUILDPLATFORM

# Print the build information
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM"

# Set the working directory
WORKDIR /source

# Copy the .csproj file and restore dependencies
COPY *.csproj .
RUN dotnet restore

# Copy the rest of the files and publish the app
COPY . .
RUN dotnet publish -c Release -o /app --self-contained false --no-restore

# Use the .NET runtime image to run the app
FROM mcr.microsoft.com/dotnet/runtime:7.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "Worker.dll"]
