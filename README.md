# umami-analytics

Self-hosted [Umami](https://umami.is) powering the per-site Analytics view in the CleverDesign CMS admin.

- **Render service**: umami-analytics (Oregon, Docker runtime, this repo)
- **Database**: Render Postgres `umami-analytics-db`
- **Env vars** (set on the Render service): `DATABASE_URL`, `APP_SECRET`, `ALLOWED_FRAME_URLS`
- **Upgrades**: bump the image tag in the Dockerfile, merge to main. Umami auto-migrates on boot. Back up the DB before major-version bumps.

Each CMS client site gets its own Umami website + share URL; the share URL is stored on the CMS `Site` row and embedded in the admin's Analytics page.
