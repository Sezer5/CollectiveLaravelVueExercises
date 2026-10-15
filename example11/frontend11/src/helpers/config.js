export const BASE_URL = 'http://127.0.0.1:8000'

export const headerConfig = (token,contentType) => {
    const config = {
        headers:{
            "Authorization":`Bearer ${token}`,
            "Content-Type":contentType || "application/json"
        }
    }

    return config
}