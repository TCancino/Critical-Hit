<template>
  <div class="container">
    <h3 class="p-3 text-center">Ofertas</h3>
    <table style="width:100%"  class=" table table-striped table-bordered container">
      <thead>
          <tr>
              <th style="width: 30%;">Nombre</th>
              <th style="width: 20%;">Monto</th>
              <th style="width: 10%;">Fecha de inicio</th>
              <th style="width: 10%;">Fecha de término</th>
              <th style="width: 5%;">Editar</th>
              <th style="width: 5%;">Borrar</th>
          </tr>
      </thead>
      <tbody>
        <tr v-for="offer in offers" v-bind:key="offer.id">
          <td style="width: 30%;">{{offer.name}}</td>
          <td style="width: 20%;">{{offer.ammount}}</td>
          <td style="width: 10%;" >{{offer.start_date}}</td>
          <td style="width: 10%;">{{offer.end_date}}</td>
          <td style="width: 5%;">
            <button>
              <font-awesome-icon icon="edit" @click="$router.push(`/offer/${offer.id}/edit`)" />
            </button>
          </td>
          <td style="width: 5%;">
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
  name: 'Offers',
  data() {
    return {
      offers: []
    };
  },
  created () {
    if (!localStorage.signedIn) {
      this.$router.replace('/')
    } else {
      this.$http.secured.get('/api/v1/offers')
        .then(response => { this.offers = response.data })
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

<style >
  table, th, td {
      border: 1px solid black;
  }
  table th, table td {
    width: 50%;
    text-align: left;

  }
  table th {
    text-align: left;
  }
</style>