<template>
    <div class="container">
        <h3 class="p-3 text-center">Inventario</h3>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>SKU</th>
                    <th>Código de barra</th>
                    <th>Estado</th>
                    <th>Stock</th>
                    <th>Editar</th>
                    <th>Borrar</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="product in products" v-bind:key="product.id">
                    <td>{{product.name}}</td>
                    <td>{{product.price}}</td>
                    <td>{{product.sku}}</td>
                    <td>{{product.barcode}}</td>
                    <td>{{product.status}}</td>
                    <td>{{product.stock}}</td>
                    <td>
                      <button>
                        <font-awesome-icon @click="$router.push(`/product/${product.id}/edit`)" icon="edit" />
                      </button>
                    </td>
                    <td>
                      <button>
                        <font-awesome-icon icon="trash" />
                      </button>
                    </td>
                </tr>
            </tbody>
        </table>
      <div class="text-right">
        <button @click="$router.push({path: '/create_product'})" class="btn btn-primary" >Agregar Producto</button>
      </div>
    </div>
</template>

<script>
export default {
  name: 'Inventory',
  data() {
      return {
          products: []
      };
    },
  created () {
    if (!localStorage.signedIn) {
      this.$router.replace('/')
    } else {
      this.$http.secured.get('/api/v1/products')
        .then(response => { this.products = response.data })
        .catch(error => this.setError(error, 'Something went wrong'))
    }
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
  },
}
</script>
