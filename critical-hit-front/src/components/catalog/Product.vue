<template>
  <div class="max-w-md m-auto py-10">
    <div class="text-red" v-if="error">{{ error }}</div>
    {{$route.params.id}}
    <div>{{product.name}}</div>
    <div>Precio: ${{product.price}}</div>
    <div>Stock: {{product.stock}}</div>
    <div v-if="product.status == 'Disponible'">
        <input v-model="qty" class="form-control input-qty" type="number">
        <button >Agregar al carro</button>
    </div>
    <div v-else-if="product.status == 'Preventa'">
        <button>Reservar</button>
    </div>
    <div v-else>
        No disponible
    </div>
    <div v-on:click="showRatings">Comentarios ({{ratings.length}})</div>
    <Ratings v-if="isHidden" v-bind:ratings="ratings"/>
    <RatingForm></RatingForm>
  </div>
</template>

<script>
import Ratings from '@/components/catalog/Ratings.vue'
import RatingForm from '@/components/catalog/RatingForm.vue'
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
    }
  }
}
</script>
