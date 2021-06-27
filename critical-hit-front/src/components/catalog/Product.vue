<template>
  <div class="max-w-md m-auto py-10">
    <div class="text-red" v-if="error">{{ error }}</div>
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
  </div>
</template>

<script>
export default {
  name: 'Product',
  data () {
    return {
      product: '',
      error: '',
      qty: 1
    }
  },
  created () {
    this.$http.secured.get('/api/v1/products/2')
      .then(response => { this.product = response.data.data })
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
    }
  }
}
</script>
