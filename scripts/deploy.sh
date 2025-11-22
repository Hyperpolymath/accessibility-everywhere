#!/bin/bash

# Deployment script for Accessibility Everywhere
# Usage: ./scripts/deploy.sh [environment]

set -e

ENVIRONMENT=${1:-production}

echo "🚀 Deploying Accessibility Everywhere to $ENVIRONMENT"
echo "================================================"

# Build packages
echo "📦 Building packages..."
npm run build --workspaces

# Build Docker images
echo "🐳 Building Docker images..."
docker-compose build

# Run database migrations
echo "🗄️ Setting up database..."
node scripts/setup-arangodb.js

# Deploy based on environment
case $ENVIRONMENT in
  production)
    echo "🌐 Deploying to production..."
    # Add production deployment commands here
    # docker-compose -f docker-compose.prod.yml up -d
    ;;

  staging)
    echo "🧪 Deploying to staging..."
    # Add staging deployment commands here
    ;;

  development)
    echo "💻 Starting development environment..."
    docker-compose up -d
    ;;

  *)
    echo "❌ Unknown environment: $ENVIRONMENT"
    exit 1
    ;;
esac

echo ""
echo "✅ Deployment complete!"
echo ""
echo "Services:"
echo "- Dashboard: http://localhost:8080"
echo "- API: http://localhost:3000"
echo "- ArangoDB: http://localhost:8529"
