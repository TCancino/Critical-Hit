<template>
    <div class="container">
        <h3 class="p-3 text-center">Mi Lista de Deseados</h3>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Estado</th>
                    <th>Eliminar</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="product in products" v-bind:key="product.id">
                    <td>{{product.name}}</td>
                    <td>{{product.status}}</td>
                    <td>
                      <button>
                        <font-awesome-icon icon="trash" />
                      </button>
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
            products: []
        };
    },
    created () {
    if (!localStorage.signedIn) {
      this.$router.replace('/')
    } else {
      this.$http.secured.get('/api/v1/user/1/subscriptions')
        .then(response => { this.subscriptions = response.data })
        .catch(error => this.setError(error, 'Something went wrong'))
    }
  },
};
</script>
