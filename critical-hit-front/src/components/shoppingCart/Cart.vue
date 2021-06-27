<template>
       <div class="modal fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">          <span aria-hidden="true">&times;</span></button>
               <h4 class="modal-title" id="myModalLabel">Cart</h4>
            </div>
            <div class="modal-body">
               <shopping-cart inline-template :items="cartItems">
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
                           <td></td>
                        </tr>
                     </table>
                  </div>
                  <!-- /.container -->
               </shopping-cart>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</template>
<script>
export default {
    name: 'Shopping Cart Module',
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