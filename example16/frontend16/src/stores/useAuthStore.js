import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {
  state: () => ({ 
    user:null,
    access_token:'',
    isLoggedIn:false,
    roles:[],
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
      this.isLoggedIn = true
    },
    setRoles(roles){
      this.roles = roles
    },
    setValidationErrors(error){
      this.validationErrors = error
    },
    clearValidationError(){
      this.validationErrors = null
    },
    clearAuth(){
      this.user = null,
      this.access_token = '',
      this.roles = [],
      this.isLoggedIn=false

    }
  },
})