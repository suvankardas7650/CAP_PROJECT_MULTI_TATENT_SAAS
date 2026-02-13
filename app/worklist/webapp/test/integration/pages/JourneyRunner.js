sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"worklist/test/integration/pages/TenantsList",
	"worklist/test/integration/pages/TenantsObjectPage",
	"worklist/test/integration/pages/AssetsObjectPage"
], function (JourneyRunner, TenantsList, TenantsObjectPage, AssetsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('worklist') + '/test/flp.html#app-preview',
        pages: {
			onTheTenantsList: TenantsList,
			onTheTenantsObjectPage: TenantsObjectPage,
			onTheAssetsObjectPage: AssetsObjectPage
        },
        async: true
    });

    return runner;
});

