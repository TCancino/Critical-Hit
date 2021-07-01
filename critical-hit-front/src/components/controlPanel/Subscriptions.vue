<template>
    <div class="container">
        <h3 class="p-3 text-center">Mi Lista de Deseados</h3>
        <div v-show="subscriptions.length === 0" class="text-center">
          Aún no tienes productos en tu lista de deseados
        </div>
        <table v-show="subscriptions.length > 0" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>En Stock</th>
                    <th style="width: 5%;">Eliminar</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="sub in subscriptions" v-bind:key="sub.id">
                    <td>{{sub.product.name}}</td>
                    <td>{{sub.product.status}}</td>
                    <td style="width: 5%;">
                      <button @click="destroySub(sub.subscription_id)">
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
            subscriptions: []
        };
    },
    created () {
    if (!localStorage.signedIn) {
      this.$router.replace('/')
    } else {
      this.$http.secured.get('/api/v1/subscriptions')
        .then(response => { this.subscriptions = response.data })
        .catch(error => this.setError(error, 'Something went wrong'))
    }
  },
  methods: {
    destroySub(sub) {
      console.log(sub)
      this.$http.secured.delete(`/api/v1/subscriptions/${sub}`)
      .then(response => {
        this.subscriptions.splice(this.subscriptions.indexOf(sub),1)
      })
      .catch(error => this.setError(error, 'Cannot delete subscription'))
    },
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
  },
};
</script>
