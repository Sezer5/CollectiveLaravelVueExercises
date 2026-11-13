import { useAuthStore } from '@/stores/useAuthStore'
import { createRouter, createWebHistory } from 'vue-router'

// 1. roleController fonksiyonunu EN ÜSTE alıyoruz ki aşağıda çağrıldığında "tanımlandı" olsun
const roleController = (requiredRole) => {
  // beforeEnter callback'i içinde döndürüyoruz ki Pinia aktive olduktan sonra çalışsın
  return (to, from) => {
    const authStore = useAuthStore() // Pinia burada güvenle çağrılır
    
    // Kullanıcının rolleri yüklenmemiş veya dizi boş olabilir, güvenli kontrol ekleyelim
    const roles = authStore.roles || []
    const flag = roles.some(role => requiredRole === role.name)

    if (flag) {
      return true // Yetki var, geçişe izin ver
    } else {
      return { name: 'login' } // Yetki yoksa login'e veya unauthorized sayfasına yönlendir
    }
  }
}

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: () => import('@/components/Home.vue'),
      
    },
    {
      path: '/profile',
      name: 'profile',
      component: () => import('@/components/Profile.vue'),
      beforeEnter: [roleController('user')] 
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('@/components/Login.vue'),
    },
  ],
})

export default router