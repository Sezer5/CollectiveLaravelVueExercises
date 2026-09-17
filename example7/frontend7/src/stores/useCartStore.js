import { defineStore } from 'pinia'
import { BASE_URL } from '@/helpers/config'
import { useToast } from 'vue-toastification'

const toast = useToast();
export const useCartStore = defineStore('cart', {
  state: () => ({ 
    cartItems:[],
    isLoading:false
   }),
   persist: true,
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    addItem(item){
      let index = this.cartItems.findIndex(product => product.product_id === item.product_id && product.color === item.color && product.size === item.size)
      if(index !== -1){
        toast.info('Product already in your cart!',{
          timeout:2000
        })
      }else{
        this.cartItems.push(item);
        toast.success('Product added in your cart!',{
          timeout:2000
        })
      }
    },
    incrementItem(item){
        let index = this.cartItems.findIndex(product=> product.color === item.color && product.size === item.size && product.product_id === item.product_id)

        if(this.cartItems[index].Qty<item.maxQty){
            this.cartItems[index].Qty +=1;
            toast.success(`${item.name} added in your cart!`, {
                timeout: 2000
            });
        }else{
            toast.success(`Only ${item.maxQty} product available!`, {
                timeout: 2000
            });
        }
    },
    decrementItem(item){
        let index = this.cartItems.findIndex(product =>product.product_id === item.product_id
            && product.color === item.color && product.size === item.size
        )

        // if product exist 

        if(index !== -1){
            this.cartItems[index].Qty -=1
            if(this.cartItems[index].Qty === 0){
                this.cartItems = this.cartItems.filter(product => product.ref !== item.ref)
            }
        }
    },
    deleteItemToCart(item){
      this.cartItems = this.cartItems.filter(product => product.ref !== item.ref)
    },
    emptyToYourCart(){
      this.cartItems = [];
      toast.success('Item deleted successfully',{
        timeout:2000
      })
    }
  },
})
