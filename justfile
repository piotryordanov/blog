# Justfile for blog project
# https://github.com/casey/just

# List available commands
default:
    @just --list

# Run Hugo server with drafts enabled
serve:
    @hugo server -D

# Build the site
build:
    @hugo --minify

# Create a new blog post
new-post title:
    @hugo new content posts/{{title}}.md

# Setup pre-commit hooks and dependencies
setup-pre-commit:
    @echo "🔧 Checking pre-commit installation..."
    @if ! command -v pre-commit &> /dev/null; then \
        echo "⚠️ pre-commit is not installed. Please install it first:"; \
        echo "\nRecommended installation methods:"; \
        echo "• macOS:"; \
        echo "  - Homebrew:  brew install pre-commit"; \
        echo "  - pip:      pip install --user pre-commit"; \
        echo "\n• Linux:"; \
        echo "  - apt:      sudo apt install pre-commit"; \
        echo "  - pip:      pip install --user pre-commit"; \
        echo "\n• Windows:"; \
        echo "  - pip:      pip install --user pre-commit"; \
        echo "  - conda:    conda install -c conda-forge pre-commit"; \
        echo "\nFor more information, visit: https://pre-commit.com/#installation"; \
        exit 1; \
    fi
    @echo "Installing pre-commit hooks..."
    @pre-commit install --hook-type pre-commit --hook-type commit-msg
    @echo "Running pre-commit autoupdate to get the latest versions..."
    @pre-commit autoupdate
    @echo "✅ Pre-commit setup completed!"

# Format markdown files
fmt:
    @echo "Formatting markdown files..."
    @if ! command -v prettier &> /dev/null; then \
        echo "⚠️ prettier not found. Install with: npm install -g prettier"; \
        exit 1; \
    fi
    @find . -type f -name "*.md" -exec prettier --write {} \;
    @echo "✅ Markdown files formatted!"

# Clean generated files
clean:
    @echo "Cleaning generated files..."
    @rm -rf public
    @rm -rf resources
    @echo "✅ Clean completed!"

# Deploy to Vercel (production)
deploy:
    @echo "🚀 Deploying to Vercel..."
    @if ! command -v vercel &> /dev/null; then \
        echo "⚠️ Vercel CLI not found. Install with: npm i -g vercel"; \
        exit 1; \
    fi
    @hugo --minify
    @vercel --prod .
    @echo "✅ Deployment completed!"

# Create a new release
release version:
    @echo "Creating release {{version}}..."
    @git flow release start {{version}}
    @echo "# Update version numbers if needed"
    @read -p "Press enter to continue..."
    @git flow release finish {{version}}
    @echo "✅ Release {{version}} completed!"
