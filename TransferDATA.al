page 50110 "DATA Transfer"
{
    PageType = Card;
    ApplicationArea = All;
    Caption = 'DATA Transfer';
    UsageCategory = Administration;
    SourceTable = Contact;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = All;

                }
                field(Name; rec.Name)
                {
                    ApplicationArea = all;
                }
                field(Address; rec.Address)
                {
                    ApplicationArea = all;
                }
                field(City; rec.City)
                {
                    ApplicationArea = all;
                }
                field("Phone No."; rec."Phone No.")
                {
                    ApplicationArea = all;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = all;
                }
                field("Post Code"; rec."Post Code")
                {
                    ApplicationArea = all;
                }
                field(Image; rec.Image)
                {
                    ApplicationArea = all;

                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Transfer)
            {
                ApplicationArea = All;
                Image = TransferOrder;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction()
                begin
                    contactTable.Reset();
                    IF CompanyName = 'Entrust Capitals (UAT)' then
                        ContactTable.CHANGECOMPANY('EC UAT (Copy)');
                    IF NOT ContactTable.GET(rec."No.") THEN BEGIN
                        ContactTable.TRANSFERFIELDS(rec);
                        ContactTable.INSERT;
                    END;

                    Message('data transfer');
                end;

            }

        }

    }


    var
        contactTable: Record Contact;
        Companies: Record Company;

}