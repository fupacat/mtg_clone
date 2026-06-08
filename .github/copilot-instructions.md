# Copilot repository instructions

Project: mtg_clone (Unity 6.4)

- Unity version: 6.4 (set UNITY_VERSION or UNITY_PATH env var in CI/locally).
- Build targets: (configured per job) e.g., Windows, macOS, Android, iOS.
- Use Git LFS for all large assets: *.png, *.jpg, *.psd, *.fbx, *.wav, Assets/**/Binaries/**
- Prefer code-only PRs; any asset change must include a short playtest report and screenshots/videos hosted externally.
- CI: run unit tests, playmode tests in headless mode, and a build for at least one platform.
- Secrets: store signing keys and license files in GitHub Secrets; do not print them in logs.

Agent behavior guidance
- If making changes to native plugins or PlayerSettings, create a detailed plan and use /plan then exit_plan_mode for user review.
- When uncertain about API changes across Unity versions, run an explore agent to gather docs and sample code first.
