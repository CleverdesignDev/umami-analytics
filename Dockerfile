# Umami analytics for CleverDesign client sites.
# Deployed on Render as a git-backed Docker web service.
# To upgrade Umami: bump the image tag below and merge — Render auto-deploys,
# and Umami runs its own DB migrations on startup. Take a Render Postgres
# backup first on MAJOR version bumps.
FROM ghcr.io/umami-software/umami:postgresql-v2.20.2
