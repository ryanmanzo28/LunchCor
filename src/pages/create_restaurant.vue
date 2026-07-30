<script setup lang="ts">
import { onMounted } from 'vue'
import type { RestaurantCreateInput } from '~/server/utils/restaurants'

onMounted(() => {
  const root = document.getElementById('restaurant-form-root')

  if (!root) {
    return
  }

  const form = document.createElement('form')
  form.setAttribute('method', 'post')
  form.setAttribute('action', '#')
  form.style.display = 'flex'
  form.style.flexDirection = 'column'
  form.style.gap = '8px'
  form.style.maxWidth = '360px'

  const title = document.createElement('h2')
  title.textContent = 'Create Restaurant'

  const fields = [
    { label: 'Name', name: 'name', type: 'text', required: true },
    { label: 'Cuisine', name: 'cuisine', type: 'text' },
    { label: 'Description', name: 'description', type: 'text' },
    { label: 'Color', name: 'color', type: 'text' },
    { label: 'Link To Order Page', name: 'link', type: 'url', required: true },
  ]

  fields.forEach(({ label, name, type, required }) => {
    const labelEl = document.createElement('label')
    labelEl.textContent = label

    const input = document.createElement('input')
    input.setAttribute('type', type)
    input.setAttribute('name', name)
    input.setAttribute('placeholder', label)
    if (required) {
      input.required = true
    }

    form.appendChild(labelEl)
    form.appendChild(input)
  })

  const uploadLabel = document.createElement('label')
  uploadLabel.textContent = 'Image'

  const uploadInput = document.createElement('input')
  uploadInput.setAttribute('type', 'file')
  uploadInput.setAttribute('name', 'image')
  uploadInput.setAttribute('accept', 'image/*')

  const preview = document.createElement('img')
  preview.setAttribute('alt', 'Restaurant preview')
  preview.style.display = 'none'
  preview.style.maxWidth = '100%'
  preview.style.maxHeight = '180px'
  preview.style.objectFit = 'cover'
  preview.setAttribute('loading', 'lazy')

  uploadInput.addEventListener('change', () => {
    const file = uploadInput.files?.[0]
    if (!file) {
      preview.style.display = 'none'
      preview.removeAttribute('src')
      return
    }

    const objectUrl = URL.createObjectURL(file)
    preview.setAttribute('src', objectUrl)
    preview.style.display = 'block'
  })

  form.appendChild(uploadLabel)
  form.appendChild(uploadInput)
  form.appendChild(preview)

  const submitButton = document.createElement('button')
  submitButton.setAttribute('id', 'create-restaurant-button')
  submitButton.setAttribute('type', 'submit')
  submitButton.textContent = 'Create'

  form.appendChild(submitButton)
  root.appendChild(form)

  async function createRestaurantFormSubmit(event: Event) {
    event.preventDefault()

    const payload: Partial<RestaurantCreateInput> = {
      name: (form.elements.namedItem('name') as HTMLInputElement | null)?.value ?? '',
      cuisine: (form.elements.namedItem('cuisine') as HTMLInputElement | null)?.value ?? '',
      description: (form.elements.namedItem('description') as HTMLInputElement | null)?.value ?? '',
      color: (form.elements.namedItem('color') as HTMLInputElement | null)?.value ?? '',
      link: (form.elements.namedItem('link') as HTMLInputElement | null)?.value ?? '',
    }

    try {
      await $fetch('/api/restaurants/create', {
        method: 'POST',
        headers: {
          'content-type': 'application/json',
        },
        body: JSON.stringify(payload),
      })

      alert('Restaurant created successfully!')
      form.reset()
      preview.style.display = 'none'
      preview.removeAttribute('src')
    } catch (error) {
      const message = error instanceof Error ? error.message : 'Unknown error'
      alert(`Error creating restaurant: ${message}`)
    }
  }

  form.addEventListener('submit', createRestaurantFormSubmit)
})
</script>

<template>
  <div id="restaurant-form-root" />
</template>