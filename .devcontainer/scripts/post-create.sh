#!/bin/bash

echo "🚀 Running post-create setup..."

# Git Configuration
echo "Configure Git settings:"
read -p "Enter your Git name: " gitname
read -p "Enter your Git email: " gitemail

git config --global --add safe.directory /workspace
git config --global init.defaultBranch main
git config --global user.name "$gitname"
git config --global user.email "$gitemail"

read -p "Enter new Git remote URL (leave blank to skip): " -r newRemote
if [ ! -z "$newRemote" ]; then
    git remote set-url origin "$newRemote"
fi

# Create Laravel project if it doesn't exist
if [ ! -d "/workspace/api" ]; then
    echo "📦 Creating new Laravel project..."
    composer create-project laravel/laravel api
    cd api
    composer install
    cp .env.example .env
    php artisan key:generate
    
    # Optional Laravel packages
    echo -e "\n=== Optional Package Installation ===\n"
    
    read -p "Install Sanctum for API auth? (y/n): " -r sanctum
    if [[ $sanctum =~ ^[Yy]$ ]]; then
        composer require laravel/sanctum
        php artisan vendor:publish --provider="Laravel\Sanctum\SanctumServiceProvider"
    fi
    
    read -p "Install Telescope for debugging? (y/n): " -r telescope
    if [[ $telescope =~ ^[Yy]$ ]]; then
        composer require laravel/telescope --dev
        php artisan telescope:install
        php artisan migrate
    fi
    
    bash /scripts/strip-frontend.sh

    # Test database connection
    echo "Testing database connection..."
    php artisan migrate:status || exit 1
    
fi

# Create React project if it doesn't exist
if [ ! -d "/workspace/client" ]; then
    echo "📦 Creating new React project..."
    cd /workspace
    npm create vite@latest client -- --template react-ts
    cd client
    npm install
    
    # Configure package.json scripts
    node -e '
        const pkg = require("./package.json");
        pkg.scripts = {
            "dev": "vite --port 3000 --host",
            "build": "tsc -b && vite build",
            "lint": "eslint .",
            "preview": "vite preview"
        };
        require("fs").writeFileSync("package.json", JSON.stringify(pkg, null, 2) + "\n");
    '
    
    # Install common frontend packages
    npm install react-router-dom@7 @tanstack/react-query formik yup @tailwindcss/forms
    npm install -D tailwindcss postcss autoprefixer @types/node
    
    # Initialize Tailwind CSS
    npx tailwindcss init -p
fi

echo "✅ Post-create setup complete!"
