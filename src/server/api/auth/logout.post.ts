export default defineEventHandler((event) => {
    // Remove auth cookies to terminate server-side session context.
    deleteCookie(event, 'jwt')
    deleteCookie(event, 'admin')

    return {
        success: true
    }
})