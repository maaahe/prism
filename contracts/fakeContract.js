class PrismSale {
    constructor() {
        this.totalSales = 0
        this.maxSales = 100
        this.owner= "0x.."
        this.charity="0x..."
    }

    canBuy() {
        return this.totalSales < this.maxSales
    }

    hasAccess() {
        ////
    }

    buy () {
        ///
    }
}

new sale = new PrismSale()