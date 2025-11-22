# Contributing to Accessibility Everywhere

Thank you for your interest in contributing! This project aims to make the web accessible to everyone, and your help is invaluable.

## Code of Conduct

This project follows a Code of Conduct that all contributors are expected to uphold. Please be respectful, inclusive, and constructive in all interactions.

## How to Contribute

### Reporting Bugs

If you find a bug, please create an issue with:
- Clear title and description
- Steps to reproduce
- Expected vs actual behavior
- Screenshots if applicable
- Your environment (OS, browser, versions)

### Suggesting Features

Feature requests are welcome! Please:
- Check existing issues first
- Describe the problem you're solving
- Explain your proposed solution
- Consider accessibility implications

### Pull Requests

1. **Fork the repository**
   ```bash
   git clone https://github.com/accessibility-everywhere/accessibility-everywhere
   cd accessibility-everywhere
   git checkout -b feature/your-feature-name
   ```

2. **Install dependencies**
   ```bash
   npm install
   docker-compose up -d
   ```

3. **Make your changes**
   - Follow existing code style
   - Add tests for new functionality
   - Update documentation
   - Ensure accessibility compliance

4. **Test your changes**
   ```bash
   npm test
   npm run build
   ```

5. **Commit with clear messages**
   ```bash
   git commit -m "feat: add new accessible component"
   ```

   Use conventional commits:
   - `feat:` New feature
   - `fix:` Bug fix
   - `docs:` Documentation
   - `style:` Formatting
   - `refactor:` Code restructuring
   - `test:` Adding tests
   - `chore:` Maintenance

6. **Push and create PR**
   ```bash
   git push origin feature/your-feature-name
   ```

## Development Setup

### Prerequisites
- Node.js 18+
- Docker & Docker Compose
- Git

### Local Development
```bash
# Clone repository
git clone https://github.com/accessibility-everywhere/accessibility-everywhere
cd accessibility-everywhere

# Install dependencies
npm install

# Start services
docker-compose up -d

# Build packages
npm run build --workspaces

# Run tests
npm test --workspaces
```

### Project Structure
```
accessibility-everywhere/
├── packages/          # Shared packages
│   ├── core/         # ArangoDB models
│   └── scanner/      # Accessibility scanner
├── tools/            # User-facing tools
│   ├── browser-extension/
│   ├── testing-dashboard/
│   ├── monitoring-api/
│   ├── github-action/
│   ├── cli/
│   └── wordpress-plugin/
├── components/       # UI component libraries
└── docs/            # Documentation
```

## Coding Standards

### Accessibility First
**EVERY contribution must be accessible.** This means:
- Semantic HTML
- ARIA labels where needed
- Keyboard navigation
- Screen reader compatible
- Sufficient color contrast
- Clear focus indicators

### TypeScript
- Use strict mode
- Export types
- Document complex types
- Avoid `any`

### React Components
- Use functional components with hooks
- Forward refs for interactive elements
- Proper ARIA attributes
- Focus management
- Keyboard handlers

### API Design
- RESTful endpoints
- Clear error messages
- Input validation
- Rate limiting
- Security headers

### Testing
- Unit tests for logic
- Integration tests for API
- Accessibility tests with axe-core
- Manual testing with screen readers

## Accessibility Testing

### Required Tools
- axe DevTools browser extension
- Screen reader (NVDA, JAWS, or VoiceOver)
- Keyboard-only navigation

### Testing Checklist
Before submitting:
- [ ] Keyboard navigation works
- [ ] Screen reader announces properly
- [ ] Color contrast meets WCAG AA
- [ ] Focus indicators visible
- [ ] ARIA attributes correct
- [ ] No accessibility errors in axe
- [ ] Tested with actual screen reader

## Documentation

- Update README if adding features
- Add JSDoc comments to code
- Update TypeScript types
- Include usage examples
- Document breaking changes

## Commit Messages

Use conventional commits:

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Example:**
```
feat(scanner): add WCAG 2.2 criteria support

Implements new WCAG 2.2 success criteria for accessibility
scanning. Updates violation mapping and scoring algorithm.

Closes #123
```

## Review Process

1. **Automated checks run**
   - Lint and format
   - Type checking
   - Tests
   - Build verification

2. **Accessibility review**
   - WCAG compliance
   - Screen reader testing
   - Keyboard navigation

3. **Code review**
   - Code quality
   - Architecture fit
   - Documentation
   - Tests coverage

4. **Approval and merge**
   - Requires 1+ approving review
   - All checks passing
   - Up-to-date with main

## Getting Help

- **Documentation**: [accessibility-everywhere.org/docs](https://accessibility-everywhere.org/docs)
- **Discussions**: [GitHub Discussions](https://github.com/accessibility-everywhere/discussions)
- **Discord**: [Join our community](https://discord.gg/accessibility-everywhere)
- **Email**: [hello@accessibility-everywhere.org](mailto:hello@accessibility-everywhere.org)

## Recognition

Contributors are recognized in:
- README.md contributors section
- Release notes
- Website credits page

Significant contributors may be invited to join the core team.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Remember**: This project is about making the web accessible to everyone. Every contribution, no matter how small, helps achieve that goal. Thank you for being part of this mission! 🌐♿️
