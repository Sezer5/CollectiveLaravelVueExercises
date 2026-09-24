import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {
  state: () => ({ 
    isLoading:false,
    isLoggedIn:false,
    user:null,
    access_token:'',
    validationErrors:null
   }),
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  persist:true,
  actions: {
    setIsLoggedIn(){
        this.isLoggedIn=true
    },
    setToken(token){
        this.access_token=token
    },
    setUser(user){
        this.user = user
    },
    setValidationErrors(error){
        this.validationErrors=error
    },
    clearValidationErrors(){
        this.validationErrors=null
    },
    clearAuth(){
        this.user=null,
        this.access_token='',
        this.isLoggedIn=false
    }
  },
})