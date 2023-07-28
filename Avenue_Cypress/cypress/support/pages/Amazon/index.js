/// <reference types="cypress" />

const el = require('./elements').ELEMENTS;

class Amazon{
    mainPage(){
        cy.visit('https://www.amazon.com.br/');
    }

    addProductstoCar(product, content){
        cy.get(el.searchbox).type(product);
        cy.get(el.searchbutton).click();
        cy.contains(content).click();
        cy.get(el.addtocartbutton).click();
    }

    validateCar(){
        cy.contains('Adicionado ao carrinho').should('be.visible')
    }

    validateProductsSum(){
        cy.visit(el.urlcar)
        cy.get('[data-name="Active Items"]').find('[data-itemid]').should('have.length', 3)

        let total = 0
        cy.get('[data-name="Active Items"]')
        .find('[data-itemid]')
        .each(($el) => {
        total += $el.data('price')
        })
        cy.get('[id="sc-subtotal-amount-activecart"]').then(() => {
         const totalPrice = new Intl.NumberFormat('pt-BR', { minimumFractionDigits: 2 }).format(total)
         cy.contains(totalPrice) })

         cy.contains('Subtotal (3 itens)').should('be.visible')
    }

    createAccount(){
        cy.get(el.loginbutton).click();
        cy.get(el.createaccountbutton).click();
        cy.get(el.customername).type('Avenue');
        cy.get(el.customeremail).type('avenue@avenue.com');
        cy.get(el.password).type('SenhaAvenue');
        cy.get(el.passwordcheck).type('SenhaAvenue');
    }

}

export default new Amazon();