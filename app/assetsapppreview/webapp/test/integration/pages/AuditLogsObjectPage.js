sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'assetsapppreview',
            componentId: 'AuditLogsObjectPage',
            contextPath: '/Assets/logs'
        },
        CustomPageDefinitions
    );
});