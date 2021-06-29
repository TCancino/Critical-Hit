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
import Addresses from '@/components/controlPanel/Addresses.vue'
import AddressForm from '@/components/controlPanel/AddressForm.vue'
import Subscriptions from '@/components/controlPanel/Subscriptions.vue'
import PurchaseOrders from '@/components/controlPanel/PurchaseOrders.vue'
import Inventory from '@/components/inventory/Inventory.vue'
import ControlPanel from '@/components/controlPanel/ControlPanel.vue'
import CartForm from '@/components/shoppingCart/CartForm.vue'
import Category from '@/components/inventory/Category.vue'
import CreateCategory from '@/components/inventory/CreateCategory.vue'
import Offers from '@/components/offers/Offers.vue'

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
      path: '/inventario',
      name: 'Inventario',
      component: Inventory
    },
    {
      path: '/create_product',
      name: 'Create Product',
      component: CreateProduct
    },
    {
      path: '/product/:id',
      name: 'Product',
      component: Product,
      props: true
    },
    {
      path: '/edit_form',
      name: 'Edit Form',
      component: EditForm
    },
    {
      path: '/addresses',
      name: 'Addresses',
      component: Addresses
    },
    {
      path: '/addresses/new',
      name: 'New address',
      component: AddressForm
    },
    {
      path: '/subscriptions',
      name: 'Subscriptions',
      component: Subscriptions
    },
    {
      path: '/purchase_orders',
      name: 'Purchase Orders',
      component: PurchaseOrders
    },
    {
      path: '/control_panel',
      name: 'Control panel',
      component: ControlPanel,
      props: true
    },
    {
      path: '/cart_form',
      name: 'Cart Form',
      component: CartForm
    },
    {
      path: '/categories',
      name: 'Category',
      component: Category
    },
    {
      path: '/create_category',
      name: 'Create Category',
      component: CreateCategory
    },
    {
      path: '/offers',
      name: 'Offers',
      component: Offers
    }
  ]
})
