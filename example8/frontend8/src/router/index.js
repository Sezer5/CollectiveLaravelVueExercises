import { createRouter, createWebHashHistory } from 'vue-router'

const AdminHome = () => import('@/components/admin/AdminHome.vue')
const Home = () => import('@/components/user/Home.vue')

const router = createRouter({
  history: createWebHashHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/adminhome',
      name: 'adminhome',
      component: AdminHome,
    },
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    
  ],
})

export default router
