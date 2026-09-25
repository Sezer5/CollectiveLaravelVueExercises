import { createRouter, createWebHistory } from 'vue-router'

const AdminHome = () => import('@/components/admin/Home.vue')
const AdminLogin = () => import('@/components/admin/Login.vue')

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/admin/home',
      name: 'adminhome',
      component: AdminHome,
    },
    {
      path: '/admin/login',
      name: 'adminlogin',
      component: AdminLogin,
    },
    
  ],
})

export default router
