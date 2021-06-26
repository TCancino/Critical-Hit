<template>
  <div class="max-w-sm m-auto my-8">
    <div class="border p-10 border-grey-light shadow rounded">
      <h3 class="text-2xl mb-6 text-grey-darkest">Sign Up</h3>
      <form @submit.prevent="signup">
        <div class="text-red" v-if="error">{{ error }}</div>

        <div class="mb-6">
          <label for="username" class="label">Usuario</label>
          <input type="username" v-model="username" class="input" id="username" placeholder="Mando">
        </div>

        <div class="mb-6">
          <label for="email" class="label">E-mail Address</label>
          <input type="email" v-model="email" class="input" id="email" placeholder="pascalpedro@gmail.com">
        </div>

        <div class="mb-6">
          <label for="password" class="label">Password</label>
          <input type="password" v-model="password" class="input" id="password" placeholder="Password">
        </div>

        <div class="mb-6">
          <label for="password_confirmation" class="label">Password Confirmation</label>
          <input type="password" v-model="password_confirmation" class="input" id="password_confirmation" placeholder="Password Confirmation">
        </div>
        <div class="mb-6">
          <label for="first_name" class="label">Primer Nombre</label>
          <input type="text" v-model="first_name" class="input" id="first_name" placeholder="José">
        </div>
        <div class="mb-6">
          <label for="middle_name" class="label">Segundo Nombre</label>
          <input type="text" v-model="middle_name" class="input" id="middle_name" placeholder="Pedro">
        </div>
        <div class="mb-6">
          <label for="last_name" class="label">Apellidos</label>
          <input type="text" v-model="last_name" class="input" id="last_name" placeholder="Balmaceda Pascal">
        </div>
        <div class="mb-6">
          <label for="rut" class="label">Rut</label>
          <input type="text" v-model="rut" class="input" id="rut" placeholder="11.111.111-1">        </div>

        <button type="submit" class="font-sans font-bold px-4 rounded cursor-pointer no-underline bg-green hover:bg-green-dark block w-full py-4 text-white items-center justify-center">Sign Up</button>

        <div class="my-4"><router-link to="/" class="link-grey">Sign In</router-link></div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Signup',
  data () {
    return {
      email: '',
      password: '',
      password_confirmation: '',
      error: '',
      first_name: '',
      middle_name: '',
      last_name: '',
      rut: '',
      username:''
    }
  },
  created () {
    this.checkedSignedIn()
  },
  updated () {
    this.checkedSignedIn()
  },
  methods: {
    signup () {
      this.$http.plain.post('/signup', { 
          email: this.email,
          password: this.password,
          password_confirmation: this.password_confirmation,
          first_name: this.first_name,
          middle_name: this.middle_name,
          last_name: this.last_name,
          rut: this.rut,
          username: this.username
        })
        .then(response => this.signupSuccessful(response))
        .catch(error => this.signupFailed(error))
    },
    signupSuccessful (response) {
      if (!response.data.csrf) {
        this.signupFailed(response)
        return
      }

      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.error = ''
      this.$router.replace('/records')
    },
    signupFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || 'Something went wrong'
      delete localStorage.csrf
      delete localStorage.signedIn
    },
    checkedSignedIn () {
      if (localStorage.signedIn) {
        this.$router.replace('/records')
      }
    }
  }
}
</script>
