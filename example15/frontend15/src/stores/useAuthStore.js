import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {
  state: () => ({ 
    user:null,
    access_token:'',
    roles:[],
    isLoggedIn:false,
    isLoading:false,
    validationErrors:null
   }),
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  persist:{
    enabled:true,
    storage:sessionStorage
  },
  actions: {
    
    setUser(user){
      this.user=user
    },
    setAccessToken(token){
      this.access_token=token
    },
    setIsLoggedIn(){
      this.isLoggedIn=true
    },
    setValidationErrors(error){
      this.validationErrors=error
    },
    clearValidationErrors(error){
      this.validationErrors=null
    },
    clearAuth(){
      this.user=null,
      this.access_token='',
      this.roles=[],
      this.isLoggedIn=false
    }

  },
})