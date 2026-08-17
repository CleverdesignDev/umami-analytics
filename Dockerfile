# Umami analytics for CleverDesign client sites.
# Deployed on Render as a git-backed Docker web service.
# To upgrade Umami: bump the image tag below and open a PR — after merging,
# trigger a deploy manually in Render (no GitHub App on this repo, so pushes
# don't auto-deploy). Umami runs its own DB migrations on startup. Take a
# Render Postgres backup first on MAJOR version bumps.
FROM ghcr.io/umami-software/umami:postgresql-v2.20.2

# Allow the CMS admin to iframe share pages. Umami reads ALLOWED_FRAME_URLS at
# BUILD time (next.config.mjs bakes it into the CSP in .next/routes-manifest.json),
# so a runtime env var has no effect on this prebuilt image — patch the baked
# header instead. The grep makes the build fail loudly if a future Umami
# version moves the header, instead of silently shipping a broken embed.
RUN grep -q "frame-ancestors 'self'" /app/.next/routes-manifest.json && \
    sed -i "s#frame-ancestors 'self'#frame-ancestors 'self' https://cms.cleverdesign.com http://localhost:5173#g" /app/.next/routes-manifest.json
