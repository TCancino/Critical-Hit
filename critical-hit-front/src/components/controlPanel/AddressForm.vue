<template>
  <div class="max-w-sm m-auto my-8">
    <div class="border p-10 border-grey-light shadow rounded">
      <h3 class="text-2xl mb-6 text-grey-darkest">Nueva dirección</h3>
      <form @submit.prevent="createAddress">
        <div class="mb-6">
          <input type="text" v-model="address.name" class="input" id="name" placeholder="Mi casa"/>
        </div>
        <div class="mb-6">
          <input type="text" v-model="address.address1" class="input" id="address1" placeholder="Alcantarilla sur 3">
        </div>
        <div class="mb-6">
          <input type="text" v-model="address.address2" class="input" id="address2" placeholder="Departamento 123">
        </div>
        <div class="mb-6">
          <input type="text" v-model="address.state" class="input" id="state" placeholder="La florinda">
        </div>
        <div class="mb-6">
          <input type="text" v-model="address.city" class="input" id="city" placeholder="Talca">
        </div>
        <div class="mb-6">
          <input type="text" v-model="address.region" class="input" id="region" placeholder="Borde galactico">
        </div>
        <div class="mb-6">
          <input type="text" v-model="address.postal_code" class="input" id="postal_code" placeholder="1111111">
        </div>
        <div>
          <button type="submit" class="font-sans font-bold px-4 rounded cursor-pointer no-underline bg-green hover:bg-green-dark block w-full py-4 text-white items-center justify-center">Agregar dirección</button>
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
      address: {},
      cities: [],
      states: [],
      regions: []
    }
  },
  created () {
    this.checkedSignedIn()
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    checkedSignedIn(){
      return localStorage.signedIn
    },
    createAddress(){
      this.$http.secured.post('/api/v1/addresses',
      {
        name: this.address.name,
        address1: this.address.address1,
        address2: this.address.address2,
        state: this.address.state,
        city: this.address.city,
        region: this.address.region,
        postal_code: this.address.postal_code,
        user_id: '1'
      })
      .then(response => this.error = response.status)
    }
  }
}
</script>
