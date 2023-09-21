package com.krakedev;

public class TestProducto {

	public static void main(String[] args) {

		Producto productoA;
		Producto productoB;
		Producto productoC;
		// Instanciamos 3 objetos de la clase Producto
		productoA = new Producto();
		productoB = new Producto();
		productoC = new Producto();

		// Modificamos los atributos de los productos

		productoA.nombre = "Loratadina";
		productoA.descripcion = "Antialérgico";
		productoA.precio = (float) 1.50;
		productoA.stockActual = 100;

		// Producto B
		productoB.nombre = "Complejo B";
		productoB.descripcion = "Vitamina";
		productoB.precio = (float) 3.50;
		productoB.stockActual = 80;

		// Producto C
		productoC.nombre = "Enterogermina";
		productoC.descripcion = "Estomacal";
		productoC.precio = (float) 2.50;
		productoC.stockActual = 140;
		
		
		//Mostrar valores de los atributos
		//Producto A
		System.out.println("nombre: "+productoA.nombre);
		System.out.println("descripcion : "+productoA.descripcion);
		System.out.println("precio : "+productoA.precio);
		System.out.println("stock : "+productoA.stockActual);
		
		System.out.println("-----------------------");
		
		//Producto B
		System.out.println("nombre: "+productoB.nombre);
		System.out.println("descripcion : "+productoB.descripcion);
		System.out.println("precio : "+productoB.precio);
		System.out.println("stock : "+productoB.stockActual);
		
		
		System.out.println("-----------------------");
		
		//Producto C
		System.out.println("nombre: "+productoC.nombre);
		System.out.println("descripcion : "+productoC.descripcion);
		System.out.println("precio : "+productoC.precio);
		System.out.println("stock : "+productoC.stockActual);
		
		
	}

}
