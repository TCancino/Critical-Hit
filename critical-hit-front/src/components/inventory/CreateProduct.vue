<template>
  <div class="max-w-md m-auto py-10">
    <div class="text-red" v-if="error">{{ error }}</div>
    <h3 class="font-mono font-regular text-3xl mb-4">Agregar Producto</h3>
    <form action="" @submit.prevent="addProduct">
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Nombre del producto"
          v-model="newProduct.name" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Precio"
          v-model="newProduct.price" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Descripción"
          v-model="newProduct.description" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="SKU"
          v-model="newProduct.sku" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Código de barras"
          v-model="newProduct.barcode" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Stock"
          v-model="newProduct.stock" />
      </div>
      <div class="mb-6">
        <input class="input"
          autofocus autocomplete="off"
          placeholder="Estado"
          v-model="newProduct.status" />
      </div>
      <h3 class=" font-monomb-6 ml-6">Especificaciones del producto:</h3>
        <div class="mb-6">
          <select v-model="selectedCategory">
            <div v-for="category in categories" v-bind:key="category.id">
              <option>{{category.name}}</option>
            </div>
          </select>
          <br>
        </div>
        <div class="mb-6">
          <input class="input"
            autofocus autocomplete="off"
            placeholder="Marca"
            v-model="newProduct.brand" />
        </div>
        <div class="mb-6">
          <input class="input"
            autofocus autocomplete="off"
            placeholder="Alto"
            v-model="newProduct.height" />
        </div>
        <div class="mb-6">
          <input class="input"
            autofocus autocomplete="off"
            placeholder="Ancho"
            v-model="newProduct.width" />
        </div>
        <div class="mb-6">
          <input class="input"
            autofocus autocomplete="off"
            placeholder="Largo"
            v-model="newProduct.large" />
        </div>
        <div class="mb-6">
          <input class="input"
            autofocus autocomplete="off"
            placeholder="Peso"
            v-model="newProduct.weight" />
        </div>
        <div class="mb-6">
          <input class="input"
            autofocus autocomplete="off"
            placeholder="Edad recomendada"
            v-model="newProduct.recommended_age" />
        </div>
        <div class="mb-6">
          <input class="input"
            autofocus autocomplete="off"
            placeholder="Cantidad de jugadores"
            v-model="newProduct.number_of_player" />
        </div>
      <input type="submit" value="Add Product" class="font-sans font-bold px-4 rounded cursor-pointer no-underline bg-green hover:bg-green-dark block w-full py-4 text-white items-center justify-center" />
    </form>
    <hr class="border border-grey-light my-6" />
  </div>
</template>

<script>
export default {
  name: 'Products',
  data () {
    return {
      newProduct: [],
      error: '',
      editedArtist: '',
      categories: this.getCategories(),
      selectedCategory: []
    }
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    addProduct () {
      const value = this.newProduct
      if(!value) {
        return
      }
      this.$http.secured.post('/api/v1/products/', {
        product: {
          name: this.newProduct.name,
          price: this.newProduct.price,
          description: this.newProduct.description,
          sku: this.newProduct.sku,
          status: this.newProduct.status,
          barcode: this.newProduct.barcode,
          stock: this.newProduct.stock,
          rating_value: 0,
          rating_count: 0,
          brand: this.newProduct.brand,
          height: this.newProduct.height,
          width: this.newProduct.width,
          large: this.newProduct.large,
          weight: this.newProduct.weight,
          recommended_age: this.newProduct.recommended_age,
          number_of_player:this.newProduct.number_of_player
          } })

        .then(response => {
          this.products.push(response.data)
          this.newProduct = ''
        })
        .catch(error => this.setError(error, 'Cannot create artist'))
    },
    addArtist () {
      const value = this.newProduct
      if (!value) {
        return
      }
      this.$http.secured.post('/api/v1/artists/', { artist: { name: this.newProduct.name } })

        .then(response => {
          this.artists.push(response.data)
          this.newProduct = ''
        })
        .catch(error => this.setError(error, 'Cannot create artist'))
    },
    getCategories(){
      this.$http.secured.get(`/api/v1/categories`)
      .then(response => { this.categories = response.data })
      .catch(error => this.setError(error, 'Cannot get categories'))
    },
    removeArtist (artist) {
      this.$http.secured.delete(`/api/v1/artists/${artist.id}`)
        .then(response => {
          this.artists.splice(this.artists.indexOf(artist), 1)
        })
        .catch(error => this.setError(error, 'Cannot delete artist'))
    },
    editArtist (artist) {
      this.editedArtist = artist
    },
    updateArtist (artist) {
      this.editedArtist = ''
      this.$http.secured.patch(`/api/v1/artists/${artist.id}`, { artist: { title: artist.name } })
        .catch(error => this.setError(error, 'Cannot update artist'))
    }
  }
}
</script>
