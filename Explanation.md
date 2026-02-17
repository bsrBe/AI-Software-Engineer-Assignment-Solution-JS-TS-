# Bug Fix Explanation

## 1. What was the bug?

The `HttpClient` did not attach the `Authorization` header and did not trigger token refresh when `oauth2Token` was provided as a plain JavaScript object instead of an `OAuth2Token` class instance.

## 2. Why did it happen?

The implementation relied on the type checking of `instanceof OAuth2Token` and it's Expiration to determine whether the token required refreshing or not. However, the `TokenState` type allowed plain objects. Since plain objects are not class instances, they failed the `instanceof` check. As a result, the refresh logic was skipped and the token was also not added to request headers.

## 3. Why does the fix solve it?

The fix updates the condition to: `!isOAuth2 || (this.oauth2Token instanceof OAuth2Token && this.oauth2Token.expired)`. This ensures that any token state that isn't a valid, non-expired class instance triggers a refresh. Since `refreshOAuth2()` always generates a proper `OAuth2Token` instance, the subsequent header attachment logic (which also checks `instanceof`) will now correctly handle what were previously "plain object" tokens.
## 4. Test case I have added

```typescript
  test("api=true refreshes when token is expired", () => {
    const c = new HttpClient();
    c.oauth2Token = new OAuth2Token("expired-token", Math.floor(Date.now() / 1000) - 3600);

    const resp = c.request("GET", "/me", { api: true });

    expect(resp.headers.Authorization).toBe("Bearer fresh-token");
  });
```
this was added to the test cases to check if the token is expired and needs to be refreshed which oreviousy was absent 

## 5. Edge case not covered

While the tests cover the cases of missing tokens, plain objects, and expired class instances, we still don't cover:
- **Network Failure during Refresh**: If the `refreshOAuth2()` call (simulating an API call) fails due to network issues, the client currently lacks error handling to inform the caller.
