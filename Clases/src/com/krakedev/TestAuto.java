package com.krakedev;

public class TestAuto {

	public static void main(String[] args) {

		// 1.-Instanciamos los dos objetos auto 1 y auto 2
		Auto auto1;
		Auto auto2;
		auto1 = new Auto();
		auto2 = new Auto();

		// 2.- Modificar los atributos
		auto1.marca = "Chevrolet";
		auto1.anio = 2018;
		auto1.precio = (float) 15.000;
		System.out.println("-------------");

		// 2.- Modificar los atributos
		auto2.marca = "Suzuki";
		auto2.anio = 2019;
		auto2.precio = (float) 20.000;

		// 3..-Accedo a los atributos
		// Auto 1
		System.out.println("marca: " + auto1.marca);
		System.out.println("año: " + auto1.anio);
		System.out.println("precio: " + auto1.precio);

		System.out.println("-------------");
		// Auto 2
		System.out.println("marca: " + auto2.marca);
		System.out.println("año: " + auto2.anio);
		System.out.println("precio: " + auto2.precio);

	}
	
	
}
