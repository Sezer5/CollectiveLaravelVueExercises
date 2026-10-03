import { createRouter, createWebHashHistory } from 'vue-router'

const Login = () => import('@/components/Login.vue')
const Home = () => import('@/components/Home.vue')
const Register = () => import('@/components/Register.vue')
const Profile = () => import('@/components/Profile.vue')

const router = createRouter({
  history: createWebHashHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/login',
      name: 'login',
      component: Login,
    },
    {
      path: '/',
      name: 'home',
      component: Home,
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
