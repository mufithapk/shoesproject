<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="uviewproditem.aspx.cs" Inherits="shoesproject.uviewproditem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .product-container {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 30px 0;
        }

        .product-card {
            border: 2px solid #0099CC;
            border-radius: 8px;
            padding: 20px;
            background-color: #f9f9f9;
            width: 500px;
        }

        .product-card img {
            display: block;
            margin: 0 auto 15px;
            height: 133px;
            object-fit: cover;
        }

        .product-label {
            font-weight: bold;
            margin: 5px 0;
            color: #333;
        }

        .quantity-panel {
            margin-top: 20px;
            padding: 10px;
            background-color: #fff0f5;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .quantity-panel label,
        .quantity-panel input {
            display: block;
            margin-bottom: 8px;
        }

        .buttons-container {
            margin-top: 20px;
            display: flex;
            gap: 10px;
        }

        .logout-container {
            margin-top: 40px;
        }

        .btn {
            background-color: #ffccff;
            padding: 6px 12px;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            color: black;
            cursor: pointer;
        }

        .btn-logout {
            background-color: #ff5050;
            color: white;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-container">
        <asp:DataList ID="DataList1" runat="server" BorderColor="#0099CC" BorderStyle="Ridge">
            <ItemTemplate>
                <div class="product-card">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("product_image") %>' />

                    <div class="product-label">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("product_name") %>' ForeColor="Black" />
                    </div>

                    <div class="product-label">
                        Price: ₹<asp:Label ID="Label2" runat="server" Text='<%# Eval("product_price") %>' ForeColor="Black" />
                    </div>

                    <div class="product-label">
                        Description:
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("product_description") %>' ForeColor="Black" />
                    </div>

                    <div class="product-label">
                        Stock Available:
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("stock") %>' ForeColor="Black" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>

    <div class="product-container">
        <asp:Panel ID="Panel2" runat="server" CssClass="quantity-panel" Width="300px">
            <asp:Label ID="Label6" runat="server" Text="Quantity:" Font-Bold="True" ForeColor="Black" />
            <asp:TextBox ID="TextBox1" runat="server" Width="100%" BorderColor="#3366CC" />

            <asp:Label ID="Label8" runat="server" Text="Label" Font-Bold="True" ForeColor="Black" />
            <asp:Label ID="Label9" runat="server" Text="Total price is:" Font-Bold="True" ForeColor="Black" />
            <asp:Label ID="Label7" runat="server" Text="0" Font-Bold="True" ForeColor="Black" />
        </asp:Panel>
    </div>

    <div class="product-container">
        <div class="buttons-container">
            <asp:Button ID="Button1" runat="server" CssClass="btn" Text="Add to Cart" OnClick="Button1_Click" />
            <asp:Button ID="Button3" runat="server" CssClass="btn" Text="View Cart" OnClick="Button3_Click" />
        </div>
    </div>

    <div class="product-container logout-container">
        <asp:Button ID="Button2" runat="server" CssClass="btn btn-logout" Text="Logout" OnClick="Button2_Click" />
    </div>
</asp:Content>
