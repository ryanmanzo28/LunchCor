import { RuntimeConfig as UserRuntimeConfig, PublicRuntimeConfig as UserPublicRuntimeConfig } from 'nuxt/schema'
  interface SharedRuntimeConfig {
   app: {
      buildId: string,

      baseURL: string,

      buildAssetsDir: string,

      cdnURL: string,
   },

   jwtSecret: string,

   adminPassword: string,

   webhook: {
      brevo: {
         token: string,
      },

      discord: {
         publicKey: string,
      },

      dropbox: {
         appSecret: string,
      },

      fourthwall: {
         secretKey: string,
      },

      github: {
         secretKey: string,
      },

      gitlab: {
         secretToken: string,
      },

      heroku: {
         secretKey: string,
      },

      kick: {
         publicKey: string,
      },

      mailchannels: {
         publicKey: string,
      },

      meta: {
         appSecret: string,
      },

      paddle: {
         webhookId: string,
      },

      paypal: {
         clientId: string,

         secretKey: string,

         webhookId: string,
      },

      resend: {
         secretKey: string,
      },

      shopify: {
         secretKey: string,
      },

      slack: {
         secretKey: string,
      },

      stripe: {
         secretKey: string,
      },

      svix: {
         secretKey: string,
      },

      twitch: {
         secretKey: string,
      },

      hygraph: {
         secretKey: string,
      },

      polar: {
         secretKey: string,
      },
   },
  }
  interface SharedPublicRuntimeConfig {
   apiBase: string,
  }
declare module '@nuxt/schema' {
  interface RuntimeConfig extends UserRuntimeConfig {}
  interface PublicRuntimeConfig extends UserPublicRuntimeConfig {}
}
declare module 'nuxt/schema' {
  interface RuntimeConfig extends SharedRuntimeConfig {}
  interface PublicRuntimeConfig extends SharedPublicRuntimeConfig {}
}
declare module 'vue' {
        interface ComponentCustomProperties {
          $config: UserRuntimeConfig
        }
      }