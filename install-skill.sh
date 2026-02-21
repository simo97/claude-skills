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
INSTALL_ALL=false

if [ "$SKILL_NAME" = "--all" ]; then
    INSTALL_ALL=true
fi

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
    echo "       $0 --all"
    echo ""
    echo "Available skills in this repository:"
    ls -d "$SCRIPT_DIR"/*/ 2>/dev/null | xargs -n1 basename | grep -v '.git' | while read -r d; do
        [ -f "$SCRIPT_DIR/$d/SKILL.md" ] && echo "  - $d"
    done
    echo ""
    echo "Example: $0 article-to-tiktok-slides"
    echo "Example: $0 --all"
    exit 1
fi

print_header "Claude Skill Installer"

# Validate Claude skills directory
if [ ! -d "$CLAUDE_SKILLS_DIR" ]; then
    print_error "Claude skills directory not found: $CLAUDE_SKILLS_DIR"
    print_info "Make sure Claude Code is installed and configured properly."
    exit 1
fi

# Function to install a single skill
install_skill() {
    local name="$1"

    if [ ! -d "$SCRIPT_DIR/$name" ]; then
        print_error "Skill directory not found: $SCRIPT_DIR/$name"
        return 1
    fi

    if [ ! -f "$SCRIPT_DIR/$name/SKILL.md" ]; then
        print_error "SKILL.md not found in $name directory"
        return 1
    fi

    if [ -d "$CLAUDE_SKILLS_DIR/$name" ]; then
        print_info "Skill '$name' already installed. Updating..."
        rm -rf "$CLAUDE_SKILLS_DIR/$name"
    fi

    cp -r "$SCRIPT_DIR/$name" "$CLAUDE_SKILLS_DIR/"

    if [ -d "$CLAUDE_SKILLS_DIR/$name" ] && [ -f "$CLAUDE_SKILLS_DIR/$name/SKILL.md" ]; then
        print_success "Installed: $name"
        return 0
    else
        print_error "Failed to install: $name"
        return 1
    fi
}

# Install all skills
if [ "$INSTALL_ALL" = true ]; then
    echo ""
    print_info "Installing all skills..."
    echo ""

    INSTALLED=0
    FAILED=0

    while IFS= read -r skill_dir; do
        skill=$(basename "$skill_dir")
        if [ -f "$SCRIPT_DIR/$skill/SKILL.md" ]; then
            if install_skill "$skill"; then
                INSTALLED=$((INSTALLED + 1))
            else
                FAILED=$((FAILED + 1))
            fi
        fi
    done < <(ls -d "$SCRIPT_DIR"/*/ 2>/dev/null | grep -v '\.git')

    echo ""
    print_header "Installation Complete"
    print_success "$INSTALLED skill(s) installed successfully."
    [ "$FAILED" -gt 0 ] && print_error "$FAILED skill(s) failed to install."
    echo ""
    print_info "You can now use these skills in Claude Code!"
    [ "$FAILED" -gt 0 ] && exit 1 || exit 0
fi

# Single skill installation
if [ ! -d "$SCRIPT_DIR/$SKILL_NAME" ]; then
    print_error "Skill directory not found: $SCRIPT_DIR/$SKILL_NAME"
    echo ""
    echo "Available skills:"
    ls -d "$SCRIPT_DIR"/*/ 2>/dev/null | xargs -n1 basename | grep -v '.git' | while read -r d; do
        [ -f "$SCRIPT_DIR/$d/SKILL.md" ] && echo "  - $d"
    done
    exit 1
fi

print_info "Skill name: $SKILL_NAME"
print_info "Source: $SCRIPT_DIR/$SKILL_NAME"
print_info "Destination: $CLAUDE_SKILLS_DIR/$SKILL_NAME"
echo ""
print_info "Installing skill..."

if install_skill "$SKILL_NAME"; then
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
