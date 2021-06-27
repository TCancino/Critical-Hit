<template>
  <div>
    <li v-for="rating in ratingsArray" :key="rating.id">Valor:{{rating.value}} Comentario: {{rating.comment}}</li>
  </div>
</template>

<script>
export default {
  name: 'Ratings',
  props: {
    ratings: Array
  },
  data () {
    return {
      ratingsArray: this.ratings,
      error: ''
    }
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    }
  }
}
</script>
