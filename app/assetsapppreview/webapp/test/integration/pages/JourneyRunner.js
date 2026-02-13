sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"assetsapppreview/test/integration/pages/AssetsList",
	"assetsapppreview/test/integration/pages/AssetsObjectPage",
	"assetsapppreview/test/integration/pages/AuditLogsObjectPage"
], function (JourneyRunner, AssetsList, AssetsObjectPage, AuditLogsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('assetsapppreview') + '/test/flp.html#app-preview',
        pages: {
			onTheAssetsList: AssetsList,
			onTheAssetsObjectPage: AssetsObjectPage,
			onTheAuditLogsObjectPage: AuditLogsObjectPage
        },
        async: true
    });

    return runner;
});

