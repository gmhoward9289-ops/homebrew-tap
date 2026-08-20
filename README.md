# homebrew-tap

Homebrew tap for the [swamplink](https://swamplink.com/) agent-tooling family.
Installs land from tagged GitHub Releases; this repo is the formula surface
`brew` reads — not the source of truth for each project.

```bash
brew tap gmhoward9289-ops/tap
brew install roost
brew install leghorn
brew install legbar
brew install git-roost
```

Or one-shot without a persistent tap:

```bash
brew install gmhoward9289-ops/tap/roost
brew install gmhoward9289-ops/tap/leghorn
brew install gmhoward9289-ops/tap/legbar
brew install gmhoward9289-ops/tap/git-roost
```

## Formulas

| Formula | Project | Install |
| --- | --- | --- |
| `roost` | [roost](https://github.com/gmhoward9289-ops/roost) — top for Claude Code | `brew install gmhoward9289-ops/tap/roost` |
| `leghorn` | [leghorn](https://github.com/gmhoward9289-ops/leghorn) — sessions joined to git + CI | `brew install gmhoward9289-ops/tap/leghorn` |
| `legbar` | [legbar](https://github.com/gmhoward9289-ops/legbar) — both lanes on one screen | `brew install gmhoward9289-ops/tap/legbar` |
| `git-roost` | [git-roost](https://github.com/gmhoward9289-ops/git-roost) — top for git worktrees | `brew install gmhoward9289-ops/tap/git-roost` |

Each formula points at the project's release sdist (`releases/download/v…`), not
GitHub's auto-generated archive URL, so Homebrew downloads count on the
release.

## How formulas update

Do **not** hand-edit version or sha256 here as the normal path. Each upstream
repo keeps a master copy under `packaging/*.rb`. On a tagged release, that
project's GitHub Actions job copies the formula into this tap with a freshly
computed sha256.

| Upstream master copy | Tap path |
| --- | --- |
| `roost/packaging/roost.rb` | `Formula/roost.rb` |
| `leghorn/packaging/leghorn.rb` | `Formula/leghorn.rb` |
| `legbar/packaging/legbar.rb` | `Formula/legbar.rb` |
| `git-roost/packaging/git-roost.rb` | `Formula/git-roost.rb` |

If a formula looks stuck on an old version, check the upstream release workflow
first — this tap only receives what that job pushes.

## License

Apache-2.0. Each installed tool carries its own project license; see the
upstream repos.
