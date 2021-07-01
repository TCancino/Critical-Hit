<template>
    <div class="container">
        <h3 class="p-3 text-center">Categorías</h3>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th style="width: 5%;">Editar</th>
                    <th style="width: 5%;">Borrar</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="cat in categories" v-bind:key="cat.id">
                    <td>{{cat.name}}</td>
                    <td>{{cat.description}}</td>
                    <td style="width: 5%;">
                      <button>
                        <font-awesome-icon icon="edit" />
                      </button>
                    </td>
                    <td style="width: 5%;">
                      <button>
                        <font-awesome-icon icon="trash" @click="destroyCat(cat.id)" />
                      </button>
                    </td>
                </tr>
            </tbody>
        </table>
      <div class="text-right">
        <button @click="$router.push({path: '/create_category'})" class="btn btn-primary" >Agregar Categoría</button>
      </div>
    </div>
</template>

<script>
export default {
  name: 'Categories',
  data() {
      return {
          categories: []
      };
    },
  created () {
    if (!localStorage.signedIn) {
      this.$router.replace('/')
    } else {
      this.$http.secured.get('/api/v1/categories')
        .then(response => { this.categories = response.data })
        .catch(error => this.setError(error, 'Something went wrong'))
    }
  },
  methods: {
    destroyCat(category) {
      console.log(category)
      this.$http.secured.delete(`/api/v1/categories/${category}`)
      .then(response => {
        this.categories.splice(this.categories.indexOf(category),1)
      })
      .catch(error => this.setError(error, 'No se pudo eliminar el produccto'))
    },
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
  },
}
</script>
