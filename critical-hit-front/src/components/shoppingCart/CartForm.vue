<template>
  <div>
    <div>
      <div>
        <div>
          <div>
            <table class="table table-cart">
              <tr v-for="(item, index) in items" :key="item.id">
                <td>{{item.title}}</td>
                <td style="width:120px">QTY:
                  <input v-model="item.qty" class="form-control input-qty" type="number">
                </td>
                <td class="text-right">${{item.price | formatCurrency}}</td>
                <td>
                  <button @click="removeItem(index)"><span class="glyphicon glyphicon-trash"></span></button>
                </td>
              </tr>
              <tr v-show="items.length === 0">
                <td colspan="4" class="text-center">Cart is empty</td>
              </tr>
              <tr v-show="items.length > 0">
                <td></td>
                <td class="text-right">Cart Total</td>
                <td class="text-right">${{Total | formatCurrency}}</td>
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
            <button @click="$router.push({path: '/purchase_detail'})" class="btn btn-primary" >Proceder Al Pago</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
    name: 'Shopping Cart',
    props: ['cartItems'],
    data() {
        return {
        cartItems: this.cartItems,
        }
    },
    computed: {
        Total() {
        let total = 0;
        this.items.forEach(item => {
            total += (item.price * item.qty);
        });
        return total;
        }
    },
    methods: {
		// Remove item by its index
        removeItem(index) {
            this.items.splice(index, 1)
        },
    }
}
</script>
