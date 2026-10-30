import { BASE_URL } from '@/helpers/config';
import axios from 'axios';
import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {
  state: () => ({ 
    user:null,
    isLoggedIn:false,
    access_token:"",
    validationErrors:null,
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
    setUser(user){
        this.user = user
    },
    setAccessToken(token){
        this.access_token=token
    },
    setLoggedIn(){
        this.isLoggedIn=true
    },
    setValidationErrors(errors){
        this.validationErrors=errors
    },
    clearValidationErrors(){
        this.validationErrors=null
    },
    clearAuth(){
        this.user=null,
        this.access_token="",
        this.isLoggedIn=false
    }
  },
})