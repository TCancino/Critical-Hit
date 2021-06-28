<template>
  <header class="bg-grey-lighter py-4">
    <div class="container m-auto flex flex-wrap items-center justify-end">
      <div class="flex-1 flex items-center">
        <img src="@/assets/Critical-Hit-grande.jpg" alt="Critical Hit logo" sizes="(max_width: 100px) 100vw, 100px" width="100" height="100">
        <a href="/" class="uppercase text-sm font-mono pl-4 font-semibold no-underline text-indigo-dark hover:text-indigo-darker">Critical Hit</a>
      </div>
      <div>
        <router-link to="/catalogo" class="link-grey px-2 no-underline">Catálogo</router-link>
        <router-link to="/inventario" class="link-grey px-2 no-underline">Inventario</router-link>
        <router-link to="/" class="link-grey px-2 no-underline" v-if="!signedIn()">Sign in</router-link>
        <router-link to="/signup" class="link-grey px-2 no-underline" v-if="!signedIn()">Sign Up</router-link>
        <router-link to="/records" class="link-grey px-2 no-underline" v-if="signedIn()">Records</router-link>
        <router-link to="/artists" class="link-grey px-2 no-underline" v-if="signedIn()">Artists</router-link>
        <router-link to="/edit_form" class="link-grey px-2 no-underline" v-if="signedIn()">Edit Form</router-link>
        <router-link to="/addresses" class="link-grey px-2 no-underline" v-if="signedIn()">My Adresses</router-link>
        <a href="#" @click.prevent="signOut" class="link-grey px-2 no-underline" v-if="signedIn()">Sign out</a>
      </div>
      <div id="app" class="container">
        <div class="text-right"><button class="btn btn-primary" data-toggle="modal" data-target="#cartModal"><font-awesome-icon icon="shopping-cart" />({{cartItems.length}})</button></div>
      </div>
    </div>
  </header>
</template>

<script>
import cartModal from '@/components/shoppingCart/Cart.vue'
export default {
  name: 'Header',
  created () {
    this.signedIn()
  },
  data() {
    return {
      cartItems: []
    }
  },
  modules: {
    cartModal
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    signedIn () {
      return localStorage.signedIn
    },
    signOut () {
      this.$http.secured.delete('/signin')
        .then(response => {
          delete localStorage.csrf
          delete localStorage.signedIn
          this.$router.replace('/')
        })
        .catch(error => this.setError(error, 'Cannot sign out'))
    }
  }
}
</script>
