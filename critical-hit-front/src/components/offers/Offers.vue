<template>
  <div class="container">
    <h3 class="p-3 text-center">Ofertas</h3>
    <table class="table table-striped table-bordered">
      <thead>
          <tr>
              <th>Nombre</th>
              <th>Monto</th>
              <th>Nombre</th>
              <th>Monto</th>
          </tr>
      </thead>
      <tbody>
        <tr v-for="offer in offers" v-bind:key="offer.id">
          <td>{{offer.name}}</td>
          <td>{{offer.ammount}}</td>
          <td>{{offer.star_date}}</td>
          <td>{{offer.end_date}}</td>
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
    }
  },
}
</script>
