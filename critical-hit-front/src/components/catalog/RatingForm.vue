<template>
  <div>
    <form action="" @submit,prevent="rateProduct">
      <input type="number" v-model="value" class="input" id="value"/><br>
      <input type="text" v-model="comment" class="input" id="comment"/>
      <input type="submit" value="Add Rating" class="font-sans font-bold px-4 rounded cursor-pointer no-underline bg-green hover:bg-green-dark block w-full py-4 text-white items-center justify-center">
    </form>
  </div>
</template>
<script>
export default {
  name: 'RatingForm',
  data () {
    return {
      error: '',
      value: 0,
      comment: '',
      success: false
    }
  },
  methods: {
    rateProduct () {
      const rating = {value: this.value, comment: this.comment}
      if(rating.value >= 0 && rating.value <= 5 && rating.comment.length > 0){
        this.$http.secured.post('/api/v1/ratings',
        { rating:{
            value: rating.value,
            comment: rating.comment,
            product_id: 1,
            user_id: 1}
        })
        .then(response => this.success = response)
        .catch(error => this.error = error)
      } else {
        this.error = 'Error'
        console.log(this.error)
      }
    },
  }
}
</script>