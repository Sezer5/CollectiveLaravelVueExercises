import { BASE_URL } from '@/helpers/config'
import axios from 'axios'
import { defineStore } from 'pinia'

export const useProductStore = defineStore('product', {
  state: () => ({ 
    products:[],
    categories:[],
    colors:[],
    sizes:[],
    productdetail:null,
    isLoading:false
   }),
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    async getAllProducts(){
      this.isLoading = true
      try {
        const response = await axios.get(`${BASE_URL}/api/products`)
        this.products = response.data.data
        this.categories = response.data.categories
        this.colors = response.data.colors
        this.sizes = response.data.sizes
      } catch (error) {
        console.log(error)        
      }finally{
        this.isLoading =false
      }
    },
    async getAllProductsByCategory(category){
      this.isLoading = true
      try {
        const response = await axios.get(`${BASE_URL}/api/products/${category}/category`)
        this.products = response.data.data
        this.categories = response.data.categories
        this.colors = response.data.colors
        this.sizes = response.data.sizes
      } catch (error) {
        console.log(error)        
      }finally{
        this.isLoading =false
      }
    },
    async getAllProductsByColor(color){
      this.isLoading = true
      try {
        const response = await axios.get(`${BASE_URL}/api/products/${color}/color`)
        this.products = response.data.data
        this.categories = response.data.categories
        this.colors = response.data.colors
        this.sizes = response.data.sizes
      } catch (error) {
        console.log(error)        
      }finally{
        this.isLoading =false
      }
    },
    async getAllProductsBySize(size){
      this.isLoading = true
      try {
        const response = await axios.get(`${BASE_URL}/api/products/${size}/size`)
        this.products = response.data.data
        this.categories = response.data.categories
        this.colors = response.data.colors
        this.sizes = response.data.sizes
      } catch (error) {
        console.log(error)        
      }finally{
        this.isLoading =false
      }
    },
    async getAllProductsDetail(product){
      this.isLoading = true
      try {
        const response = await axios.get(`${BASE_URL}/api/products/${product}/product`)
        this.productdetail = response.data.data
      } catch (error) {
        console.log(error)        
      }finally{
        this.isLoading =false
      }
    },
  },
})