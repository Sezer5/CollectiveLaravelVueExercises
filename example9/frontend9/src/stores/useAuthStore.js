import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {
  state: () => ({ 
    isLoggedIn:false,
    user:null,
    access_token:'',
    validationErrors:null
   }),
  persist:true,
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    setIsLoggedIn(){
        this.isLoggedIn=true
    },
    setUser(user){
        this.user=user
    },
    setToken(token){
        this.access_token=token
    },
    setValidationErrors(errors){
        this.validationErrors=errors
    },
    clearValidationErrors(){
        this.validationErrors=null
    },
    clearAuthData(){
        this.user=null,
        this.access_token='',
        this.isLoggedIn=false
    }
  },
})