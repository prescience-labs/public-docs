# Authentication + Authorization Service

::: tip Dev URL
[https://data-intel-auth-dev.herokuapp.com](https://data-intel-auth-dev.herokuapp.com)
:::

## Getting Started

The auth service is responsible for global authentication and providing role-based permissions for individual services to consume in order to implement service-level authorization.

That's a mouthful.

Basically, the auth service lets a user obtain an authorization token which can then be used to authenticate and authorize against all other services. This auth token (a JWT in the `Authorization` header) contains only a user's ID. It expires after a certain period (the expiration time is identified by the `exp` field in the payload) and can be refreshed by the auth service.

## Concepts

### Valid tokens

User tokens are valid only when the following conditions are met:

- The JWT is valid
  - Not expired
  - Signed with the correct secret
- The user's token revocation timestamp is before the `iat` date on the JWT

## How To:

### Create a user

```json
// POST /v1/users

{
  "email": "string",
  "password": "string"
}
```

### Obtain an access token

```json
// POST /v1/auth/token

{
  "email": "string",
  "password": "string"
}
```

### Refresh a token

```json
// POST /v1/auth/token/refresh

{
  "token": "string"
}
```

## Reference
