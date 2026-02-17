# AI Software Engineer Assignment (JS/TS) - Solution

This repository contains the solution for the AI Software Engineer assignment. It includes a custom HTTP client with OAuth2 token handling, a containerized test environment, and a fix for the identified token refresh bug.

## Prerequisites
- [Node.js](https://nodejs.org/) (v18 or higher)
- [Docker](https://www.docker.com/) (optional, for containerized testing)

## Project Structure
- `src/`: Core logic (HttpClient and OAuth2Token)
- `tests/`: Vitest test suite
- `Dockerfile`: Container configuration for CI-style execution
- `Explanation.md`: Detailed analysis of the fixed bug
```text
.
├── Dockerfile
├── package.json
├── package-lock.json (Ignored by git)
├── README.md
├── src
│   ├── httpClient.ts
│   └── tokens.ts
└── tests
    └── httpClient.test.ts
```

## How to Run Tests Locally

1. **Install dependencies**:
   ```bash
   npm install
   ```

2. **Run tests**:
   ```bash
   npm test 
   ```
