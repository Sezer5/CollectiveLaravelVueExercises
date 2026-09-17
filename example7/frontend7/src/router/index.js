import { useAuthStore } from '@/stores/useAuthStore'
import { createRouter, createWebHashHistory } from 'vue-router'

const Home = () => import('@/components/Home.vue')
const Product = () =>import('@/components/product/Product.vue')
const Cart = () => import('@/components/cart/Cart.vue')
const Register = () => import('@/components/auth/Register.vue')
const Login = () => import('@/components/auth/Login.vue')
const Profile = () => import('@/components/profile/Profile.vue')

function isLoggedInUser(){
  const authStore = useAuthStore();
  if(authStore.isLoggedIn){
    return '/'
  }
}

function isNotLoggedInUser(){
  const authStore = useAuthStore();
  if(!authStore.isLoggedIn){
    return '/login'
  }
}

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
    {
      path: '/login',
      name: 'login',
      component: Login,
      beforeEnter:[isLoggedInUser]
    },
    {
      path: '/register',
      name: 'register',
      component: Register,
      beforeEnter:[isLoggedInUser]
    },
    {
      path: '/profile',
      name: 'profile',
      component: Profile,
      beforeEnter:[isNotLoggedInUser]
    },
    
  ],
})

export default router
