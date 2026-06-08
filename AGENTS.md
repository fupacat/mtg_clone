# AGENTS.md

Purpose: Configure Copilot agents for this Unity 6.4 project.

Agent roles and usage
- explore: research design, asset pipelines, and third-party SDKs; only read files under Assets/, Packages/, ProjectSettings/ and docs/.
- task: run builds, tests, asset processing via tools\build-unity.ps1 and tools\run-headless-playtests.ps1.
- general-purpose: implement complex code changes, refactors, multi-file changes; open a PR and include tests.
- code-review: focused automated review of PR diffs; check C# conventions and Unity API usage.

Guidelines for agents
- Always run unit/playmode tests and CI locally (task) before changing ProjectSettings or assets.
- Do not commit large binary assets; use LFS and describe asset edits in PR description.
- Use report_intent before running any tool and include exact command to run in messages.
- Ask clarifying questions via ask_user when design decisions or platform tradeoffs are needed.

Common commands (examples)
- Build Windows x64: pwsh tools\build-unity.ps1 -UnityPath "%UNITY_PATH%" -Target Windows64 -BuildDir "build\Windows"
- Run headless playtests: pwsh tools\run-headless-playtests.ps1 -UnityPath "%UNITY_PATH%"

Files/dirs agents may modify: Assets/, Packages/, ProjectSettings/, tools/, .github/, AGENTS.md, README.md
