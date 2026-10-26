import { BASE_URL } from '@/helpers/config';
import axios from 'axios';
import { defineStore } from 'pinia'

export const useProductStore = defineStore('product', {
  state: () => ({ 
    products:[],
    categories:[],
    colors:[],
    sizes:[],
    productDetail:false,
    isLoading:false
   }),
  persist:{
    enabled:true,
    storage:sessionStorage
  },
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    async fecthAllProducts(){
        this.isLoading = true;
        try {
            const response = await axios.get(`${BASE_URL}/api/product/index`)
            this.products = response.data.data
            this.categories = response.data.categories
            this.colors = response.data.colors
            this.sizes = response.data.sizes
            this.isLoading = false

        } catch (error) {
            console.log(error)
            this.isLoading = false
        }
    },
    async fecthProductsCategories(category){
        this.isLoading = true;
        try {
            const response = await axios.get(`${BASE_URL}/api/product/${category}/category`)
            this.products = response.data.data
            this.categories = response.data.categories
            this.colors = response.data.colors
            this.sizes = response.data.sizes
            this.isLoading = false

        } catch (error) {
            console.log(error)
            this.isLoading = false
        }
    },
    async fecthProductsColor(color){
        this.isLoading = true;
        try {
            const response = await axios.get(`${BASE_URL}/api/product/${color}/color`)
            this.products = response.data.data
            this.categories = response.data.categories
            this.colors = response.data.colors
            this.sizes = response.data.sizes
            this.isLoading = false

        } catch (error) {
            console.log(error)
            this.isLoading = false
        }
    },
    async fecthProductsSize(size){
        this.isLoading = true;
        try {
            const response = await axios.get(`${BASE_URL}/api/product/${size}/size`)
            this.products = response.data.data
            this.categories = response.data.categories
            this.colors = response.data.colors
            this.sizes = response.data.sizes
            this.isLoading = false

        } catch (error) {
            console.log(error)
            this.isLoading = false
        }
    },
    async fecthProductsTerm(term){
        this.isLoading = true;
        try {
            const response = await axios.get(`${BASE_URL}/api/product/${term}/term`)
            this.products = response.data.data
            this.categories = response.data.categories
            this.colors = response.data.colors
            this.sizes = response.data.sizes
            this.isLoading = false

        } catch (error) {
            console.log(error)
            this.isLoading = false
        }
    },
    async fetchProductDetail(product){
        this.isLoading = true;
        try {
            const response = await axios.get(`${BASE_URL}/api/product/${product}/detail`)
            this.productDetail = response.data.data
            this.isLoading = false

        } catch (error) {
            console.log(error)
            this.isLoading = false
        }
    }
  },
})