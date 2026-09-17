import { createRouter, createWebHashHistory } from 'vue-router'

const Home = () => import('@/components/Home.vue')
const Product = () =>import('@/components/product/Product.vue')
const Cart = () => import('@/components/cart/Cart.vue')

const router = createRouter({
  history: createWebHashHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/product/:slug',
      name: 'product',
      component: Product,
    },
    {
      path: '/cart',
      name: 'cart',
      component: Cart,
    },
    
  ],
})

export default router
