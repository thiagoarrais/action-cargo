FROM rust:1.31

LABEL "com.github.actions.name"="GitHub Action for cargo"
LABEL "com.github.actions.description"="Wraps the cargo CLI to enable common cargo commands."
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="yellow"

LABEL "repository"="https://github.com/thiagoarrais/action-cargo"
LABEL "homepage"="https://github.com/thiagoarrais/action-cargo"
LABEL "maintainer"="Thiago Arrais <thiago.arrais@gmail.com>"

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
