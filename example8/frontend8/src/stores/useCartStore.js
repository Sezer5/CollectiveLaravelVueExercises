import { BASE_URL } from '@/helpers/config';
import axios from 'axios';
import { defineStore } from 'pinia'
import { useToast } from 'vue-toastification';
const toast = useToast();
export const useCartStore = defineStore('cart', {
  state: () => ({ 
    isLoading:false,
    cartItems:[],
   }),
  persist:true,
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    addItemToCart(item){
        let index = this.cartItems.findIndex(product => product.product_id === item.product_id && product.color === item.color && product.size === item.size)
        if(index!=-1){
            toast.info('This product already in to your cart',{
                timeout:2000
            });
        }else{
            this.cartItems.push(item);
            toast.success('Product added in to your cart successfully',{
                timeout:2000
            });
        }
    },

    incrementItem(item){
        let index = this.cartItems.findIndex(product => product.product_id === item.product_id && product.color === item.color && product.size === item.size)
        if(this.cartItems[index].Qty<item.maxQty){
            this.cartItems[index].Qty +=1
            toast.success('Product added in to your cart successfully',{
                timeout:2000
            });
        }else{
            toast.success(`Only ${item.maxQty} item available`,{
                timeout:2000
            });
        }
    },

    decrementItem(item){
        let index = this.cartItems.findIndex(product => product.product_id === item.product_id && product.color === item.color && product.size === item.size)
        
        this.cartItems[index].Qty -=1;

        if(this.cartItems[index].Qty <= 0){
            this.cartItems = this.cartItems.filter(product => product.product_id !== item.product_id && product.color !== item.color && product.size !== item.size)
        }
    },

    deleteItem(item){
        this.cartItems = this.cartItems.filter(product => product.product_id !== item.product_id && product.color !== item.color && product.size !== item.size)
        toast.success(`Product deleted successfully`,{
                timeout:2000
            });
        
    },

    deleteCart(){
        this.cartItems = [];
        toast.success(`Cart deleted successfully`,{
                timeout:2000
            });
        
    },
  },
})