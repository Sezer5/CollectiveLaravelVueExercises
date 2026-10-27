import { BASE_URL } from '@/helpers/config';
import axios from 'axios';
import { defineStore } from 'pinia'
import { useToast } from 'vue-toastification';

const toast = useToast()

export const useCartStore = defineStore('cart', {
  state: () => ({ 
    cartItems:[],
    isLoading:false
   }),
  persist:{
    enabled:true,
    storage:sessionStorage
  },
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    addItemToCart(item){
        let control = this.cartItems.some(product => product.color === item.color && product.size === item.size && product.product_id === item.product_id);
        if(control===false){
            this.cartItems.push(item);
            toast.success('Item added successfully',{
                timeout:2000
            });
        }else{
            toast.info('Item already in your cart',{
                timeout:2000
            });
        }
        
    },
    increaseItemQty(item){
        let index = this.cartItems.findIndex(product => product.color === item.color && product.size === item.size && product.product_id === item.product_id);
        
        if(this.cartItems[index].qty+1<=item.maxQTY){
            this.cartItems[index].qty+=1;
            toast.success('Item added successfully',{
                timeout:2000
            });
        }else{
            toast.info(`Only ${this.cartItems[index].maxQTY} item available`,{
                timeout:2000
            });
        }
    },
    decreaseItemQty(item){
        let index = this.cartItems.findIndex(product => product.color === item.color && product.size === item.size && product.product_id === item.product_id);
        
        if(this.cartItems[index].qty-1===0){
            this.cartItems = this.cartItems.filter(product => product.ref != this.cartItems[index].ref);
            toast.success('Item deleted successfully',{
                timeout:2000
            });
        }else{
            this.cartItems[index].qty-=1;
            toast.info(`Item decreased successfully`,{
                timeout:2000
            });
        }
    },
    deleteItemToCart(item){
        let index = this.cartItems.findIndex(product => product.color === item.color && product.size === item.size && product.product_id === item.product_id);
        
        
            this.cartItems = this.cartItems.filter(product => product.ref != this.cartItems[index].ref);
            toast.success('Item deleted successfully',{
                timeout:2000
            });
        
    },
    deleteToCart(){
        this.cartItems = [];
        toast.success('Cart deleted successfully',{
                timeout:2000
            });
    },
  },
})