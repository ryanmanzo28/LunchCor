<script setup lang="ts">
const formContainer = ref<HTMLElement | null>(null)

type SettingsPreferences = {
  theme: string
  font: string
  compactMode: boolean
  keepLoggedIn: boolean
}

onMounted(() => {
  if (!formContainer.value) {
    return
  }

  const authStore = useAuthStore()
  const settingsCookie = useCookie<SettingsPreferences>('settings', {
    default: () => ({
      theme: 'light',
      font: 'inter',
      compactMode: false,
      keepLoggedIn: false,
    }),
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
    applyTheme(nextTheme)
    settingsCookie.value = { ...settingsCookie.value, theme: nextTheme }
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
    applyFont(nextFont)
    settingsCookie.value = { ...settingsCookie.value, font: nextFont }
  })
  fontLabel.appendChild(fontSelect)

  const compactLabel = createFieldLabel('Compact mode')
  const compactCheckbox = document.createElement('input')
  compactCheckbox.type = 'checkbox'
  compactCheckbox.checked = Boolean(settingsCookie.value.compactMode)
  compactCheckbox.addEventListener('change', () => {
    const compactMode = compactCheckbox.checked
    applyCompactMode(compactMode)
    settingsCookie.value = { ...settingsCookie.value, compactMode }
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
  })
  keepLoggedInLabel.appendChild(keepLoggedInCheckbox)

  form.append(themeLabel, fontLabel, compactLabel, keepLoggedInLabel)
  formContainer.value.replaceChildren(form)

  applyTheme(settingsCookie.value.theme || 'light')
  applyFont(settingsCookie.value.font || 'inter')
  applyCompactMode(Boolean(settingsCookie.value.compactMode))
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

function applyTheme(theme: string) {
  const nextTheme = theme === 'dark' ? 'dark' : 'light'
  document.documentElement.dataset.theme = nextTheme
  document.documentElement.classList.toggle('dark', nextTheme === 'dark')
  document.documentElement.style.colorScheme = nextTheme
}

function applyFont(font: string) {
  const nextFont = font === 'dm-sans' ? 'dm-sans' : font === 'fraunces' ? 'fraunces' : 'inter'
  document.documentElement.dataset.font = nextFont
}

function applyCompactMode(compactMode: boolean) {
  document.documentElement.dataset.compact = compactMode ? 'true' : 'false'
}

function applyRememberMe(keepLoggedIn: boolean, authStore: ReturnType<typeof useAuthStore>) {
  const maxAge = keepLoggedIn ? 60 * 60 * 24 * 30 : 60 * 60 * 24
  const token = authStore.token

  if (typeof token === 'string' && token.length > 0) {
    document.cookie = `jwt=${encodeURIComponent(token)}; path=/; max-age=${maxAge}; SameSite=Lax`
  }
}
</script>

<template>
  <div class="min-h-screen px-4 py-8">
    <div ref="formContainer" class="mx-auto max-w-xl"></div>
  </div>
</template>