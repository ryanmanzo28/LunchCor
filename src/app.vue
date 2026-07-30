<script setup lang="ts">
useHead({
  title: 'LunchCor',
})
</script>

<template>
  <!-- Keep route announcer enabled for better screen-reader navigation updates. -->
  <NuxtRouteAnnouncer />
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
</template>