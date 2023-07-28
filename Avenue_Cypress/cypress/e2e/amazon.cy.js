/// <reference types="cypress" />

import Amazon from "../support/pages/Amazon"

describe('Suite 1 - Carrinho de compras', () => {

    it ('Cenário 1' , () => {
        Amazon.mainPage();
        Amazon.addProductstoCar('girafa chalesco', 'Girafa Pelucia Chalesco para Cães');
        Amazon.validateCar();
    })

    it ('Cenário 2' , () => {
        Amazon.mainPage();
        Amazon.addProductstoCar('girafa chalesco', 'Girafa Pelucia Chalesco para Cães')
        Amazon.addProductstoCar('crocodilo chalesco', 'Crocodilo Pelucia Chalesco para Cães')
        Amazon.addProductstoCar('octopus chalesco', 'Octopus Chalesco para Cães')
        Amazon.validateProductsSum();
    })

})

describe('Suite 2 - Cadastro', () => {

    it ('Cenário 1' , () => {
        Amazon.mainPage();
        Amazon.createAccount();
    })

})