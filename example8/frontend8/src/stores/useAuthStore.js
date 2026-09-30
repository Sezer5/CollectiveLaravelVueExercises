import { BASE_URL } from '@/helpers/config';
import axios from 'axios';
import { defineStore } from 'pinia'
import { useToast } from 'vue-toastification';
const toast = useToast();
export const useAuthStore = defineStore('auth', {
  state: () => ({ 
    isLoading:false,
    isLoggedIn:false,
    user:null,
    access_token:'',
    validationErrors:[],
   }),
  persist:true,
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    setUser(user){
        this.user=user
    },
    setToken(token){
        this.access_token=token
    },
    setLoggedIn(){
        this.isLoggedIn=true
    },
    setValidationErrors(error){
        this.validationErrors = error
    },
    clearValidationErrors(){
        this.validationErrors = null
    },
    clearAuthData(){
        this.user = null,
        this.access_token='',
        this.isLoggedIn=false
    }
    
  },
})