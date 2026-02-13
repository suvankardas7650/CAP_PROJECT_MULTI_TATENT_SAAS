using UIService as service from '../../srv/UIService';
annotate service.Tenants with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'category',
                Value : category,
            },
            {
                $Type : 'UI.DataField',
                Label : 'contactNo',
                Value : contactNo,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status',
                Value : status,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'category',
            Value : category,
        },
        {
            $Type : 'UI.DataField',
            Label : 'contactNo',
            Value : contactNo,
        },
        {
            $Type : 'UI.DataField',
            Label : 'status',
            Value : status,
        },
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForIntentBasedNavigation',
            SemanticObject : 'Users',
            Action : 'fullName ',
            Label : 'FullName  Users',
        },
    ],
);

annotate service.Tenants with {
    subscription @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Subscriptions',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : subscription_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'planName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'assetLimit',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'expiryDate',
            },
        ],
    }
};

