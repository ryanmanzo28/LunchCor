<template>
  <!-- Split layout keeps persistent admin nav while child pages swap in the content slot. -->
  <div class="admin-shell">
    <aside class="admin-sidebar">
      <NuxtLink class="admin-brand" to="/">LunchCor Admin</NuxtLink>

      <nav class="admin-nav" aria-label="Admin navigation">
        <NuxtLink class="admin-link" to="/admin">Dashboard</NuxtLink>
        <NuxtLink class="admin-link" to="/admin/adminDashboard">Operations</NuxtLink>
        <NuxtLink class="admin-link" to="/admin/analytics">Analytics</NuxtLink>
        <NuxtLink class="admin-link" to="/">Voting App</NuxtLink>
        <NuxtLink class="admin-link" to="/api/health">API Health</NuxtLink>
        <NuxtLink class="admin-link" to="/api/restaurants">Restaurants API</NuxtLink>
      </nav>
    </aside>

    <main class="admin-main">
      <header class="admin-header">
        <h1>Admin Panel</h1>
        <p>Manage operations and inspect service status.</p>
      </header>

      <section class="admin-content">
        <slot />
      </section>
    </main>
  </div>
</template>

<style scoped>
.admin-shell {
  min-height: 100vh;
  display: grid;
  grid-template-columns: 250px minmax(0, 1fr);
  background: #f6f7fb;
}

.admin-sidebar {
  padding: 24px 18px;
  background: #11253b;
  color: #d6e1ee;
}

.admin-brand {
  display: inline-block;
  margin-bottom: 22px;
  color: #ffffff;
  text-decoration: none;
  font-size: 1.1rem;
  font-weight: 700;
}

.admin-nav {
  display: grid;
  gap: 8px;
}

.admin-link {
  padding: 10px 12px;
  border-radius: 8px;
  color: #d6e1ee;
  text-decoration: none;
  transition: background-color 0.15s ease;
}

.admin-link:hover,
.admin-link.router-link-active {
  background: #1a3859;
  color: #ffffff;
}

.admin-main {
  padding: 24px;
}

.admin-header h1 {
  margin: 0;
  color: #1b2d42;
  font-size: 1.6rem;
}

.admin-header p {
  margin: 8px 0 0;
  color: #55657a;
}

.admin-content {
  margin-top: 18px;
  padding: 18px;
  border: 1px solid #dfe5ee;
  border-radius: 12px;
  background: #ffffff;
}

@media (max-width: 900px) {
  .admin-shell {
    grid-template-columns: 1fr;
  }

  .admin-sidebar {
    padding-bottom: 14px;
  }

  .admin-nav {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }
}

@media (max-width: 560px) {
  .admin-main {
    padding: 14px;
  }

  .admin-nav {
    grid-template-columns: 1fr;
  }
}
</style>