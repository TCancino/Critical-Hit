<template>
  <div class="max-w-md m-auto py-10">
    <div class="text-red" v-if="error">{{ error }}</div>
    <h3 class="font-mono font-regular text-3xl mb-4">Editar Oferta</h3>
    <form action="" @submit.prevent="editOffer">
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Nombre de la Oferta"
          v-model="offer.name" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Fecha de inicio"
          v-model="offer.start_date" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Fecha de término"
          v-model="offer.end_date" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Cantidad"
          v-model="offer.ammount" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Id de producto"
          v-model="offer.product_id" />
      </div>
      <input type="submit" value="Guardar" class="font-sans font-bold px-4 rounded cursor-pointer no-underline bg-green hover:bg-green-dark block w-full py-4 text-white items-center justify-center" />
    </form>
    <hr class="border border-grey-light my-6" />
  </div>
</template>

<script>
export default {
  name: 'Offers',
  data () {
    return {
      offer: [],
      error: '',
      categories: [],
      selectedCategory: ''
    }
  },
  created(){
    this.$http.secured.get(`/api/v1/offers/${this.$route.params.id}`)
      .then(response => {
        this.offer = response.data.offer
      })
      .catch(error => this.setError(error, 'Something went wrong'))
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    editOffer () {
      const value = this.offer
      if(!value) {
        return
      }
      this.$http.secured.patch(`/api/v1/offers/${this.$route.params.id}`, {
        offer: {
          name: this.offer.name,
          start_date: this.offer.start_date,
          end_date: this.offer.end_date,
          ammount: this.offer.ammount,
          product_id: this.offer.product_id
          } })

        .then(response => {
          this.offer = response.data
        })
        .catch(error => this.setError(error, 'No se pudo editar la oferta'))
    },
  }
}
</script>