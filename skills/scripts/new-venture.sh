#!/bin/bash
# new-venture.sh — Satsuma Ventures
# Usage: ./new-venture.sh <venture-name>
# Scaffolds a new venture repo from the studio template.

set -e

VENTURE_NAME="$1"
STUDIO_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
TEMPLATE_CLAUDE="$STUDIO_DIR/skills/templates/CLAUDE.md"
TODAY=$(date +%Y-%m-%d)

if [ -z "$VENTURE_NAME" ]; then
  echo "Usage: ./new-venture.sh <venture-name>"
  exit 1
fi

echo "→ Creating repo satsuma-ventures/$VENTURE_NAME..."
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

# skills/ directory stub
mkdir -p skills

echo "→ Making initial commit..."
git add .
git commit -m "chore: scaffold $VENTURE_NAME from studio template"
git push --set-upstream origin main

echo "✓ $VENTURE_NAME scaffolded and pushed to satsuma-ventures/$VENTURE_NAME"
echo ""
echo "Next steps:"
echo "  1. Add $VENTURE_NAME to PLAYBOOK.md venture table in the studio repo"
echo "  2. Create skills/$VENTURE_NAME/ context folder in the studio repo"
echo "  3. Begin Phase 1 — Signal using skills/1-plant/1-signal.md"
