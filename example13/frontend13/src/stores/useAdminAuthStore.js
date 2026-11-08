import { defineStore } from 'pinia'
export const useAdminAuthStore = defineStore('adminauth', {
  state: () => ({ 
    admin:null,
    admin_access_token:"",
    isLoggedIn:false,
    isLoading:false,
    validationErrors:null
   }),
  persist:{
    enabled:true,
    storage:sessionStorage
  },
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    setAdmin(admin){
      this.admin=admin
    },
    setAdminAccessToken(token){
      this.admin_access_token=token
    },
    setIsloggedIn(){
      this.isLoggedIn=true
    },
    setValidationErrors(error){
      this.validationErrors=error
    },
    clearValidationErrors(){
      this.validationErrors=null
    },
    clearAuth(){
      this.admin=null,
      this.admin_access_token="",
      this.isLoggedIn=false
    }
  },
})