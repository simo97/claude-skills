#!/bin/bash

# Claude Skill Installation Script
# Installs a skill from this repository to Claude Code's skill directory

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_SKILLS_DIR="${HOME}/.claude/skills"
SKILL_NAME="${1:-}"

# Function to print colored output
print_header() {
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${YELLOW}ℹ $1${NC}"
}

# Show usage if no skill name provided
if [ -z "$SKILL_NAME" ]; then
    echo "Usage: $0 <skill-name>"
    echo ""
    echo "Available skills in this repository:"
    ls -d */ | sed 's#/##g' | grep -v '.git' | sed 's/^/  - /'
    echo ""
    echo "Example: $0 article-to-tiktok-slides"
    exit 1
fi

print_header "Claude Skill Installer"

# Check if skill directory exists in repository
if [ ! -d "$SCRIPT_DIR/$SKILL_NAME" ]; then
    print_error "Skill directory not found: $SCRIPT_DIR/$SKILL_NAME"
    echo ""
    echo "Available skills:"
    ls -d "$SCRIPT_DIR"/*/ 2>/dev/null | xargs -n1 basename | grep -v '.git' | sed 's/^/  - /'
    exit 1
fi

# Check if SKILL.md exists
if [ ! -f "$SCRIPT_DIR/$SKILL_NAME/SKILL.md" ]; then
    print_error "SKILL.md not found in $SKILL_NAME directory"
    exit 1
fi

print_info "Skill name: $SKILL_NAME"
print_info "Source: $SCRIPT_DIR/$SKILL_NAME"
print_info "Destination: $CLAUDE_SKILLS_DIR/$SKILL_NAME"

# Create destination directory if it doesn't exist
if [ ! -d "$CLAUDE_SKILLS_DIR" ]; then
    print_error "Claude skills directory not found: $CLAUDE_SKILLS_DIR"
    print_info "Make sure Claude Code is installed and configured properly."
    exit 1
fi

# Check if skill already exists
if [ -d "$CLAUDE_SKILLS_DIR/$SKILL_NAME" ]; then
    print_info "Skill already installed. Updating..."
    rm -rf "$CLAUDE_SKILLS_DIR/$SKILL_NAME"
fi

# Copy skill to Claude skills directory
echo ""
print_info "Installing skill..."
cp -r "$SCRIPT_DIR/$SKILL_NAME" "$CLAUDE_SKILLS_DIR/"

# Verify installation
if [ -d "$CLAUDE_SKILLS_DIR/$SKILL_NAME" ] && [ -f "$CLAUDE_SKILLS_DIR/$SKILL_NAME/SKILL.md" ]; then
    echo ""
    print_header "Installation Successful"
    print_success "Skill installed successfully!"
    echo ""
    echo "Skill details:"
    grep "^name:" "$CLAUDE_SKILLS_DIR/$SKILL_NAME/SKILL.md" | sed 's/name: /  Name: /'
    grep "^description:" "$CLAUDE_SKILLS_DIR/$SKILL_NAME/SKILL.md" | sed 's/description: /  Description: /' | fold -w 70 -s | sed 's/^/    /'
    echo ""
    print_info "You can now use this skill in Claude Code!"
    exit 0
else
    echo ""
    print_error "Installation failed. Please check permissions and try again."
    exit 1
fi
