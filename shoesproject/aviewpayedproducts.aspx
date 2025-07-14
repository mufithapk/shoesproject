<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aviewpayedproducts.aspx.cs" Inherits="shoesproject.aviewpayedproducts" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paid Product Orders</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 900px;
            margin: auto;
        }

        .order-card {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .order-row {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
        }

        .label {
            font-weight: bold;
            color: #333;
            width: 150px;
        }

        .value {
            color: #555;
        }

        .order-button {
            margin-top: 15px;
        }

        .order-title {
            font-size: 18px;
            margin-bottom: 15px;
            color: #0066cc;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 style="text-align: center; color: #333;">View Paid Products</h2>
            <asp:DataList ID="DataList1" runat="server">
                <ItemTemplate>
                    <div class="order-card">
                        <div class="order-title">Order #<%# Eval("order_id") %></div>

                        <div class="order-row">
                            <span class="label">Product Name:</span>
                            <span class="value"><%# Eval("product_name") %></span>
                        </div>

                        <div class="order-row">
                            <span class="label">Price:</span>
                            <span class="value">₹ <%# Eval("product_price") %></span>
                        </div>

                        <div class="order-row">
                            <span class="label">Quantity:</span>
                            <span class="value"><%# Eval("product_quantity") %></span>
                        </div>

                        <div class="order-row">
                            <span class="label">Subtotal:</span>
                            <span class="value">₹ <%# Eval("sub_total") %></span>
                        </div>

                        <div class="order-row">
                            <span class="label">Order Status:</span>
                            <span class="value"><%# Eval("order_status") %></span>
                        </div>

                        <div class="order-button">
                            <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("order_id") %>'
                                Text="Take Action" OnClick="Button1_Click"
                                CssClass="btn btn-primary" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
</html>
