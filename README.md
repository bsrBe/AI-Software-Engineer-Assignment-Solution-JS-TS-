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
- `package.json`: Project dependencies and scripts
- `package-lock.json`: Lock file for dependencies
- `.dockerignore`: Files to ignore when building the Docker image
- `README.md`: Project documentation
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

## How to Build and Run with Docker

1. **Build the Docker image**:
   ```bash
   docker build -t eskalate-assignment:1.0.0 .
   ```

2. **Run the tests in a container**:
   ```bash
   docker run eskalate-assignment:1.0.0
   ```
