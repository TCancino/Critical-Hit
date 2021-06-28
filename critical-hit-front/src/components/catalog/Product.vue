<template>
  <div class="card text-center">
    <div class="text-red" v-if="error">{{ error }}</div>
    <div>
      <button type="button" class="btn btn-danger float-right mr-6 mt-3 " >
        Agregar a favoritos <font-awesome-icon icon="heart" />
      </button>
    </div>
    <h1>
      <a style="color:black;"> {{product.name}} </a>
    </h1>
    <p>
      <a style="color:grey;"> SKU:{{product.sku}} </a>
    </p>
    <div style="padding-left: 790px; padding-bottom: 30px;">
      <star-rating :star-size="20"></star-rating>
    </div>
    <div>Precio: ${{ formatPrice(product.price) }}</div>
    <div>Stock: {{product.stock}}</div>
    <div v-if="product.status == 'Disponible'">
      <input v-model="qty" class="form-control input-qty" type="number">
      <button >Agregar al carro</button>
    </div>
    <div v-else-if="product.status == 'Preventa'">
      <button>Reservar</button>
    </div>
    <div v-else style="color:red;">
      No disponible
    </div>
    <div v-on:click="showRatings">Comentarios ({{ratings.length}})</div>
    <Ratings v-if="isHidden" v-bind:ratings="ratings"/>
    <RatingForm></RatingForm>
    <div >
      <b-card no-body>
        <b-tabs card>
          <b-tab title="Descripción" active><p> {{ product.description }} </p></b-tab>
          <b-tab title="Especificaciones" active><p> {{ product.description }} </p></b-tab>
          <b-tab title="Comentarios" ><p v-for="rating in ratings " :key="rating.id">Valor:{{rating.value}} Comentario: {{rating.comment}}</p></b-tab>
          <b-tab title="Términos y condiciónes" ><p>Los consumidores podrán devolver un producto adquirido en Mercado Critical Hit dentro del plazo de 10 días contados desde su recepción, sin necesidad de invocar ninguna causa y siempre y cuando el producto no se haya deteriorado por un hecho imputable al consumidor.
=======
    
    <div>
      <b-tabs content-class="mt-3">
        <b-tab title="Descripción" active><p> {{ product.description }} </p></b-tab>
        <b-tab title="Comentarios" active><p>
          <Ratings v-bind:ratings="ratings"/>
          <RatingForm></RatingForm>
        </p></b-tab>
        <b-tab title="Términos y condiciónes" ><p>Los consumidores podrán devolver un producto adquirido en Mercado Critical Hit dentro del plazo de 10 días contados desde su recepción, sin necesidad de invocar ninguna causa y siempre y cuando el producto no se haya deteriorado por un hecho imputable al consumidor.
>>>>>>> Stashed changes
          Para ejercer este derecho, el consumidor deberá contactar directamente al respectivo proveedor que le hubiere realizado la venta del producto respecto del cual se quisiera ejercer el derecho de retracto, a efectos de coordinar con él la restitución del producto. Esta restitución podrá ser hecha por alguno 
          de los siguientes mecanismos, a elección del consumidor: a) Entrega del producto en cualquiera de las oficinas de Chilexpress o b) Retiro del producto directamente desde el domicilio del consumidor. Cualquiera sea la modalidad elegida para la restitución del producto, al momento de hacerla efectiva el 
          cliente deberá acompañar la boleta original o cualquier documento que acredite la compra y restituir en buen estado los elementos originales del embalaje, como las etiquetas, certificados de garantía, manuales de uso, cajas, elementos de protección y sus accesorios o pagar su valor respectivo, en caso que haya sido previamente informado. En caso de productos comprados en promoción, se requerirá la entrega de todos ellos, sin perjuicio que el cambio se efectúe sólo respecto a uno de ellos. Garantía legal. Las condiciones para cambios, devoluciones y servicio técnico de los productos que sean adquiridos por los consumidores respecto de un proveedor en la modalidad Mercado Ripley serán las que en cada caso sean informadas por los respectivos proveedores con ocasión de la oferta y/o comercialización de un producto determinado, las que en todo caso no podrán ser inferiores a aquellas establecidas en la Ley Nº 19.496, sobre Protección de los Derechos de los Consumidores.</p></b-tab>
        </b-tabs>
      </b-card>
    </div>
  </div>

</template>

<script>
import Ratings from '@/components/catalog/Ratings.vue'
import RatingForm from '@/components/catalog/RatingForm.vue'
import StarRating from 'vue-star-rating';
export default {
  name: 'Product',
  data () {
    return {
      product: {},
      error: '',
      qty: 1,
      ratings: [],
      isHidden: false
    }
  },
  components: {
    Ratings,
    RatingForm
  },
  created () {
    this.$http.secured.get(`/api/v1/products/${this.$route.params.id}`)
      .then(response => {
        this.product = response.data.product
        this.ratings = response.data.ratings
      })
      .catch(error => this.setError(error, 'Something went wrong'))
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    addToCart(){
        let itemInCart = this.cartItems.filter(item => item.id===this.product.id)
        if (itemInCart){
            itemInCart.qty += itemToAdd.qty
        } else {
            this.cartItems.push(product, qty)
        }
    },
    showRatings(){
      this.isHidden = !this.isHidden
      let itemInCart = this.cartItems.filter(item => item.id===this.product.id)
      if (itemInCart){
        itemInCart.qty += itemToAdd.qty
      } else {
        this.cartItems.push(product, qty)
      }
    },
    formatPrice(value) {
      let val = (value/1).toFixed(0).replace('.', ',')
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
    }
  },
  components: {
    StarRating
  }
}
</script>
