<script setup lang="ts">
import type { SettingsPreferences } from '~/plugins/settings.client'
import { defaultSettings } from '~/plugins/settings.client'

interface SettingsPlugin {
  settings: Ref<SettingsPreferences>
  applySettings: () => void
}

const authStore = useAuthStore()
const settingsPlugin = useNuxtApp().$settings as SettingsPlugin | undefined
const settings = ref<SettingsPreferences>({ ...defaultSettings })

const themeOptions = [
  { label: 'Light', value: 'light' },
  { label: 'Dark', value: 'dark' },
]

const fontOptions = [
  { label: 'Inter', value: 'inter' },
  { label: 'DM Sans', value: 'dm-sans' },
  { label: 'Fraunces', value: 'fraunces' },
]

onMounted(() => {
  settings.value = { ...(settingsPlugin?.settings.value ?? defaultSettings) }
  settingsPlugin?.applySettings()
  applyRememberMe(Boolean(settings.value.keepLoggedIn), authStore)
})

watch(settings, (value) => {
  if (settingsPlugin?.settings) {
    settingsPlugin.settings.value = value
  }

  settingsPlugin?.applySettings()
  applyRememberMe(Boolean(value.keepLoggedIn), authStore)
}, { deep: true })

function applyRememberMe(keepLoggedIn: boolean, authStore: ReturnType<typeof useAuthStore>) {
  const token = authStore.token

  if (typeof token === 'string' && token.length > 0) {
    authStore.setToken(token, keepLoggedIn)
  }
}
</script>

<template>
  <div class="min-h-screen bg-[var(--color-bg)] px-4 py-8 text-[var(--color-text)]">
    <div class="mx-auto flex max-w-5xl flex-col gap-6">
      <section class="rounded-[24px] border border-[var(--color-border)] bg-[var(--color-surface)] p-6 shadow-[0_16px_40px_rgba(15,23,42,0.08)]">
        <p class="mb-2 text-sm font-semibold uppercase tracking-[0.24em] text-[var(--accent)]">Preferences</p>
        <h1 class="text-3xl font-semibold">Make LunchCor feel like home</h1>
        <p class="mt-3 max-w-2xl text-sm text-[var(--color-text-muted)]">
          These choices are saved across the app so your theme, font, and compact layout stay consistent everywhere.
        </p>
      </section>

      <div class="grid gap-6 lg:grid-cols-[1.1fr_0.9fr]">
        <section class="rounded-[24px] border border-[var(--color-border)] bg-[var(--color-surface-strong)] p-6 shadow-[0_16px_40px_rgba(15,23,42,0.08)]">
          <form class="space-y-5" @submit.prevent>
            <label class="flex flex-col gap-2 text-sm font-medium">
              <span>Theme</span>
              <select v-model="settings.theme" class="rounded-xl border border-[var(--color-border)] bg-[var(--color-surface)] px-3 py-2">
                <option v-for="option in themeOptions" :key="option.value" :value="option.value">
                  {{ option.label }}
                </option>
              </select>
            </label>

            <label class="flex flex-col gap-2 text-sm font-medium">
              <span>Font</span>
              <select v-model="settings.font" class="rounded-xl border border-[var(--color-border)] bg-[var(--color-surface)] px-3 py-2">
                <option v-for="option in fontOptions" :key="option.value" :value="option.value">
                  {{ option.label }}
                </option>
              </select>
            </label>

            <label class="flex items-center justify-between rounded-2xl border border-[var(--color-border)] bg-[var(--color-surface)] px-4 py-3 text-sm">
              <span>Compact mode</span>
              <input v-model="settings.compactMode" type="checkbox" class="h-4 w-4 rounded border-[var(--color-border)]" />
            </label>

            <label class="flex items-center justify-between rounded-2xl border border-[var(--color-border)] bg-[var(--color-surface)] px-4 py-3 text-sm">
              <span>Keep me logged in</span>
              <input v-model="settings.keepLoggedIn" type="checkbox" class="h-4 w-4 rounded border-[var(--color-border)]" />
            </label>
          </form>
        </section>

        <section class="rounded-[24px] border border-[var(--color-border)] bg-[var(--color-surface)] p-6 shadow-[0_16px_40px_rgba(15,23,42,0.08)]">
          <p class="text-sm font-semibold uppercase tracking-[0.22em] text-[var(--color-text-muted)]">Preview</p>
          <div class="mt-4 rounded-[20px] border border-[var(--color-border)] bg-[var(--color-surface-strong)] p-4">
            <div class="flex items-center justify-between">
              <div>
                <p class="text-lg font-semibold">LunchCor</p>
                <p class="text-sm text-[var(--color-text-muted)]">A polished, calmer lunch experience</p>
              </div>
              <span class="rounded-full bg-[var(--color-accent)]/15 px-3 py-1 text-sm font-semibold text-[var(--accent)]">
                {{ settings.theme === 'dark' ? 'Dark' : 'Light' }} theme
              </span>
            </div>
            <div class="mt-4 rounded-2xl border border-[var(--color-border)] bg-[var(--color-surface)] p-3 text-sm text-[var(--color-text-muted)]">
              Your selections are applied instantly and persist as you move between pages.
            </div>
          </div>
        </section>
      </div>
    </div>
  </div>
</template>

