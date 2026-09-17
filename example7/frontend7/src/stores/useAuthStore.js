import { defineStore } from 'pinia'
import { BASE_URL } from '@/helpers/config'
import { useToast } from 'vue-toastification'

const toast = useToast();
export const useAuthStore = defineStore('auth', {
  state: () => ({ 
    user:null,
    isLoggedIn:false,
    access_token:'',
    validationErrors:null,
    isLoading:false
   }),
  persist: true,
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    setIsLoggedIn(){
      this.isLoggedIn=true
    },
    setAccessToken(token){
      this.access_token=token
    },
    setUser(user){
      this.user = user
    },
    setValidationErrors(error){
      this.validationErrors=error
    },
    clearValidationErrors(){
      this.validationErrors = null
    },
    clearAuthData(){
      this.validationErrors=null,
      this.user=null,
      this.access_token=''
    }
  },
})
