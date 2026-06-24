#!/bin/bash
# new-venture.sh — Satsuma Ventures
# Usage: ./new-venture.sh <venture-name>
# Scaffolds a new venture repo from the studio template.

set -e

VENTURE_NAME="$1"
STUDIO_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
PARENT_DIR="$(cd "$STUDIO_DIR/.." && pwd)"
TEMPLATE_CLAUDE="$STUDIO_DIR/skills/templates/CLAUDE.md"
TODAY=$(date +%Y-%m-%d)

if [ -z "$VENTURE_NAME" ]; then
  echo "Usage: ./new-venture.sh <venture-name>"
  exit 1
fi

# ── 1. Create and scaffold venture repo ──────────────────────────────────────

echo "→ Creating repo satsuma-ventures/$VENTURE_NAME..."
cd "$PARENT_DIR"
gh repo create "satsuma-ventures/$VENTURE_NAME" --public --clone
cd "$VENTURE_NAME"

echo "→ Scaffolding from studio template..."

# CLAUDE.md
sed "s/\[Venture Name\]/$VENTURE_NAME/g; s/\[venture-name\]/$VENTURE_NAME/g" \
  "$TEMPLATE_CLAUDE" > CLAUDE.md

# STATUS.md
cat > STATUS.md << STATUSEOF
# $VENTURE_NAME — Status
*Last updated: $TODAY*

**Stage:** Planted
**Current phase:** 1 — Signal
**Phase started:** $TODAY
**Last gate completed:** None
**Next gate:** Phase 1 gate — Signal Brief
**Blocking issues:** None
**Open backlog items:** 0 (0 high priority)
**Rocks:** None set
**Latest note:** Repo scaffolded. Beginning Phase 1 — Signal.
STATUSEOF

# BACKLOG.md
cat > BACKLOG.md << BACKLOGEOF
# $VENTURE_NAME — Backlog
*Maintained by \`skills/venture.md\` · Prioritized against current OKR*

---

<!-- Add backlog items using the standard format:

## [Short title]

**Phase:** [Phase number and name]
**Source:** [Specific epic, story, or step]
**Category:** \`deferred-v2\` | \`enhancement\` | \`bug-prevention\` | \`new-feature\` | \`tech-debt\`
**Description:** [What was observed and why it might be worth pursuing]
**Priority:** \`unset\`

-->
BACKLOGEOF

# README.md
cat > README.md << READMEOF
# $VENTURE_NAME

A Satsuma Ventures venture. Currently in Track 1 — Plant the Seed.

See \`STATUS.md\` for current phase and progress.
See \`CLAUDE.md\` for AI agent context.

> **Visibility:** This repo is public during Track 1 (concept validation via GitHub Pages). It will be made private at the start of Track 2.
READMEOF

# Directory structure
mkdir -p skills/1-plant
mkdir -p artifacts
mkdir -p context

# Copy PLAYBOOK.md (version-locked at scaffold time)
cp "$STUDIO_DIR/PLAYBOOK.md" PLAYBOOK.md

# Copy Phase 1 skill (version-locked at scaffold time)
cp "$STUDIO_DIR/skills/1-plant/1-signal.md" skills/1-plant/1-signal.md

# context/ README
cat > context/README.md << CONTEXTEOF
# $VENTURE_NAME — Context

Drop background materials here: articles, prior research, competitor analysis,
interview notes, or any other reference material Claude Code should be able to
read during venture work. Files in this folder are not phase artifacts — they
are inputs that inform the work.
CONTEXTEOF

echo "→ Making initial commit..."
git add .
git commit -m "chore: scaffold $VENTURE_NAME from studio template"
git push --set-upstream origin main

# ── 2. Update studio repo ─────────────────────────────────────────────────────

echo "→ Updating studio repo..."

# Create venture context folder
VENTURE_CONTEXT_DIR="$STUDIO_DIR/skills/$VENTURE_NAME"
mkdir -p "$VENTURE_CONTEXT_DIR"

cat > "$VENTURE_CONTEXT_DIR/STATUS.md" << VSTATUS
# $VENTURE_NAME — Status
*Last updated: $TODAY*

**Stage:** Planted
**Current phase:** 1 — Signal
**Phase started:** $TODAY
**Last gate completed:** None
**Next gate:** Phase 1 gate — Signal Brief
**Blocking issues:** None
**Open backlog items:** 0 (0 high priority)
**Rocks:** None set
**Latest note:** Repo scaffolded. Beginning Phase 1 — Signal.
VSTATUS

cat > "$VENTURE_CONTEXT_DIR/BACKLOG.md" << VBACKLOG
# $VENTURE_NAME — Backlog
*Maintained by \`skills/venture.md\` · Prioritized against current OKR*

---
VBACKLOG

cat > "$VENTURE_CONTEXT_DIR/retro-log.md" << VRETRO
# $VENTURE_NAME — Retrospective Log
*On-demand entries via \`skills/retro.md\` · Mode A (lightweight) appended here*

---
VRETRO

# Add venture to PLAYBOOK.md venture table
PLAYBOOK="$STUDIO_DIR/PLAYBOOK.md"
if grep -q "| $VENTURE_NAME |" "$PLAYBOOK"; then
  echo "  → $VENTURE_NAME already in PLAYBOOK.md venture table, skipping"
else
  # Insert new row before the closing of the ventures table
  # Find the last venture row and append after it
  sed -i '' "/| Corner Street Commerce | Planted |/a\\
| $VENTURE_NAME | Planted |" "$PLAYBOOK"
  echo "  → Added $VENTURE_NAME to PLAYBOOK.md venture table"
fi

# Commit studio updates
cd "$STUDIO_DIR"
git add "skills/$VENTURE_NAME/" PLAYBOOK.md
git commit -m "chore: add $VENTURE_NAME context folder and venture table entry"
git push

echo ""
echo "✓ $VENTURE_NAME scaffolded and ready"
echo ""
echo "  Venture repo:  https://github.com/Satsuma-Ventures/$VENTURE_NAME"
echo "  Studio entry:  skills/$VENTURE_NAME/"
echo ""
echo "  Next: Open the $VENTURE_NAME repo in VS Code and begin Phase 1 — Signal"
echo "        using skills/1-plant/1-signal.md"
