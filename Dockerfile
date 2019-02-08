# ---- Base image ----
FROM hmcts/ccd-definition-importer:latest as base

# ---- Runtime image ----
FROM hmcts/ccd-definition-processor:latest
RUN apk add --no-cache curl jq zip unzip git
COPY --from=base /scripts /scripts
COPY --from=base /wait /
COPY /scripts/process-definition.sh /scripts
ENTRYPOINT []
CMD "/wait" && "/scripts/process-definition.sh" && "/scripts/upload-definition.sh"