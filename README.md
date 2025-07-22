# Gemini CLI Container Image

This project automatically builds and publishes a container image for the [Google Gemini CLI](https://github.com/google-gemini/gemini-cli).

The image is published to the GitHub Container Registry at `ghcr.io/iansantosdev/gemini-cli`.

## How It Works

This repository contains a `Dockerfile` that downloads a specific version of the `gemini-cli` release and installs it into a lightweight `alpine`-based image. The `ENTRYPOINT` is configured to run the `gemini-cli`, so you can pass commands directly to the container.

A GitHub Actions workflow (`.github/workflows/release.yml`) is configured to:
1.  Run daily on a schedule (`cron`).
2.  Check for the latest release of `google-gemini/gemini-cli`.
3.  If a corresponding Docker image tag does not already exist in the GitHub Container Registry, it builds a new image.
4.  The new image is tagged with both the release version (e.g., `0.1.13`) and `latest`, then pushed to `ghcr.io/iansantosdev/gemini-cli`.

Additionally, Dependabot is configured to automatically update the GitHub Actions used in the workflow, ensuring the build process stays current with the latest features and security patches.

## Usage

The container image can be used with either Podman or Docker.

### Podman

#### Pulling the Image

You can pull the latest image using the following command:

```bash
podman pull ghcr.io/iansantosdev/gemini-cli:latest
```

To pull a specific version, replace `latest` with the desired version tag:

```bash
podman pull ghcr.io/iansantosdev/gemini-cli:<version>
```

#### Running the Container

To use the `gemini-cli` through Podman, simply run the container to start an interactive session. You can also pass arguments to the container to execute specific commands.

```bash
podman run --rm -it ghcr.io/iansantosdev/gemini-cli:latest
```

To use it with your local Gemini credentials for authentication, you can mount your `.gemini` configuration directory:

```bash
podman run --rm -it -v ~/.gemini:/root/.gemini ghcr.io/iansantosdev/gemini-cli:latest
```

### Docker

#### Pulling the Image

You can pull the latest image using the following command:

```bash
docker pull ghcr.io/iansantosdev/gemini-cli:latest
```

To pull a specific version, replace `latest` with the desired version tag:

```bash
docker pull ghcr.io/iansantosdev/gemini-cli:<version>
```

#### Running the Container

To use the `gemini-cli` through Docker, simply run the container to start an interactive session. You can also pass arguments to the container to execute specific commands.

```bash
docker run --rm -it ghcr.io/iansantosdev/gemini-cli:latest
```

To use it with your local Gemini credentials for authentication, you can mount your `.gemini` configuration directory:

```bash
docker run --rm -it -v ~/.gemini:/root/.gemini ghcr.io/iansantosdev/gemini-cli:latest
```
