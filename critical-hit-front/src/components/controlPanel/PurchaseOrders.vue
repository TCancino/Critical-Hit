<template>
    <div class="container">
        <h3 class="p-3 text-center">Mis Pedidos</h3>
        <div v-show="purchase_orders.length === 0" class="text-center">
          Aún no tienes ningún pedido
        </div>
        <table v-show="purchase_orders.length > 0" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Nro De Orden</th>
                    <th>Producto</th>
                    <th>Monto</th>
                    <th>Tipo De Pago</th>
                    <th>Estado</th>
                    <th>Fecha De Compra</th>
                    <th>Detalles</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="order in purchase_orders" v-bind:key="order.id">
                    <td>{{order.number}}</td>
                    <td>{{order.products}}</td>
                    <td>{{order.amount}}</td>
                    <td>{{order.payment_type}}</td>
                    <td>{{order.status}}</td>
                    <td>{{order.date}}</td>
                    <td class="text-right">
                      <button class="btn btn-primary" >Detalle Pedido</button>
                    </td>
              </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
export default {
    data() {
        return {
            purchase_orders: []
        };
    },
    created () {
    if (!localStorage.signedIn) {
      this.$router.replace('/')
    } else {
      this.$http.secured.get('/api/v1/purchase_orders')
        .then(response => { this.addresses = response.data })
        .catch(error => this.setError(error, 'Something went wrong'))
    }
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
  },
};
</script>
