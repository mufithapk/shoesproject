<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bill.aspx.cs" Inherits="shoesproject.bill" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Billing Page</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background-color: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0px 0px 12px rgba(0,0,0,0.15);
        }

        h2 {
            color: #333;
            border-bottom: 2px solid #ccc;
            padding-bottom: 8px;
        }

        .section {
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            margin-top: 10px;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            vertical-align: top;
        }

        .label {
            font-weight: bold;
            width: 150px;
        }

        .form-field {
            width: 100%;
            padding: 6px;
        }

        .button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            cursor: pointer;
            border-radius: 4px;
        }

        .button:hover {
            background-color: #218838;
        }

        .logout-button {
            background-color: #dc3545;
            color: white;
        }

        .logout-button:hover {
            background-color: #c82333;
        }

        .total {
            font-size: 18px;
            font-weight: bold;
            color: #444;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div style="text-align: right;">
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="button logout-button" OnClick="btnLogout_Click" />
            </div>

            <h2>Customer Information</h2>
            <div class="section">
                <table>
                    <tr>
                        <td class="label">Name:</td>
                        <td><asp:Label ID="Label2" runat="server" Text="Name"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="label">Email:</td>
                        <td><asp:Label ID="Label4" runat="server" Text="Email"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="label">Address:</td>
                        <td><asp:Label ID="Label6" runat="server" Text="Address"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="label">Place:</td>
                        <td><asp:Label ID="Label8" runat="server" Text="Place"></asp:Label></td>
                    </tr>
                </table>
            </div>

            <h2>Order Details</h2>
            <div class="section">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="section" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="product_name" HeaderText="Product Name" />
                        <asp:BoundField DataField="product_quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="product_price" HeaderText="Price" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                     <asp:Button ID="btnRemove" runat="server" CommandName="RemoveItem"  CommandArgument='<%# Eval("order_id") + "|" + Eval("product_id") %>'  Text="Remove" />
                               
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <div class="total">
                    Grand Total: <asp:Label ID="Label14" runat="server" Text="₹0.00"></asp:Label>
                </div>
            </div>

            <div class="section">
                <asp:Button ID="Button1" runat="server" Text="Enter Payment Details" CssClass="button" OnClick="Button1_Click" />
            </div>

            <asp:Panel ID="Panel1" runat="server" Visible="false" CssClass="section">
                <h2>Payment Information</h2>
                <table>
                    <tr>
                        <td class="label">Account Type:</td>
                        <td><asp:TextBox ID="TextBox1" runat="server" CssClass="form-field"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="label">Balance Amount:</td>
                        <td><asp:TextBox ID="TextBox2" runat="server" CssClass="form-field"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="label">Account Number:</td>
                        <td><asp:TextBox ID="TextBox4" runat="server" CssClass="form-field"></asp:TextBox></td>
                    </tr>
                </table>
                <asp:Button ID="Button2" runat="server" Text="Pay Now" CssClass="button" OnClick="Button2_Click" />
                <div style="margin-top: 10px;">
                    <asp:Label ID="Label20" runat="server" Text=""></asp:Label>
                </div>
            </asp:Panel>

            <asp:Panel ID="Panel2" runat="server" Visible="false" CssClass="section">
                <h2>Verify Account</h2>
                <asp:Label ID="Label18" runat="server" Text="Enter Account Number"></asp:Label><br />
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-field"></asp:TextBox><br />
                <asp:Button ID="Button3" runat="server" Text="Submit" CssClass="button" OnClick="Button3_Click" />
            </asp:Panel>

            <div class="section">
                <asp:Label ID="Label24" runat="server" Text="Balance in your account:"></asp:Label><br />
                <asp:Label ID="Label21" runat="server" Text="₹0.00"></asp:Label>
            </div>

            <div class="section">
                <asp:Button ID="Button4" runat="server" Text="Show Final Balance" CssClass="button" OnClick="Button4_Click1" />
                <br />
                <asp:Label ID="Label23" runat="server" ForeColor="Green" />
                <asp:Label ID="Label22" runat="server" Text=""></asp:Label>
              

            </div>

            <div class="section">
                <asp:Label ID="Label25" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
