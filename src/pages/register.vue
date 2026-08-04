<template>
	<main class="login-page">
		<section class="login-card">
			<NuxtLink class="brand" to="/">Lunch<span>Cor</span></NuxtLink>
			<p class="eyebrow">Create account</p>
			<h1>Set up your LunchCor account.</h1>
			<p class="login-copy">Join your team, vote for lunch, and keep up with favorites.</p>

			<form @submit.prevent="register">
				<label for="name">Full name</label>
				<input id="name" v-model="name" type="text" autocomplete="name" placeholder="Jane Doe" :disabled="isSubmitting" required>

				<label for="email">Work email</label>
				<input id="email" v-model="email" type="email" autocomplete="email" placeholder="you@company.com" :disabled="isSubmitting" required>

				<label for="password">Password</label>
				<input id="password" v-model="password" type="password" autocomplete="new-password" placeholder="At least 8 characters" :disabled="isSubmitting" required>

				<label for="confirmPassword">Confirm password</label>
				<input id="confirmPassword" v-model="confirmPassword" type="password" autocomplete="new-password" placeholder="Re-enter password" :disabled="isSubmitting" required>

				<p v-if="registerError" class="login-error" role="alert">{{ registerError }}</p>

				<button type="submit" :disabled="isSubmitting">
					{{ isSubmitting ? 'Creating account...' : 'Create account' }} <span aria-hidden="true">→</span>
				</button>
				<button type="button" :disabled="isSubmitting" @click="navigateTo('/login', { replace: true })">Back to login</button>
			</form>
		</section>
	</main>
</template>

<script setup lang="ts">
useHead({
	title: 'Register',
	link: [
		{ rel: 'icon', href: '/favicon.ico' },
	],
})

const router = useRouter()
const userStore = useUserStore()
const name = ref('')
const email = ref('')
const password = ref('')
const confirmPassword = ref('')
const isSubmitting = ref(false)
const registerError = ref('')

async function register() {
	if (isSubmitting.value) {
		return
	}

	registerError.value = ''

	if (password.value !== confirmPassword.value) {
		registerError.value = 'Passwords do not match.'
		return
	}

	isSubmitting.value = true

	try {
		await userStore.createUser({
			name: name.value,
			email: email.value,
			password: password.value,
		})

		await navigateTo('/login', { replace: true })
	} catch (error) {
		const statusMessage = (error as { statusMessage?: string })?.statusMessage
		registerError.value = statusMessage || 'Unable to create account right now. Please try again.'
	} finally {
		isSubmitting.value = false
	}
}
</script>

<style scoped>
.login-error {
	margin: 0.5rem 0;
	color: #b42318;
}
</style>

