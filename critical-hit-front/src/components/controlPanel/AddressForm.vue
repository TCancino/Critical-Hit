<template>
  <div class="max-w-sm m-auto my-8">
    <div class="border p-10 border-grey-light shadow rounded">
      <h3 class="text-2xl mb-6 text-grey-darkest">Perfil</h3>
      <form>
        <div class="mb-6">
          <input type="text" v-model="address.name" class="input" id="name"/>
        </div>
        <div class="mb-6">
          <input type="text" v-model="address.address1" class="input" id="address1">
        </div>
        <div class="mb-6">
          <input type="text" v-model="address.address2" class="input" id="address2">
        </div>
        <div class="mb-6">
          <input type="text" v-model="address.state" class="input" id="state">
        </div>
        <div class="mb-6">
          <input type="text" v-model="address.city" class="input" id="city">
        </div>
        <div class="mb-6">
          <input type="text" v-model="address.region" class="input" id="region">
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
  name: 'AddressForm',
  data () {
    return {
      error: '',
      address: {}
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
