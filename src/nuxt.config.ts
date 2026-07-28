// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
	compatibilityDate: '2025-07-15',
	app: {
		head: {
			htmlAttrs: {
				lang: 'en',
			},
			meta: [
				{ charset: 'utf-8' },
				{ name: 'viewport', content: 'width=device-width, initial-scale=1' },
			],
		},
	},
	runtimeConfig: {
		jwtSecret: process.env.JWT_SECRET || '',
		public: {
			apiBase: process.env.NUXT_PUBLIC_API_BASE || '/api',
		},
	},
	nitro: {
		preset: 'node-server',
		compressPublicAssets: true,
	},
	devServer: {
		host: '0.0.0.0',
		port: Number.parseInt(process.env.FRONTEND_PORT || '3000', 10),
	},
	devtools: { enabled: process.env.NODE_ENV !== 'production' },
	css: ['~/assets/css/app.css'],
	modules: [
		'@nuxtjs/tailwindcss',
		'@pinia/nuxt',
		'@vueuse/nuxt',
	],
	typescript: {
		strict: true,
		typeCheck: true,
	},
	ssr: true,
})