export const BASE_URL = 'http://127.0.0.1:8000'

export const headersConfig = (token,contentType) => {
    const config = {
        headers:{
            "Authorization":`Bearer ${token}`,
            "Content-type":contentType || "application/json"
        }
    }
    return config
}