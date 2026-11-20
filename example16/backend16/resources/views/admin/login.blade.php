<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giriş Yap</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-card {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .btn-primary {
            background-color: #40b27f; /* Özel yeşil tonu */
            border: none;
        }
        .btn-primary:hover {
            background-color: #36966b;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="card login-card">
            <div class="card-body">
                <h3 class="text-center mb-4">Giriş Yap</h3>
                
                <form action="{{route('admin.auth')}}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label for="email" class="form-label">E-posta Adresi</label>
                        <input type="email" name="email" class="form-control" id="email" placeholder="adiniz@ornek.com" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="password" class="form-label">Şifre</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="••••••••" required>
                    </div>
                    
                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="remember">
                        <label class="form-check-label" for="remember">Beni Hatırla</label>
                    </div>
                    
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary">Giriş Yap</button>
                    </div>
                </form>
                
                <div class="mt-3 text-center">
                    <small>Hesabınız yok mu? <a href="#" class="text-decoration-none">Kayıt Ol</a></small>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
