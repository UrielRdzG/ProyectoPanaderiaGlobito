/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validarN(e) {
	var teclado = (document.all) ? e.KeyCode : e.which;
	if (teclado == 8) return true;
	var patron = /^[0-9]+$/;
	var tecla = String.fromCharCode(teclado);
	return patron.test(tecla);
}

function validarL(e) {
	var teclado = (document.all) ? e.KeyCode : e.which;
	if (teclado == 8) return true;
	var patron = /^[A-Za-z ]+$/;
	var tecla = String.fromCharCode(teclado);
	return patron.test(tecla);
}

function validarLN(e) {
	var teclado = (document.all) ? e.KeyCode : e.which;
	if (teclado == 8) return true;
	var patron = /[0-9a-zA-Z]/;
	var tecla = String.fromCharCode(teclado);
	return patron.test(tecla);
}

function validarND(e) {
	var teclado = (document.all) ? e.KeyCode : e.which;
	if (teclado == 8) return true;
	var patron = /^[-+]?[0-9]+\.[0-9]+$/;
	var tecla = String.fromCharCode(teclado);
	return patron.test(tecla);
}

