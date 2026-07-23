// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
	compatibilityDate: '2025-07-15',
	runtimeConfig: {
		public: {
			apiBase: process.env.NUXT_PUBLIC_API_BASE || '/api',
		},
	},
	devServer: {
		host: '0.0.0.0',
		port: Number.parseInt(process.env.FRONTEND_PORT || '3000', 10),
	},
	devtools: { enabled: true },
	css: ['~/assets/css/app.css'],
	modules: [
		'@nuxtjs/tailwindcss',
		'@pinia/nuxt',
		'@vueuse/nuxt',
	],
	typescript: {
		strict: true,
	},
	ssr: true,
})