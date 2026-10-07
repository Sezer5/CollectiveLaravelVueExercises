import { createRouter, createWebHashHistory } from 'vue-router'
const Home = () => import('@/components/admin/Home.vue')
const Login = () => import('@/components/admin/Login.vue')
const Register = () => import('@/components/admin/Register.vue')
const router = createRouter({
  history: createWebHashHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
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
    
  ],
})

export default router
