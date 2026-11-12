import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {
  state: () => ({ 
    user:null,
    access_token:'',
    roles:[],
    isLoggedIn:false,
    validationErrors:null,
    isLoading:false
   }),
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  persist:{
    enable:true,
    storage:sessionStorage
  },
  actions: {
    setUser(user){
        this.user=user
    },
    setAccessToken(token){
        this.access_token=token
    },
    setRoles(roles){
        this.roles=roles
    },
    setLoggedIn(){
        this.isLoggedIn=true
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
        this.roles=[],
        this.isLoggedIn=false
    }
  },
})