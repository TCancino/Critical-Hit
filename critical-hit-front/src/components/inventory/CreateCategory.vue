<template>
  <div class="max-w-md m-auto py-10">
    <div class="text-red" v-if="error">{{ error }}</div>
    <h3 class="font-mono font-regular text-3xl mb-4">Agregar Categoria</h3>
    <form action="" @submit.prevent="addCategory">
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Nombre de la categoría"
          v-model="newCategory.name" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Descripción"
          v-model="newCategory.description" />
      </div>
      <input type="submit" value="Agregar Categoría" class="font-sans font-bold px-4 rounded cursor-pointer no-underline bg-green hover:bg-green-dark block w-full py-4 text-white items-center justify-center" />
    </form>
    <hr class="border border-grey-light my-6" />
  </div>
</template>

<script>
export default {
  name: 'Categories',
  data () {
    return {
      newCategory: [],
      error: '',
      categories: []
    }
  },
  created () {
    this.$http.secured.get('/api/v1/create_category')
        .then(response => { this.categories = response.data })
        .catch(error => this.setError(error, 'Something went wrong'))
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    addCategory () {
      const value = this.newCategory
      if(!value) {
        return
      }
      this.$http.secured.post('/api/v1/create_category/', {
        product: {
          name: this.newCategory.name,
          description: this.newCategory.description,
          } })

        .then(response => {
          this.categories.push(response.data)
          this.newCategory = ''
        })
        .catch(error => this.setError(error, 'No se pudo crear la categoría'))
    },
  }
}
</script>
