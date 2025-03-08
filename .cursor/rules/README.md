# Cursor Rules Overview

This directory contains Cursor rules that enforce coding standards, workflows, and best practices across the repository.

## Available Rules

### Code Organization

- **[cursor-rules-standards.mdc](./cursor-rules-standards.mdc)**: Standards for creating and organizing Cursor rule files
- **[installation-scripts.mdc](./installation-scripts.mdc)**: Standards for creating and organizing installation scripts

### Workflow Enforcement

- **[gitflow-workflow.mdc](./gitflow-workflow.mdc)**: Enforces GitFlow branching model and Git workflow best practices
- **[conventional-commits.mdc](./conventional-commits.mdc)**: Automatically commit changes using conventional commits format
- **[rule-development-workflow.mdc](./rule-development-workflow.mdc)**: Streamlines the process of developing and testing Cursor rules
- **[rule-editing-workaround.mdc](./rule-editing-workaround.mdc)**: Enforces the workaround process for editing cursor rule files

### Comprehensive Guides

- **[cursor-rules-management.mdc](./cursor-rules-management.mdc)**: Combined guide for standards, development workflow, and editing workarounds

## Using Rules

Cursor rules are automatically applied during development. They can:

1. **Reject** changes that don't meet standards
2. **Suggest** improvements to your code
3. **Execute** helpful commands

## Creating New Rules

When creating new rules:

1. Follow the standards in [cursor-rules-standards.mdc](./cursor-rules-standards.mdc)
2. Use the workflow in [rule-development-workflow.mdc](./rule-development-workflow.mdc)
3. Follow the editing workaround in [rule-editing-workaround.mdc](./rule-editing-workaround.mdc)
4. Create rules in a dedicated feature branch
5. Add documentation about the rule in this README

## Rule Development Resources

- [Cursor Rules Documentation](https://cursor.sh/docs/rules)
- Use `cursor lint cursor/rules/your-rule.mdc` to lint your rule files
- Test rules with `cursor validate path/to/file.ext` 