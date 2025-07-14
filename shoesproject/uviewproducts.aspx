<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="uviewproducts.aspx.cs" Inherits="shoesproject.uviewproducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .product-container {
            display: flex;
            justify-content: center;
            padding: 30px;
        }

        .product-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .product-card {
            width: 200px;
            height: 280px;
            border: 1px solid #000;
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            background-color: #f9f9f9;
            box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
            overflow: hidden;
        }

        .product-card input[type="image"] {
            width: 112px;
            height: 86px;
            border-radius: 5px;
            object-fit: cover;
            display: block;
            margin: 0 auto;
        }

        .product-label {
            font-weight: bold;
            margin-top: 10px;
            color: #333;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .product-price {
            color: green;
            font-size: 14px;
            margin-top: 5px;
        }

        .product-description {
            font-size: 12px;
            color: #555;
            margin-top: 5px;
            height: 40px;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-container">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="category_id" CssClass="product-list" RepeatDirection="Horizontal" RepeatColumns="3">
            <ItemTemplate>
                <div class="product-card">
                    <asp:ImageButton ID="ImageButton1" runat="server"
                        CommandArgument='<%# Eval("product_id") %>'
                        ImageUrl='<%# Eval("product_image") %>'
                        CommandName="SelectItem"
                        OnCommand="ImageButton1_Command1" />

                    <div class="product-label">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("product_name") %>' />
                    </div>

                    <div class="product-price">
                        ₹<asp:Label ID="Label2" runat="server" Text='<%# Eval("product_price") %>' />
                    </div>

                    <div class="product-description">
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("product_description") %>' />
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
