## server

VLAB server configurations/initialization guide.

### Access

https://v1.seorii.page
https://v2.seorii.page

### Reseting Server

1. Install Ubuntu LTS with username `vlab`.
2. Run `scripts/install_coder.sh`.
3. Run `scripts/install_cuda.sh`.
4. Copy/Paste `Caddyfile`/`caddy.service`/`coder.env` into desired path. Replace env with proper value.
5. Restart host.
6. Access to coder WebUI and create admin account.
7. Create `docker` template and paste content in `coder/base`.
8. Create a test container.
9. All done!
