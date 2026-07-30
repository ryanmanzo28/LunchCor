// nuxt.config.ts
export default defineNuxtConfig({
  compatibilityDate: '2025-07-15',

  app: {
    head: {
      htmlAttrs: {
        lang: 'en',
      },
      meta: [
        { charset: 'utf-8' },
        {
          name: 'viewport',
          content: 'width=device-width, initial-scale=1',
        },
      ],
    },
  },

  runtimeConfig: {
    jwtSecret: process.env.JWT_SECRET || '',
    adminPassword: process.env.ADMIN_PASSWORD || '',
    public: {
      apiBase: process.env.NUXT_PUBLIC_API_BASE || '/api',
    },
  },

  nitro: {
    preset: 'node-server',

    compressPublicAssets: {
      gzip: true,
      brotli: true,
    },

    prerender: {
      crawlLinks: true,
    },
  },

  routeRules: {
    "/": {
      prerender: true,
    },

    "/restaurant_list": {
      prerender: true,
    },

    "/settings": {
      ssr: true,
    },

    "/admin/**": {
      ssr: false,
    },

    "/api/restaurants/**": {
      cache: {
        maxAge: 300,
      },
    },

    "/images/**": {
      headers: {
        "cache-control": "public,max-age=31536000,immutable",
      },
    },
  },

  experimental: {
    payloadExtraction: true,
  },

  future: {
    compatibilityVersion: 4,
  },

  devtools: {
    enabled: process.env.NODE_ENV !== "production",
  },

  typescript: {
    strict: true,
    typeCheck: true,
  },

  modules: [
    "@nuxtjs/tailwindcss",
    "@pinia/nuxt",
    "@vueuse/nuxt",
	"@nuxt/image",
	"nuxt-webhook-validators",
  ],

  css: [
    "~/assets/css/tailwind.css",
  ],

  devServer: {
    host: "0.0.0.0",
    port: Number.parseInt(process.env.FRONTEND_PORT || "3000", 10),
  },
})
// sorry if this config file is absolutely massive i went down a rabbit hole