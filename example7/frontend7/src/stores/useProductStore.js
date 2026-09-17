import { ref, computed } from 'vue'
import { defineStore } from 'pinia'
import axios from 'axios'
import { BASE_URL } from '@/helpers/config'

export const useProductStore = defineStore('product', {
  state: () => ({ 
    products:[],
    categories:[],
    colors:[],
    sizes:[],
    productDetail:null,
    isLoading:false
   }),
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    async fetchAllProducts(){
      this.isLoading=true
      try {
        const response = await axios.get(`${BASE_URL}/api/products`)
        this.products = response.data.data
        this.categories = response.data.categories
        this.colors = response.data.colors
        this.sizes = response.data.sizes
        this.isLoading=false
      } catch (error) {
        this.isLoading=false
        console.log(error)
      }
    },
    async fetchProductsByCategory(category){
      this.isLoading=true
      try {
        const response = await axios.get(`${BASE_URL}/api/products/${category}/category`)
        this.products = response.data.data
        this.categories = response.data.categories
        this.colors = response.data.colors
        this.sizes = response.data.sizes
        this.isLoading=false
      } catch (error) {
        this.isLoading=false
        console.log(error)
      }
    },
    async fetchProductsByColor(color){
      this.isLoading=true
      try {
        const response = await axios.get(`${BASE_URL}/api/products/${color}/color`)
        this.products = response.data.data
        this.categories = response.data.categories
        this.colors = response.data.colors
        this.sizes = response.data.sizes
        this.isLoading=false
      } catch (error) {
        this.isLoading=false
        console.log(error)
      }
    },
    async fetchProductsBySize(size){
      this.isLoading=true
      try {
        const response = await axios.get(`${BASE_URL}/api/products/${size}/size`)
        this.products = response.data.data
        this.categories = response.data.categories
        this.colors = response.data.colors
        this.sizes = response.data.sizes
        this.isLoading=false
      } catch (error) {
        this.isLoading=false
        console.log(error)
      }
    },
    async fetchProductsByTerm(term){
      this.isLoading=true
      try {
        const response = await axios.get(`${BASE_URL}/api/products/${term}/term`)
        this.products = response.data.data
        this.categories = response.data.categories
        this.colors = response.data.colors
        this.sizes = response.data.sizes
        this.isLoading=false
      } catch (error) {
        this.isLoading=false
        console.log(error)
      }
    },
    async fetchProductDetail(product){
      this.isLoading=true
      try {
        const response = await axios.get(`${BASE_URL}/api/products/${product}/product`)
        this.productDetail = response.data.data
        this.isLoading=false
      } catch (error) {
        this.isLoading=false
        console.log(error)
      }
    }
  },
})
