const cds = require('@sap/cds');

module.exports = cds.service.impl(function () {

    const { Assets, Tenants, AssetTypes } = this.entities;

    /* ===================================================== */
    /*  BEFORE CREATE ASSET                                */
    /* ===================================================== */
    this.before('CREATE', Assets, async (req) => {

        console.log('--- CREATE Asset Hook Triggered ---');
        console.log('Incoming Data:', req.data);

        const asset = req.data;
        const tx = cds.transaction(req);

        //  Check Tenant Exists
        console.log('Checking Tenant ID:', asset.tenant_ID);
        const tenant = await tx.run(
            SELECT.one.from(Tenants).where({ ID: asset.tenant_ID })
        );

        if (!tenant) {
            console.log(' Invalid Tenant');
            req.error(400, 'Invalid Tenant selected.');
        }

        console.log('Tenant Found:', tenant.name);

        //  Check Asset Type Exists
        console.log('Checking Asset Type ID:', asset.assetType_ID);
        const type = await tx.run(
            SELECT.one.from(AssetTypes).where({ ID: asset.assetType_ID })
        );

        if (!type) {
            console.log(' Invalid Asset Type');
            req.error(400, 'Invalid Asset Type selected.');
        }

        console.log('Asset Type Found:', type.name);

        //  Asset value validation
        if (asset.value <= 0) {
            console.log(' Invalid Asset Value');
            req.error(400, 'Asset value must be greater than 0.');
        }

        console.log(' All validations passed');
        console.log('--- End Hook ---\n');
    });

    /* ===================================================== */
    /*  AFTER READ ASSETS                                  */
    /* ===================================================== */
    this.after('READ', Assets, (data, req) => {

        console.log('--- READ Assets Hook Triggered ---');

        if (Array.isArray(data)) {
            data.forEach(asset => {
                console.log(`Fetched Asset: ${asset.assetName} | Status: ${asset.status}`);
            });
        } else if (data) {
            console.log(`Fetched Asset: ${data.assetName}`);
        }

        console.log('--- End READ Hook ---\n');
    });

});
