<template>
  <article class="card">
    <header v-if="$slots.header || title" class="card-header">
      <slot name="header">
        <h2 v-if="title">{{ title }}</h2>
      </slot>
    </header>

    <div class="card-body">
      <slot />
    </div>
  </article>
</template>

<script setup lang="ts">
withDefaults(defineProps<{
  title?: string
}>(), {
  title: undefined,
})
</script>

<style scoped>
.card {
  border: 1px solid #e4e8ef;
  border-radius: 10px;
  padding: 16px;
  background: #fff;
}

.card-header {
  margin-bottom: 10px;
}

.card-header h2 {
  margin: 0;
  font-size: 1.05rem;
  color: #1f3249;
}

.card-body :deep(p),
.card-body :deep(.muted) {
  margin: 0;
  color: #566579;
  line-height: 1.5;
}

.card-body :deep(a) {
  display: inline-block;
  margin-top: 10px;
  color: #225ea8;
  text-decoration: none;
  font-weight: 600;
}
</style>
