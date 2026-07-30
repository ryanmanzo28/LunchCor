export default defineEventHandler((event) => {
    // Remove auth cookie to terminate server-side session context.
    deleteCookie(event, "token")

    return {
        success: true
    }
})