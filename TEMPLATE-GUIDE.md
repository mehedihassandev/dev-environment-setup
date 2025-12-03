# 📝 Template System Guide

## Overview

This repository uses a **dynamic template system** for managing dates in documentation. Instead of hardcoding dates, we use placeholders that get automatically replaced with actual git commit dates.

## 🎯 How It Works

### Placeholders

Use these placeholders in any markdown file:

- `{{FIRST_COMMIT_DATE}}` - Gets replaced with the first commit date
- `{{LAST_COMMIT_DATE}}` - Gets replaced with the latest commit date

### Automatic Replacement

When you run `./update-dates.sh`, it:

1. Reads your git commit history
2. Gets the first commit date (e.g., April 18, 2024)
3. Gets the latest commit date (e.g., December 03, 2025)
4. Replaces all placeholders with actual dates

## 📚 Usage Examples

### In Documentation

```markdown
# My Project

Created: {{FIRST_COMMIT_DATE}}

This is my awesome project...

---

_Last Updated: {{LAST_COMMIT_DATE}}_
```

### After Running Script

```markdown
# My Project

Created: April 18, 2024

This is my awesome project...

---

_Last Updated: December 03, 2025_
```

## 🔄 Workflow

### 1. Write Documentation with Placeholders

```markdown
**Project Start**: {{FIRST_COMMIT_DATE}}
**Last Modified**: {{LAST_COMMIT_DATE}}
```

### 2. Make Your Changes and Commit

```bash
git add .
git commit -m "Updated documentation"
```

### 3. Run the Update Script

```bash
./update-dates.sh
```

### 4. Commit the Updated Dates

```bash
git add *.md
git commit -m "Update documentation dates"
```

## 🎨 Supported Patterns

The script supports multiple date patterns:

### Placeholder Pattern (Recommended)

```markdown
{{FIRST_COMMIT_DATE}}   # First commit
{{LAST_COMMIT_DATE}}    # Latest commit
```

### Legacy Patterns (Also Supported)

```markdown
_Last Updated: [any date]_              → Updates to latest commit
**Last Updated**: [any date]            → Updates to latest commit
**Created**: [any date]                 → Updates to first commit
```

## 💡 Best Practices

### 1. Always Use Placeholders in Source Files

✅ Good:
```markdown
_Last Updated: {{LAST_COMMIT_DATE}}_
```

❌ Bad:
```markdown
_Last Updated: December 03, 2025_
```

### 2. Run Update Script Before Pushing

```bash
# Your workflow
git add .
git commit -m "Your changes"
./update-dates.sh
git add *.md
git commit -m "Update dates"
git push
```

### 3. Keep Template Files

Consider keeping `.template.md` versions:

```bash
README.template.md  # Source with placeholders
README.md           # Generated with actual dates
```

## 🔧 Advanced Usage

### Automatic Updates with Git Hooks

Create `.git/hooks/post-commit`:

```bash
#!/bin/bash
./update-dates.sh
git add *.md
```

### CI/CD Integration

```yaml
# .github/workflows/update-dates.yml
name: Update Dates
on:
  push:
    branches: [main]

jobs:
  update:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
        with:
          fetch-depth: 0  # Get full history
      - name: Update dates
        run: |
          ./update-dates.sh
          git config user.name "GitHub Actions"
          git config user.email "actions@github.com"
          git add *.md
          git commit -m "Update documentation dates" || exit 0
          git push
```

## 📋 Files Using Templates

Current files using dynamic dates:

- `README.md`
- `STRUCTURE.md`
- `SCRIPTS.md`
- `SCRIPTS-REFERENCE.md`
- `PROJECT-SUMMARY.md`
- `FINAL-SUMMARY.md`
- `GETTING-STARTED.md`
- `QUICKSTART.md`
- `CUSTOMIZATION.md`

## 🔍 Verifying Placeholders

### Check for Placeholders

```bash
grep -r "{{.*_DATE}}" *.md
```

### Check for Hardcoded Dates

```bash
# This should return empty after using placeholders
grep -E "[A-Z][a-z]+ [0-9]{1,2}, [0-9]{4}" *.md
```

## 🎯 Example Workflow

### Initial Setup

```bash
# 1. Replace hardcoded dates with placeholders
sed -i 's/December 03, 2025/{{LAST_COMMIT_DATE}}/g' *.md

# 2. Run update script
./update-dates.sh

# 3. Commit
git add *.md
git commit -m "Switch to dynamic date system"
```

### Daily Usage

```bash
# Just run after any commits
./update-dates.sh
```

## 🏆 Benefits

✅ **Always Accurate** - Dates come from git, the source of truth
✅ **Never Forget** - Can't forget to update dates
✅ **Consistent** - All dates use the same format
✅ **Automated** - One command updates everything
✅ **Git-based** - No external dependencies

## 🐛 Troubleshooting

### Placeholders Not Replaced

```bash
# Check if placeholders exist
grep "{{" README.md

# Run script with verbose output
bash -x ./update-dates.sh
```

### Wrong Dates

```bash
# Verify git history
git log --oneline --reverse  # First commit
git log -1 --oneline         # Latest commit
```

### Script Errors

```bash
# Ensure you're in a git repository
git status

# Check script permissions
chmod +x update-dates.sh
```

## 📚 Related Documentation

- [README.md](README.md) - Main documentation
- [SCRIPTS.md](SCRIPTS.md) - All scripts documentation
- [update-dates.sh](update-dates.sh) - The update script

---

**System Status**: Active ✅
**Template Version**: 1.0
**Last Updated**: {{LAST_COMMIT_DATE}}
