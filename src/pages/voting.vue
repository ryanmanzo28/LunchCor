<script setup lang="ts">
const restaurantsStore = useRestaurantsStore()

useHead({
    title: 'Voting',
})

const selectedRestaurantId = ref<number | null>(null)
const formError = ref('')
const isSubmitting = ref(false)

const canVoteNow = computed(() => {
    const now = new Date()
    return now.getDay() === 3 && now.getHours() < 11
})

const { restaurants, isLoading, loadError, selectedId } = storeToRefs(restaurantsStore)

onMounted(async () => {
    if (!canVoteNow.value) {
        await navigateTo('/')
        return
    }

    await restaurantsStore.fetchRestaurants()
})

async function submitVote() {
    if (isSubmitting.value) {
        return
    }

    formError.value = ''

    if (!selectedRestaurantId.value) {
        formError.value = 'Please select a restaurant to vote for.'
        return
    }

    isSubmitting.value = true

    try {
        // The store forwards authenticated user identity to /api/votes/vote.
        await restaurantsStore.voteFor(selectedRestaurantId.value)
    }
    finally {
        isSubmitting.value = false
    }
}
</script>

<template>
    <main class="dashboard">
        <section class="panel" aria-labelledby="voting-heading">
            <p class="eyebrow">Company Lunch</p>
            <h1 id="voting-heading">Cast your vote</h1>

            <p v-if="isLoading" class="muted">Loading restaurants...</p>
            <p v-else-if="loadError" class="muted">{{ loadError }}</p>

            <form v-else class="vote-form" @submit.prevent="submitVote">
                <label v-for="restaurant in restaurants" :key="restaurant.id" class="vote-option">
                    <input
                        v-model="selectedRestaurantId"
                        type="radio"
                        name="restaurant"
                        :value="restaurant.id"
                        :disabled="Boolean(selectedId)"
                    >
                    <span>{{ restaurant.name }}</span>
                </label>

                <p v-if="formError" class="muted">{{ formError }}</p>
                <p v-if="selectedId" class="muted">You have already voted for today.</p>

                <button type="submit" :disabled="isSubmitting || Boolean(selectedId)">
                    {{ isSubmitting ? 'Submitting...' : 'Submit Vote' }}
                </button>
            </form>
        </section>
    </main>
</template>