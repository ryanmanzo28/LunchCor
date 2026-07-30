export interface SettingsPreferences {
  theme: string
  font: string
  compactMode: boolean
  keepLoggedIn: boolean
}

export const defaultSettings: SettingsPreferences = {
  theme: 'light',
  font: 'inter',
  compactMode: false,
  keepLoggedIn: false,
}

export default defineNuxtPlugin(() => {
  const settings = useCookie<SettingsPreferences>('settings', {
    default: () => ({ ...defaultSettings }),
    sameSite: 'lax',
    path: '/',
  })

  const applySettings = () => {
    const root = document.documentElement
    const theme = settings.value.theme === 'dark' ? 'dark' : 'light'
    const font = settings.value.font === 'dm-sans'
      ? 'dm-sans'
      : settings.value.font === 'fraunces'
        ? 'fraunces'
        : 'inter'

    root.dataset.theme = theme
    root.dataset.font = font
    root.dataset.compact = settings.value.compactMode ? 'true' : 'false'
    root.classList.toggle('dark', theme === 'dark')
    root.style.colorScheme = theme
  }

  applySettings()

  watch(
    settings,
    () => {
      applySettings()
    },
    {
      deep: true,
    },
  )

  return {
    provide: {
      settings: {
        settings,
        applySettings,
      },
    },
  }
})