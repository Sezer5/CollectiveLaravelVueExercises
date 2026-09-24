import { useAuthStore } from '@/stores/useAuthStore'
import { createRouter, createWebHashHistory } from 'vue-router'

const AdminHome = () => import('@/components/admin/AdminHome.vue')
const AdminLogin = () => import('@/components/admin/AdminLogin.vue')
const Home = () => import('@/components/user/Home.vue')

function isAdminUser(){
  const authStore = useAuthStore();
  const hasAdminRole = authStore.user?.roles?.some(role => role.name === 'admin')
  
  if (hasAdminRole) {
    return true // Sayfaya geçişe izin ver
  } else {
    authStore.clearAuth()
    return '/admin/login' // Login sayfasına yönlendir
  }
}

function redirectIfAuthenticated() {
  const authStore = useAuthStore()

  // Kullanıcı zaten giriş yapmışsa ve token/user bilgisi varsa
  if (authStore.user) {
    // Admin yetkisi varsa admin paneline, yoksa ana sayfaya yönlendir
    const isAdmin = authStore.user?.roles?.some(role => role.name === 'admin')
    return isAdmin ? '/admin/home' : '/'
  }

  // Giriş yapmamışsa login sayfasında kalmasına izin ver
  return true
}

const router = createRouter({
  history: createWebHashHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/admin/home',
      name: 'adminhome',
      component: AdminHome,
      beforeEnter:[isAdminUser]
    },
    {
      path: '/admin/login',
      name: 'adminlogin',
      component: AdminLogin,
      beforeEnter:[redirectIfAuthenticated]
    },
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    
  ],
})

export default router
