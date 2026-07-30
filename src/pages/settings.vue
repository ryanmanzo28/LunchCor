<script setup lang="ts">
import type { SettingsPreferences } from '~/plugins/settings.client'
import { defaultSettings } from '~/plugins/settings.client'

const formContainer = ref<HTMLElement | null>(null)

onMounted(() => {
  if (!formContainer.value) {
    return
  }

  const authStore = useAuthStore()
  const settingsPlugin = useNuxtApp().$settings as { applySettings: () => void } | undefined
  const settingsCookie = useCookie<SettingsPreferences>('settings', {
    default: () => ({ ...defaultSettings }),
    sameSite: 'lax',
    path: '/',
  })

  const form = document.createElement('form')
  form.noValidate = true

  const themeLabel = createFieldLabel('Theme')
  const themeSelect = createSelect(
    ['light', 'dark'],
    ['Light', 'Dark'],
    settingsCookie.value.theme || 'light',
  )
  themeSelect.addEventListener('change', () => {
    const nextTheme = themeSelect.value
    settingsCookie.value = { ...settingsCookie.value, theme: nextTheme }
    settingsPlugin?.applySettings()
  })
  themeLabel.appendChild(themeSelect)

  const fontLabel = createFieldLabel('Font')
  const fontSelect = createSelect(
    ['inter', 'dm-sans', 'fraunces'],
    ['Inter', 'DM Sans', 'Fraunces'],
    settingsCookie.value.font || 'inter',
  )
  fontSelect.addEventListener('change', () => {
    const nextFont = fontSelect.value
    settingsCookie.value = { ...settingsCookie.value, font: nextFont }
    settingsPlugin?.applySettings()
  })
  fontLabel.appendChild(fontSelect)

  const compactLabel = createFieldLabel('Compact mode')
  const compactCheckbox = document.createElement('input')
  compactCheckbox.type = 'checkbox'
  compactCheckbox.checked = Boolean(settingsCookie.value.compactMode)
  compactCheckbox.addEventListener('change', () => {
    const compactMode = compactCheckbox.checked
    settingsCookie.value = { ...settingsCookie.value, compactMode }
    settingsPlugin?.applySettings()
  })
  compactLabel.appendChild(compactCheckbox)

  const keepLoggedInLabel = createFieldLabel('Keep me logged in')
  const keepLoggedInCheckbox = document.createElement('input')
  keepLoggedInCheckbox.type = 'checkbox'
  keepLoggedInCheckbox.checked = Boolean(settingsCookie.value.keepLoggedIn)
  keepLoggedInCheckbox.addEventListener('change', () => {
    const keepLoggedIn = keepLoggedInCheckbox.checked
    applyRememberMe(keepLoggedIn, authStore)
    settingsCookie.value = { ...settingsCookie.value, keepLoggedIn }
    settingsPlugin?.applySettings()
  })
  keepLoggedInLabel.appendChild(keepLoggedInCheckbox)

  form.append(themeLabel, fontLabel, compactLabel, keepLoggedInLabel)
  formContainer.value.replaceChildren(form)

  settingsPlugin?.applySettings()
  applyRememberMe(Boolean(settingsCookie.value.keepLoggedIn), authStore)
})

function createFieldLabel(labelText: string) {
  const label = document.createElement('label')
  label.textContent = labelText
  label.style.display = 'flex'
  label.style.flexDirection = 'column'
  label.style.gap = '0.35rem'
  label.style.marginBottom = '0.75rem'
  return label
}

function createSelect(values: string[], labels: string[], selectedValue: string) {
  const select = document.createElement('select')
  values.forEach((value, index) => {
    const option = document.createElement('option')
    option.value = value
    const labelText = labels[index] ?? value
    option.textContent = String(labelText)
    if (value === selectedValue) {
      option.selected = true
    }
    select.appendChild(option)
  })
  return select
}

function applyRememberMe(keepLoggedIn: boolean, authStore: ReturnType<typeof useAuthStore>) {
  const token = authStore.token

  if (typeof token === 'string' && token.length > 0) {
    authStore.setToken(token, keepLoggedIn)
  }
}
</script>

<template>
  <div class="min-h-screen px-4 py-8">
    <div ref="formContainer" class="mx-auto max-w-xl"></div>
  </div>
</template>

