import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {
  state: () => ({ 
    user:null,
    access_token:'',
    isLoggedIn:false,
    validationErrors:null
   }),
  persist:true,
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    setUser(user){
        this.user=user
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
        this.validationErrors = null
    },
    clearAuthData(){
        this.user=null,
        this.access_token=''
    },
    clearLoggedIn(){
        this.isLoggedIn=false
    }
  },
})