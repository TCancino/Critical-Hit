<template>
  <div class="max-w-sm m-auto my-8">
    <div class="border p-10 border-grey-light shadow rounded">
      <h3 class="text-2xl mb-6 text-grey-darkest">Perfil</h3>
      <form>
        <div class="mb-6">
          <input type="username" v-model="username" class="input" id="username"/>
        </div>
        <div class="mb-6">
          <input type="email" v-model="email" class="input" id="email">
        </div>
        <div class="mb-6">
          <input type="text" v-model="first_name" class="input" id="first_name">
        </div>
        <div class="mb-6">
          <input type="text" v-model="middle_name" class="input" id="middle_name">
        </div>
        <div class="mb-6">
          <input type="text" v-model="last_name" class="input" id="last_name">
        </div>
        <div class="mb-6">
          {{rut}}
        </div>
        <div class="mb-6">
          <input type="password" v-model="password" class="input" id="password" placeholder="nueva contraseña">
        </div>
        <div class="mb-6">
          <input type="password" v-model="password_confirmation" class="input" id="password_confirmation" placeholder="repetir contraseña">
        </div>
        <div>
          <button type="submit" class="font-sans font-bold px-4 rounded cursor-pointer no-underline bg-green hover:bg-green-dark block w-full py-4 text-white items-center justify-center">Change Password</button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'EditForm',
  data () {
    return {
      username:'',
      email: '',
      first_name: '',
      middle_name: '',
      last_name: '',
      rut: '',
      password: '',
      password_confirmation: '',
      error: '',
      user: ''
    }
  },
  created () {
    this.checkedSignedIn()
    this.$http.secured.get("/api/v1/users/1").then(response => {this.user=response.data}).catch(error=>this.setError(error,"hubo un problema"))
    console.log(this.user)
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    checkedSignedIn(){
      return localStorage.signedIn
    }
  }
}
</script>
