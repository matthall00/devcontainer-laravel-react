# Laravel + React Monorepo with Dev Containers

This repository combines a Laravel API backend with a React frontend in a single monorepo, configured to work with VS Code Dev Containers.

## Prerequisites

- Docker Desktop
- Visual Studio Code
- Dev Containers extension for VS Code

## Structure

- `/api` - Laravel backend
- `/client` - React frontend
- `/.devcontainer` - Development container configuration

## Quick Start

1. Clone this repository
2. Open in VS Code
3. When prompted "Reopen in Container", click "Reopen"
4. Wait for container build and initialization scripts
5. Follow the prompts for Git configuration and package installation

## Development

Start the backend:
```bash
cd api
php artisan serve --host=0.0.0.0 --port=8000
```

Start the frontend:
```bash
cd client
npm run dev
```

Access your applications:
- API: http://localhost:8000
- Frontend: http://localhost:3000

## Testing the Setup

1. Test Backend:
```bash
cd api
php artisan serve --host=0.0.0.0 --port=8000
# In another terminal:
curl http://localhost:8000/api/test
# Should return: {"status":"ok"}
```

2. Test Frontend:
```bash
cd client
npm run dev
# Visit http://localhost:3000 in browser
```

3. Test Database:
```bash
cd api
php artisan migrate:status
```

## Troubleshooting

If you encounter permission issues:
```bash
sudo chown -R vscode:vscode /workspace
chmod +x .devcontainer/scripts/*.sh
```

For database connection issues:
1. Check .env file in /api
2. Verify MySQL service is running
3. Default credentials:
   - DB_HOST=db
   - DB_DATABASE=laravel
   - DB_USERNAME=laravel
   - DB_PASSWORD=secret
