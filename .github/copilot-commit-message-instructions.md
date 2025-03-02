# GitHub Copilot Commit Message Instructions

## Project Context

This is a Laravel REST API starter project that follows REST architecture principles and Laravel best practices.

## Commit Message Format

<type>(<scope>): <description>

[optional body]

[optional footer(s)]

## Types

- feat: A new feature
- fix: A bug fix
- docs: Documentation changes
- style: Code style changes (formatting, missing semi-colons, etc)
- refactor: Code refactoring
- test: Adding missing tests
- chore: Build process or auxiliary tool changes
- perf: Performance improvements

## Scopes

- api: Changes to API endpoints
- auth: Authentication related changes
- model: Database model changes
- migration: Database migration changes
- route: Route configuration changes
- middleware: Middleware changes
- config: Configuration changes
- test: Test-related changes

## Description Guidelines

- Use imperative mood ("add" not "added" or "adds")
- Don't capitalize first letter
- No period at the end
- Keep it concise (max 72 characters)
- Describe what the change does, not how it does it

## Examples

- feat(api): add user profile endpoint
- fix(auth): resolve token expiration issue
- docs(api): update API documentation
- refactor(model): improve user model relationships