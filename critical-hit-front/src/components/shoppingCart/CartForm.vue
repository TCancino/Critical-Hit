<template>
  <div>
    <div>
      <div>
        <div>
          <div>
            <table class="table table-cart">
              <tr v-for="item in items" :key="item.id">
                <td>{{item.product.name}}</td>
                <td style="width:120px">QTY:
                  <input v-model="item.quantity" class="form-control input-qty" type="number">
                </td>
                <td class="text-right">${{item.product.price | formatCurrency}}</td>
                <td>
                  <button @click="removeItem(item.product.id)">x<span class="glyphicon glyphicon-trash"></span></button>
                </td>
              </tr>
              <tr v-show="items.length === 0">
                <td colspan="4" class="text-center">Cart is empty</td>
              </tr>
              <tr v-show="items.length > 0">
                <td></td>
                <td class="text-right">Total a pagar</td>
                <td class="text-right">${{total | formatCurrency}}</td>
                <td></td>
                <td>
                  <button @click="$router.push({path: '/purchase_detail'})" class="btn btn-primary" >
                    Proceder Al Pago
                  </button>
                </td>
                <td></td>
              </tr>
            </table>
          </div>
          <div class="text-right">
            <button @click="purchase()" class="btn btn-primary" >Pagar</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ShoppingCart',
  data() {
      return {
        items: [],
        total: 0
      }
  },
  created (){
    this.$http.secured.get('/api/v1/carts')
      .then(response => { this.items = response.data })
      .catch(error => this.setError(error, 'Something went wrong'))
    this.items.forEach(item => {
          this.total += (item.product.price * item.qty);
      });
  },
  methods: {
	// Remove item by its index
    removeItem(index) {
      this.items.splice(index, 1)
    },
    setError (error, text) {
    this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    purchase(){
      this.$http.secured.post('/api/v1/purchase_orders')
    }
  }
}
</script>
