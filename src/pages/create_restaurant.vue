<script setup lang="ts">
import type { RestaurantCreateInput } from '~/server/utils/restaurants'

const form = reactive<Partial<RestaurantCreateInput>>({
  name: '',
  cuisine: '',
  description: '',
  color: '',
  link: '',
})

const previewSrc = ref<string | null>(null)

function onFileChange(event: Event) {
  const input = event.target as HTMLInputElement
  const file = input.files?.[0]

  if (previewSrc.value) {
    URL.revokeObjectURL(previewSrc.value)
    previewSrc.value = null
  }

  if (file) {
    previewSrc.value = URL.createObjectURL(file)
  }
}

async function createRestaurantFormSubmit() {
  const payload: Partial<RestaurantCreateInput> = {
    name: form.name?.trim() ?? '',
    cuisine: form.cuisine?.trim() ?? '',
    description: form.description?.trim() ?? '',
    color: form.color?.trim() ?? '',
    link: form.link?.trim() ?? '',
  }

  try {
    await apiFetch('/restaurants/create', {
      method: 'POST',
      body: payload,
    })

    alert('Restaurant created successfully!')
    form.name = ''
    form.cuisine = ''
    form.description = ''
    form.color = ''
    form.link = ''
    if (previewSrc.value) {
      URL.revokeObjectURL(previewSrc.value)
      previewSrc.value = null
    }
  } catch (error) {
    const message = error instanceof Error ? error.message : 'Unknown error'
    alert(`Error creating restaurant: ${message}`)
  }
}
</script>

<template>
  <form class="create-restaurant-form" @submit.prevent="createRestaurantFormSubmit">
    <label>
      Name
      <input v-model="form.name" type="text" name="name" placeholder="Name" required>
    </label>

    <label>
      Cuisine
      <input v-model="form.cuisine" type="text" name="cuisine" placeholder="Cuisine">
    </label>

    <label>
      Description
      <input v-model="form.description" type="text" name="description" placeholder="Description">
    </label>

    <label>
      Color
      <input v-model="form.color" type="text" name="color" placeholder="Color">
    </label>

    <label>
      Link To Order Page
      <input v-model="form.link" type="url" name="link" placeholder="Link To Order Page" required>
    </label>

    <label>
      Image
      <input type="file" name="image" accept="image/*" @change="onFileChange">
    </label>

    <NuxtImg
      v-if="previewSrc"
      :src="previewSrc"
      alt="Restaurant preview"
      width="360"
      height="180"
      fit="cover"
      class="preview"
      loading="lazy"
    />

    <button id="create-restaurant-button" type="submit">Create</button>
  </form>
</template>

<style scoped>
.create-restaurant-form {
  display: flex;
  flex-direction: column;
  gap: 8px;
  max-width: 360px;
}

.create-restaurant-form label {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.preview {
  max-width: 100%;
  max-height: 180px;
  object-fit: cover;
}
</style>