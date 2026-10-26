import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: () => import('@/components/Home.vue'),
    },
    {
      path: '/productdetail/:slug',
      name: 'productdetail',
      component: () => import('@/components/product/ProductDetail.vue'),
    },
  ],
})

export default router
