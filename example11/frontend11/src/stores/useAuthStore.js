import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {
  state: () => ({ 
    user:null,
    access_token:'',
    isLoggedIn:false,
    isLoading:false,
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
    setLoggedOut(){
      this.isLoggedIn=false
    },
    setValidationErrors(error){
      this.validationErrors=error
    },
    clearValidationErrors(){
      this.validationErrors=null
    },
    clearAuth(){
      this.user=null,
      this.access_token=''
    }
  },
})