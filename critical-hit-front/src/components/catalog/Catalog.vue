<template>
  <div class="container text-center" style="font-family: monospace">
    <div class="card-body" v-if="error">
      {{ error }}
    </div>
      <h1 class="text-center">Lista de Productos</h1>

      <hr>
      <div class="row">
        <div class="col-md-4" v-for="product in products" :key="product.id" :product="product">
          <div class="card mb-4" style="box-shadow: 5px 5px 5px 5px #da7b7b;">
            <img @click.prevent="detailProduct(product.id)" class="text-center" src="https://criticalhit.cl/wp-content/uploads/2021/06/Age-of-War-300x300.jpg" alt="Denim Jeans" style="width:100%">
            <h1 class="block flex-1 font-mono font-semibold flex items-center container ">
              <svg class="fill-current w-6 h-6 mr-2" viewBox="0 0 20 20" width="20" height="20"><title>Nombre del producto</title></svg>
                <a v-on:click="detailProduct(product.id)" style="color:black;" > {{ product.name }} </a>
            </h1>

            <p class="block flex-1 font-mono font-semibold flex items-center ">
              <svg class="fill-current w-6 h-6 mr-2" viewBox="0 0 20 20" width="20" height="20"><title>Nombre del producto</title></svg>
              <a style="color:black;"> {{product.description }} </a>
            </p>

            <p class="card-body price">
              <svg class="fill-current w-6 h-6 mr-2" viewBox="0 0 20 20" width="20" height="20"><title>Nombre del producto</title></svg>
              <a style="color:black;"> ${{ formatPrice(product.price) }} </a>
            </p>

            <div style="padding-left: 30px; padding-bottom: 30px;">
              <star-rating :star-size="20"></star-rating>
            </div>
            <button @click="addToCart(product,1)" class="btn btn-sm btn-danger">Añadir al carrito <font-awesome-icon icon="shopping-cart" /></button>
          </div>
        </div>
    </div>
  </div>
</template>

<script>
import StarRating from 'vue-star-rating'
export default {
  name: 'Products',
  data () {
    return {
      products: [],
      error: '',
      cartItems: []
    }
  },
  created () {
    if (!localStorage.signedIn) {
      this.$router.replace('/')
    } else {
      this.$http.secured.get('/api/v1/products')
        .then(response => { this.products = response.data })
        .catch(error => this.setError(error, 'Something went wrong'))
    }
    this.$http.secured.get('/api/v1/products')
        .then(response => { this.products = response.data })
        .catch(error => this.setError(error, 'Something went wrong'))
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    formatPrice(value) {
      let val = (value/1).toFixed(0).replace('.', ',')
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
    },
    detailProduct(product){
      this.$router.push({
        path: `/product/${product}`
      })
    },
    addToCart(product, quantity) {
      this.$http.secured.post(`/api/v1/carts/${product.id}/${quantity}`)
        .then(response => { this.items = response.data })
        .catch(error => this.setError(error, 'Something went wrong'))
    }
  },
  components: {
    StarRating
  }
}
</script>
<style>
  .card button:hover {
    opacity: 0.7;
  }
</style>