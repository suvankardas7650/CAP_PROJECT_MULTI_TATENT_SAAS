const cds = require('@sap/cds');

module.exports = cds.service.impl(function () {

    /* ===================================================== */
    /* BUY SUBSCRIPTION */
    /* ===================================================== */
    this.on('buy', 'Subscriptions', async (req) => {
        console.log('Buying plan:', req.data.planName);

        if (!req.data.planName) {
            req.error(400, 'Plan name required.');
        }

        return { message: 'Subscription purchased.' };
    });

    /* ===================================================== */
    /* UPGRADE SUBSCRIPTION */
    /* ===================================================== */
    this.on('upgrade', 'Subscriptions', async (req) => {
        console.log('Upgrading to:', req.data.newPlan);

        return { message: 'Subscription upgraded.' };
    });

    /* ===================================================== */
    /* CANCEL SUBSCRIPTION */
    /* ===================================================== */
    this.on('cancel', 'Subscriptions', async (req) => {
        console.log('Subscription cancelled.');

        return { message: 'Subscription cancelled.' };
    });

});
