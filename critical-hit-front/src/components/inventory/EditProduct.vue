<template>
  <div class="max-w-md m-auto py-10">
    <div class="text-red" v-if="error">{{ error }}</div>
    <h3 class="font-mono font-regular text-3xl mb-4">Editar Producto</h3>
    <form action="" @submit.prevent="editProduct">
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Nombre del producto"
          v-model="product.name" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Precio"
          v-model="product.price" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Descripción"
          v-model="product.description" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="SKU"
          v-model="product.sku" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Código de barras"
          v-model="product.barcode" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Stock"
          v-model="product.stock" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Estado"
          v-model="product.status" />
      </div>
      <h3 class=" font-monomb-6 ml-6">Especificaciones del producto:</h3>
        <div class="mb-6">
          <select v-model="product.category_id">
            <option disabled value="">Selecciona una categoría</option>
            <option v-for="category in categories" v-bind:key="category.id">{{category.name}}</option>
          </select>
          <br>
        </div>
        <div class="mb-6">
          <input class="input"
            autofocus autocomplete="off"
            placeholder="Marca"
            v-model="product.brand" />
        </div>
        <div class="mb-6">
          <input class="input"
            autofocus autocomplete="off"
            placeholder="Alto"
            v-model="product.height" />
        </div>
        <div class="mb-6">
          <input class="input"
            autofocus autocomplete="off"
            placeholder="Ancho"
            v-model="product.width" />
        </div>
        <div class="mb-6">
          <input class="input"
            autofocus autocomplete="off"
            placeholder="Largo"
            v-model="product.large" />
        </div>
        <div class="mb-6">
          <input class="input"
            autofocus autocomplete="off"
            placeholder="Peso"
            v-model="product.weight" />
        </div>
        <div class="mb-6">
          <input class="input"
            autofocus autocomplete="off"
            placeholder="Edad recomendada"
            v-model="product.recommended_age" />
        </div>
        <div class="mb-6">
          <input class="input"
            autofocus autocomplete="off"
            placeholder="Cantidad de jugadores"
            v-model="product.number_of_player" />
        </div>
      <input type="submit" value="Edit Product" class="font-sans font-bold px-4 rounded cursor-pointer no-underline bg-green hover:bg-green-dark block w-full py-4 text-white items-center justify-center" />
    </form>
    <hr class="border border-grey-light my-6" />
  </div>
</template>

<script>
export default {
  name: 'Products',
  data () {
    return {
      product: [],
      error: '',
      editedArtist: '',
      categories: [],
      selectedCategory: ''
    }
  },
  created(){
    this.$http.secured.get(`/api/v1/products/${this.$route.params.id}`)
      .then(response => {
        this.product = response.data.product
        this.ratings = response.data.ratings
      })
      .catch(error => this.setError(error, 'Something went wrong'))
    this.$http.secured.get('/api/v1/categories')
        .then(response => { this.categories = response.data })
        .catch(error => this.setError(error, 'Something went wrong'))
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    editProduct () {
      const value = this.product
      if(!value) {
        return
      }
      this.$http.secured.patch(`/api/v1/products/${this.$route.params.id}`, {
        product: {
          name: this.product.name,
          price: this.product.price,
          description: this.product.description,
          sku: this.product.sku,
          status: this.product.status,
          barcode: this.product.barcode,
          stock: this.product.stock,
          rating_value: 0,
          rating_count: 0,
          brand: this.product.brand,
          height: this.product.height,
          width: this.product.width,
          large: this.product.large,
          weight: this.product.weight,
          recommended_age: this.product.recommended_age,
          number_of_player:this.product.number_of_player,
          category_id: this.selectedCategory.id
          } })

        .then(response => {
          this.product = response.data
        })
        .catch(error => this.setError(error, 'Cannot create artist'))
    },
  }
}
</script>
