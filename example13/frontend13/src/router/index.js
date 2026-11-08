import { createRouter, createWebHistory } from 'vue-router'

const AdminHome = () => import('@/components/admin/Home.vue')
const AdminLogin = () => import('@/components/admin/Login.vue')
const UserHome = () => import('@/components/user/Home.vue')

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/user/home',
      name: 'userhome',
      component: UserHome,
    },
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
    // {
    //   path: '/about',
    //   name: 'about',
    //   // route level code-splitting
    //   // this generates a separate chunk (About.[hash].js) for this route
    //   // which is lazy-loaded when the route is visited.
    //   component: () => import('../views/AboutView.vue'),
    // },
  ],
})

export default router
