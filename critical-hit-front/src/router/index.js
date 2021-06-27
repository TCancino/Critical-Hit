import Vue from 'vue'
import Router from 'vue-router'
import Signin from '@/components/Login/Signin.vue'
import Signup from '@/components/Login/Signup.vue'
import Records from '@/components/records/Records.vue'
import Artists from '@/components/artists/Artists.vue'
import LandingPage from '@/components/home/LandingPage.vue'
import Catalog from '@/components/catalog/Catalog.vue'
import Product from '@/components/catalog/Product.vue'
import CreateProduct from '@/components/inventory/CreateProduct.vue'
import EditForm from '@/components/controlPanel/EditForm.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/artists',
      name: 'Artists',
      component: Artists
    },
    {
      path: '/records',
      name: 'Records',
      component: Records
    },
    {
      path: '/',
      name: 'Signin',
      component: Signin
    },
    {
      path: '/signup',
      name: 'Signup',
      component: Signup
    },
    {
      path: '/home',
      name: 'LandingPage',
      component: LandingPage
    },
    {
      path: '/catalogo',
      name: 'Catalog',
      component: Catalog
    },
    {
      path: '/create_product',
      name: 'Create Product',
      component: CreateProduct
    },
    {
      path: '/product/:id',
      name: 'Product',
      component: Product
    },
    {
      path: '/edit_form',
      name: 'Edit Form',
      component: EditForm
    }
  ]
})
