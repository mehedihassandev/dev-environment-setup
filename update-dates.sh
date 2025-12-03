#!/bin/bash

# Update Dates Script - Dynamic Version
# This script replaces date placeholders with actual git commit dates
# Placeholders: {{FIRST_COMMIT_DATE}} and {{LAST_COMMIT_DATE}}

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔄 Updating dates in documentation (dynamic from git)...${NC}\n"

# Get the latest commit date (for Last Updated)
LATEST_DATE=$(git log -1 --format="%cd" --date=format:"%B %d, %Y" 2>/dev/null)
LATEST_HASH=$(git log -1 --format="%h" 2>/dev/null)

# Get the first commit date (for Created)
FIRST_DATE=$(git log --reverse --format="%cd" --date=format:"%B %d, %Y" 2>/dev/null | head -1)
FIRST_HASH=$(git log --reverse --format="%h" 2>/dev/null | head -1)

# Check if we're in a git repository
if [ -z "$LATEST_DATE" ]; then
    echo -e "${RED}✗${NC} Not in a git repository or no commits found"
    echo "This script requires git commit history to work."
    exit 1
fi

echo -e "${CYAN}📅 Git Commit History:${NC}"
echo -e "   First commit:  $FIRST_HASH - $FIRST_DATE"
echo -e "   Latest commit: $LATEST_HASH - $LATEST_DATE"
echo ""

# Counter for updates
updated_count=0

# List of documentation files to update
FILES=(
    "README.md"
    "QUICKSTART.md"
    "CUSTOMIZATION.md"
    "SCRIPTS.md"
    "SCRIPTS-REFERENCE.md"
    "STRUCTURE.md"
    "PROJECT-SUMMARY.md"
    "GETTING-STARTED.md"
    "FINAL-SUMMARY.md"
)

# Function to update placeholders in a file
update_file_placeholders() {
    local file=$1

    if [ ! -f "$file" ]; then
        return 0
    fi

    local changes_made=0

    # Check if file contains placeholders
    if grep -q "{{FIRST_COMMIT_DATE}}" "$file" || grep -q "{{LAST_COMMIT_DATE}}" "$file"; then
        # Create temporary file
        local temp_file="${file}.tmp"

        # Replace placeholders
        sed "s/{{FIRST_COMMIT_DATE}}/$FIRST_DATE/g" "$file" | \
        sed "s/{{LAST_COMMIT_DATE}}/$LATEST_DATE/g" > "$temp_file"

        # Move temp file to original
        mv "$temp_file" "$file"

        echo -e "${GREEN}✓${NC} Updated placeholders in: $file"
        changes_made=1
    fi

    # Also handle existing date patterns for backward compatibility
    if grep -q "_Last Updated:" "$file" || grep -q "Last Updated" "$file" || grep -q "Created" "$file"; then
        # Update "Last Updated" patterns
        if grep -q "_Last Updated:" "$file"; then
            if [[ "$OSTYPE" == "darwin"* ]]; then
                sed -i '' "s/_Last Updated:.*_/_Last Updated: $LATEST_DATE_/g" "$file"
            else
                sed -i "s/_Last Updated:.*_/_Last Updated: $LATEST_DATE_/g" "$file"
            fi
            changes_made=1
        fi

        if grep -q "Last Updated" "$file"; then
            if [[ "$OSTYPE" == "darwin"* ]]; then
                sed -i '' "s/\*\*Last Updated\*\*:.*/\*\*Last Updated\*\*: $LATEST_DATE/g" "$file" 2>/dev/null
            else
                sed -i "s/\*\*Last Updated\*\*:.*/\*\*Last Updated\*\*: $LATEST_DATE/g" "$file" 2>/dev/null
            fi
            changes_made=1
        fi

        # Update "Created" patterns
        if grep -q "Created" "$file" && grep -q "\*\*" "$file"; then
            if [[ "$OSTYPE" == "darwin"* ]]; then
                sed -i '' "s/\*\*Created\*\*:.*/\*\*Created\*\*: $FIRST_DATE/g" "$file" 2>/dev/null
            else
                sed -i "s/\*\*Created\*\*:.*/\*\*Created\*\*: $FIRST_DATE/g" "$file" 2>/dev/null
            fi
            changes_made=1
        fi

        if [ $changes_made -eq 1 ]; then
            echo -e "${GREEN}✓${NC} Updated date patterns in: $file"
        fi
    fi

    return $changes_made
}

echo -e "${BLUE}📝 Processing files...${NC}\n"

# Update each file
for file in "${FILES[@]}"; do
    if update_file_placeholders "$file"; then
        ((updated_count++))
    fi
done

echo ""

# Summary
if [ $updated_count -gt 0 ]; then
    echo -e "${GREEN}✅ Successfully updated dates in $updated_count file(s)${NC}"
    echo ""
    echo -e "📅 ${CYAN}Applied dates:${NC}"
    echo -e "   Created (First commit):  $FIRST_DATE"
    echo -e "   Last Updated (Latest):   $LATEST_DATE"
    echo ""
    echo -e "${BLUE}💡 Tip:${NC} Use placeholders in your markdown files:"
    echo -e "   {{FIRST_COMMIT_DATE}}  → Gets replaced with: $FIRST_DATE"
    echo -e "   {{LAST_COMMIT_DATE}}   → Gets replaced with: $LATEST_DATE"
    echo ""
    echo -e "${YELLOW}📝 Note:${NC} Commit these changes:"
    echo -e "   git add *.md"
    echo -e "   git commit -m 'Update documentation dates'"
else
    echo -e "${YELLOW}ℹ️  No date placeholders or patterns found to update${NC}"
    echo ""
    echo -e "${BLUE}💡 Tip:${NC} Add placeholders to your markdown files:"
    echo -e "   _Last Updated: {{LAST_COMMIT_DATE}}_"
    echo -e "   **Created**: {{FIRST_COMMIT_DATE}}"
fi

echo ""
