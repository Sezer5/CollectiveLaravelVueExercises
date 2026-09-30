import { createRouter, createWebHashHistory } from 'vue-router'

const Home = () => import('@/components/Home.vue')
const ProductDetail = () => import('@/components/product/ProductDetail.vue')
const Cart = () => import('@/components/cart/Cart.vue')
const Login = () => import('@/components/Login.vue')
const Register = () => import('@/components/Register.vue')
const Profile = () => import('@/components/profile/Profile.vue')

const router = createRouter({
  history: createWebHashHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/productDetail/:slug',
      name: 'productDetail',
      component: ProductDetail,
    },
    {
      path: '/cart',
      name: 'cart',
      component: Cart,
    },
    {
      path: '/login',
      name: 'login',
      component: Login,
    },
    {
      path: '/register',
      name: 'register',
      component: Register,
    },
    {
      path: '/profile',
      name: 'profile',
      component: Profile,
    },
    
  ],
})

export default router
