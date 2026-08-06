import test from 'node:test'
import assert from 'node:assert/strict'
import { resolveAuthGuardState } from './auth-guard.ts'

test('redirects unauthenticated users away from protected routes', () => {
  const result = resolveAuthGuardState({
    path: '/settings',
    token: null,
    profile: null,
  })

  assert.equal(result.shouldRedirectToLogin, true)
  assert.equal(result.authenticated, false)
})

test('allows authenticated admins through the admin guard', () => {
  const result = resolveAuthGuardState({
    path: '/admin',
    token: 'token',
    profile: { admin: true },
  })

  assert.equal(result.authenticated, true)
  assert.equal(result.isAdminAccessAllowed, true)
})

test('does not require login on public auth routes', () => {
  const result = resolveAuthGuardState({
    path: '/login',
    token: null,
    profile: null,
  })

  assert.equal(result.shouldRedirectToLogin, false)
})
