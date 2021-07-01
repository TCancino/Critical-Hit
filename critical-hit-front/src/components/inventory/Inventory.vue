<template>
    <div class="container">
        <h3 class="p-3 text-center">Inventario</h3>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th style="width: 20%;">Nombre</th>
                    <th style="width: 10%;">Precio</th>
                    <th style="width: 10%;">SKU</th>
                    <th style="width: 15%;">Código de barra</th>
                    <th style="width: 10%;">Estado</th>
                    <th style="width: 5%;">Stock</th>
                    <th style="width: 5%;">Editar</th>
                    <th style="width: 5%;" >Borrar</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="product in products" v-bind:key="product.id">
                    <td style="width: 20%;">{{product.name}}</td>
                    <td style="width: 10%;">{{product.price}}</td>
                    <td style="width: 10%;">{{product.sku}}</td>
                    <td style="width: 15%;">{{product.barcode}}</td>
                    <td style="width: 10%;">{{product.status}}</td>
                    <td style="width: 5%;">{{product.stock}}</td>
                    <td style="width: 5%;">
                      <button>
                        <font-awesome-icon @click="$router.push(`/product/${product.id}/edit`)" icon="edit" />
                      </button>
                    </td>
                    <td style="width: 5%;">
                      <button>
                        <font-awesome-icon icon="trash" @click="destroyProduct(product.id)" />
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
    destroyProduct(product) {
      console.log(product)
      this.$http.secured.delete(`/api/v1/products/${product}`)
      .then(response => {
        this.products.splice(this.products.indexOf(product),1)
      })
      .catch(error => this.setError(error, 'No se pudo eliminar el produccto'))
    },
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
  },
}
</script>
