<template>
  <div class="card text-center">
    <div class="text-red" v-if="error">{{ error }}</div>
    <div>
      <button @click="subscribe" type="button" class="btn btn-danger float-right mr-6 mt-3 " >
        Agregar a favoritos <font-awesome-icon icon="heart" />
      </button>
    </div>
    <h1>
      <a style="color:black;"> {{product.name}} </a>
    </h1>
    <p>
      <a style="color:grey;"> SKU:{{product.sku}} </a>
    </p>
    <div class="d-flex justify-content-center">
      <star-rating :star-size="20"></star-rating>
    </div>
    <div>Precio: ${{ formatPrice(product.price) }}</div>
    <div>Stock: {{product.stock}}</div>
    <div v-if="product.status == 'Disponible'">
      <input v-model="qty" class="form-control input-qty" type="number">
      <button >Agregar al carro</button>
    </div>
    <div v-else-if="product.status == 'Preventa'">
      <button>Reservar</button>
    </div>
    <div v-else style="color:red;">
      No disponible
    </div>
    <div v-on:click="showRatings">Comentarios ({{ratings.length}})</div>
    <Ratings v-if="isHidden" v-bind:ratings="ratings"/>
    <RatingForm></RatingForm>
    <div >
      <b-card no-body>
        <b-tabs card>
          <b-tab title="Descripción" active><p> {{ product.description }} </p></b-tab>
          <b-tab title="Especificaciones" active><p> {{ product.description }} </p></b-tab>
          <b-tab title="Comentarios" ><p v-for="rating in ratings " :key="rating.id">Valor:{{rating.value}} Comentario: {{rating.comment}}</p></b-tab>
          <b-tab title="Términos y condiciónes" ><p>Los consumidores podrán devolver un producto adquirido en Mercado Critical Hit dentro del plazo de 10 días contados desde su recepción, sin necesidad de invocar ninguna causa y siempre y cuando el producto no se haya deteriorado por un hecho imputable al consumidor.</p></b-tab>
        </b-tabs>
      </b-card>
    </div>
  </div>
</template>

<script>
import Ratings from '@/components/catalog/Ratings.vue'
import RatingForm from '@/components/catalog/RatingForm.vue'
import StarRating from 'vue-star-rating';
export default {
  name: 'Product',
  data () {
    return {
      product: {},
      error: '',
      qty: 1,
      ratings: [],
      isHidden: false
    }
  },
  components: {
    Ratings,
    RatingForm
  },
  created () {
    this.$http.secured.get(`/api/v1/products/${this.$route.params.id}`)
      .then(response => {
        this.product = response.data.product
        this.ratings = response.data.ratings
      })
      .catch(error => this.setError(error, 'Something went wrong'))
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    addToCart(){
        let itemInCart = this.cartItems.filter(item => item.id===this.product.id)
        if (itemInCart){
            itemInCart.qty += itemToAdd.qty
        } else {
            this.cartItems.push(product, qty)
        }
    },
    showRatings(){
      this.isHidden = !this.isHidden
      let itemInCart = this.cartItems.filter(item => item.id===this.product.id)
      if (itemInCart){
        itemInCart.qty += itemToAdd.qty
      } else {
        this.cartItems.push(product, qty)
      }
    },
    formatPrice(value) {
      let val = (value/1).toFixed(0).replace('.', ',')
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
    },
    subscribe() {
      if (this.signedIn()){
        this.$http.secured.post(`/api/v1/subscribe/${this.$route.params.id}`)
          .catch(error => this.setError(error, 'Something went wrong'))
      }
    },
    signedIn () {
      return localStorage.signedIn
    }
  },
  components: {
    StarRating
  }
}
</script>
