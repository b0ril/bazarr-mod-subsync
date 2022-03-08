# Bazarr sc0ty subsync mod

[linuxserver/bazarr](https://hub.docker.com/r/linuxserver/bazarr) [subsync](https://github.com/sc0ty/subsync) mod

## Usage

1. Setup container according to [linuxserver/bazarr](https://hub.docker.com/r/linuxserver/bazarr) - 
   add `-e DOCKER_MODS=b0ril/bazarr-mod-subsync:latest`
2. Put `subsync --cli sync --sub-lang '{{subtitles_language_code3}}' --ref-lang '{{episode_language_code3}}' --sub '{{subtitles}}' --ref '{{episode}}' --out '{{subtitles}}' --overwrite` in Bazarr post-processing command setting

Subsync v0.17 is included at the moment.
