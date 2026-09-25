import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {
  state: () => ({ 
    isLoading:false,
    isLoggedIn:false,
    isAdmin:false,
    user:null,
    access_token:'',
    validationErrors:null
   }),
  persist:true,
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    setLoggedIn(){
        this.isLoggedIn = true
    },
    setUser(user){
        this.user = user;
        const temp = user?.roles?.some(role => role.name === 'admin');
        if(temp){
            this.isAdmin = true
        }else{
            this.isAdmin = false
        }
    }
  },
})