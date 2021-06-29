<template>
  <div class="max-w-sm m-auto my-8">
    <div class="border p-10 border-grey-light shadow rounded">
      <h3 class="text-2xl mb-6 text-grey-darkest">Perfil</h3>
      <form>
        <div class="mb-6">
          <label for="username" class="label">Nombre de Usuario</label>
          <input type="username" v-model="user.username" class="input" id="username"/>
        </div>
        <div class="mb-6">
          <label for="email" class="label">Correo electrónico</label>
          <input type="email" v-model="user.email" class="input" id="email">
        </div>
        <div class="mb-6">
          <label for="text" class="label">Nombre</label>
          <input type="text" v-model="user.first_name" class="input" id="first_name">
        </div>
        <div class="mb-6">
          <label for="text" class="label">Segundo Nombre</label>
          <input type="text" v-model="user.middle_name" class="input" id="middle_name">
        </div>
        <div class="mb-6">
          <label for="text" class="label">Apellidos</label>
          <input type="text" v-model="user.last_name" class="input" id="last_name">
        </div>
        <div class="mb-6">
          Rut: {{user.rut}}
        </div>
        <div class="mb-6">
          <label for="password" class="label">Cambiar Contraseña</label>
          <input type="password" v-model="user.password" class="input" id="password" placeholder="nueva contraseña">
        </div>
        <div class="mb-6">
          <label for="password" class="label">Repetir Contraseña</label>
          <input type="password" v-model="user.password_confirmation" class="input" id="password_confirmation" placeholder="repetir contraseña">
        </div>
        <div>
          <button type="submit" class="font-sans font-bold px-4 rounded cursor-pointer no-underline bg-green hover:bg-green-dark block w-full py-4 text-white items-center justify-center">Actualizar Datos</button>
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
