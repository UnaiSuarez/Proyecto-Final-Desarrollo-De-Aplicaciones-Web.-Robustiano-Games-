from django.contrib import admin
# from django.contrib.auth.models import User
from django.contrib.auth.admin import UserAdmin
# Register your models here.
from .models import  DLC, Comentario, Desarrolladora, Genre, Mensaje, TarjetaRegalo, Valoracion, Videojuego, Lenguaje, User, ImagenVideojuego, VideoVideojuego

@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ['username','saldo']

@admin.register(Videojuego)
class VideojuegoAdmin(admin.ModelAdmin):
    list_display = ['title', 'muestra_genero', 'precio', 'fecha']
    list_filter = ['genre', 'lenguaje']

@admin.register(Genre)
class GenreAdmin(admin.ModelAdmin):
    pass

@admin.register(Lenguaje)
class LenguajeAdmin(admin.ModelAdmin):
    pass

@admin.register(VideoVideojuego)
class VideoVideojuegoAdmin(admin.ModelAdmin):
    list_display = ['name']

@admin.register(ImagenVideojuego)
class ImagenVideojuego(admin.ModelAdmin):
    list_display = ['name']
    
@admin.register(TarjetaRegalo)
class TarjetaRegaloAdmin(admin.ModelAdmin):
    list_display = ['saldo','codigo','habilitado']

@admin.register(Mensaje)
class MensajesAdmin(admin.ModelAdmin):
    list_display = ['codigo', 'visto', 'fecha', 'emisor', 'receptor']

@admin.register(Desarrolladora)
class DesarrolldaorasAdmin(admin.ModelAdmin):
    list_display = ['nombre', 'contacto', 'tipo']

@admin.register(Comentario)
class ComentarioAdmin(admin.ModelAdmin):
    list_display = ['comentario', 'fecha', 'usuario', 'videojuego']

@admin.register(Valoracion)
class ValoracionAdmin(admin.ModelAdmin):
    list_display = ['valoracion', 'fecha', 'usuario', 'videojuego']

@admin.register(DLC)
class DLCAdmin(admin.ModelAdmin):
    list_display = ['title', 'summary', 'precio', 'videojuego']



