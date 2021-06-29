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
          {{categories}}
          <select v-model="selectedCategory">
            <option disabled value="">Selecciona una categoría</option>
            <tr v-for="category in categories" v-bind:key="category.id">
              {{category}}
              <option>{{category.name}}</option>
            </tr>
          </select>
          <span>Seleccionado: {{ selected }}</span>
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
      <input @click="$router.push({path: '/inventario'})" v-on:click="addProduct" type="submit" value="Add Product" class="font-sans font-bold px-4 rounded cursor-pointer no-underline bg-green hover:bg-green-dark block w-full py-4 text-white items-center justify-center" />
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
      categories: [],
      selectedCategory: ''
    }
  },
  created(){
    this.$http.secured.get('/api/v1/categories')
        .then(response => { this.categories = response.data })
        .catch(error => this.setError(error, 'Something went wrong'))
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
        .then(alert('Producto Creado'))
    },
  }
}
</script>
