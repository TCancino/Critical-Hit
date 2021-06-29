<template>
  <div class="row">
    <div class="vertical-menu col-md-3">
      <a class="active">{{user.username.toUpperCase()}} <font-awesome-icon icon="dice-d20" /></a>
      <a href="#" @click="options='addresses'">Dirección </a>
      <a href="#" @click="options='edit_form'">Mis datos</a>
      <a href="#" @click="options='subscription'">Mis subscripciones</a>
      <a href="#" @click="options='purchase_orders'">Historial de compras</a>
    </div>
    <div class="col-md-9">
      <Subscriptions v-if="options=='subscription'">
      </Subscriptions>
      <PurchaseOrders v-if="options=='purchase_orders'">
      </PurchaseOrders>
      <EditForm v-if="options=='edit_form'">
      </EditForm>
      <Addresses v-if="options=='addresses'">
      </Addresses>
    </div>
  </div>
</template>

<script>
import Subscriptions from '@/components/controlPanel/Subscriptions.vue'
import PurchaseOrders from '@/components/controlPanel/PurchaseOrders.vue'
import EditForm from '@/components/controlPanel/EditForm.vue'
import Addresses from '@/components/controlPanel/Addresses.vue'
export default {
  name: 'ControlPanel',
  components: {
    Subscriptions,
    PurchaseOrders,
    EditForm,
    Addresses
  },
  props:{option: String},
  data() {
    return {
      user: {
      username: "Usuario"},
      options: this.option
    }
  },

}
</script>

<style>
.vertical-menu {
  width: 200px;
  height: 2000px;
}

.vertical-menu a {
  background-color: #eee;
  color: black;
  display: block;
  padding: 10px ;
  text-decoration: none;
}

.vertical-menu a:hover {
  background-color: #ccc;
}

.vertical-menu a.active {
  background-color: #04AA6D;
  color: white;
}
</style>
