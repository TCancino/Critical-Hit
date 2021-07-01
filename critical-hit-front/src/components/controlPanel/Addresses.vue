<template>
    <div class="container">
        <h3 class="p-3 text-center">Mis Direcciones</h3>
        <div v-show="addresses.length ===0" class="text-center">
          Aún no tienes ninguna dirección creada
        </div>
        <table v-show="addresses.length > 0" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Dirección</th>
                    <th>Casa/Dpto</th>
                    <th>Comuna</th>
                    <th>Ciudad</th>
                    <th>Región</th>
                    <th style="width: 5%;">Editar </th>
                    <th style="width: 5%;">Borrar</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="address in addresses" v-bind:key="address.id">
                    <td>{{address.name}}</td>
                    <td>{{address.address1}}</td>
                    <td>{{address.address2}}</td>
                    <td>{{address.state}}</td>
                    <td>{{address.city}}</td>
                    <td>{{address.region}}</td>
                    <td style="width: 5%;">
                      <button>
                        <font-awesome-icon icon="edit" />
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
      <div class="text-right">
        <button @click="$router.push({path: '/addresses/new'})" class="btn btn-primary" >Agregar Dirección</button>
      </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            addresses: []
        };
    },
    created () {
    if (!localStorage.signedIn) {
      this.$router.replace('/')
    } else {
      this.$http.secured.get('/api/v1/addresses')
        .then(response => { this.addresses = response.data })
        .catch(error => this.setError(error, 'Something went wrong'))
    }
  },
}
</script>
