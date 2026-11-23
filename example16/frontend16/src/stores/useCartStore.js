import { BASE_URL } from '@/helpers/config'
import axios from 'axios'
import { defineStore } from 'pinia'
import { useToast } from 'vue-toastification'

export const useCartStore = defineStore('cart', {
  state: () => ({ 
    cartItems:[],
    total:0,
   }),
   persist:{
    enabled:true,
    storage:sessionStorage
   },
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    addItem(item){
      const toast = useToast()
      let index = this.cartItems.findIndex(product => product.color === item.color && product.size === item.size && product.product_id === item.product_id)
      if(index!=-1){
        toast.info(`${item.name} is already in your cart`,{
          timeout:2000
        })
      }else{
        this.cartItems.push(item);
        toast.success(`${item.name} added in your cart`,{
          timeout:2000
        })
      }
    },
    increaseItem(item){
      const toast = useToast()
      let index = this.cartItems.findIndex(product => product.color === item.color && product.size === item.size && product.product_id === item.product_id)
      if(index!=-1){
        
        this.cartItems[index].quantity += 1 
        if(this.cartItems[index].quantity <= this.cartItems[index].maxquantity){
          toast.success(`${item.name} added in your cart`,{
            timeout:2000
          })
        }else{
          this.cartItems[index].quantity -= 1 
          toast.danger(`${item.name} added in your cart`,{
            timeout:2000
          })
        }

      }
    },

    decreaseItem(item){
      const toast = useToast()
      let index = this.cartItems.findIndex(product => product.color === item.color && product.size === item.size && product.product_id === item.product_id)
      if(index!=-1){
        
        this.cartItems[index].quantity -= 1 
        if(this.cartItems[index].quantity === 0){
          this.cartItems = this.cartItems.filter(product => product.unique_id !== item.unique_id)
          toast.success(`${item.name} deleted in your cart`,{
            timeout:2000
          })
        }else{
          
          toast.info(`${item.name} decrease in your cart`,{
            timeout:2000
          })
        }

      }
    },

    deleteItem(item){
      const toast = useToast()
      let index = this.cartItems.findIndex(product => product.color === item.color && product.size === item.size && product.product_id === item.product_id)
      if(index!=-1){
        this.cartItems = this.cartItems.filter(product => product.unique_id !== item.unique_id)
          toast.success(`${item.name} deleted in your cart`,{
            timeout:2000
          })
        
        

      }
    },

    deleteCart(){
      const toast = useToast()
      this.cartItems = [];
      
          toast.success(`Cart deleted successfully`,{
            timeout:2000
          })
    },
  },
})