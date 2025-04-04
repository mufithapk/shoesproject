<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userreg.aspx.cs" Inherits="shoesproject.userreg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 438px;
        }
        .auto-style4 {
            width: 244px;
        }
        .auto-style5 {
            width: 438px;
            height: 19px;
        }
        .auto-style7 {
            width: 244px;
            height: 19px;
        }
        .auto-style8 {
            height: 19px;
        }
        .auto-style9 {
            width: 438px;
            height: 21px;
        }
        .auto-style11 {
            width: 244px;
            height: 21px;
        }
        .auto-style12 {
            height: 21px;
        }
        .auto-style13 {
            width: 438px;
            height: 86px;
        }
        .auto-style15 {
            width: 244px;
            height: 86px;
        }
        .auto-style16 {
            height: 86px;
        }
        .auto-style17 {
            width: 193px;
            height: 86px;
        }
        .auto-style18 {
            width: 193px;
        }
        .auto-style19 {
            width: 193px;
            height: 21px;
        }
        .auto-style20 {
            width: 193px;
            height: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    sssol<table class="auto-style1">
        <tr>
            <td class="auto-style13"></td>
            <td class="auto-style17"></td>
            <td class="auto-style15">
                <asp:Label ID="Label1" runat="server" BackColor="White" BorderColor="Black" Font-Bold="True" Font-Size="X-Large" ForeColor="Black" Text="USER REGISTRATION"></asp:Label>
            </td>
            <td class="auto-style16"></td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style18">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Black" Text="Name"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="124px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style19">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Black" Text="Age"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="TextBox2" runat="server" Height="20px" Width="121px"></asp:TextBox>
            </td>
            <td class="auto-style12"></td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style18">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Black" Text="Email"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox3" runat="server" Height="18px" Width="121px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5"></td>
            <td class="auto-style20">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Black" Text="Address"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="auto-style8"></td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style18">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Black" Text="Phone"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox5" runat="server" Height="22px" Width="117px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5"></td>
            <td class="auto-style20">
                <asp:Label ID="Label7" runat="server" Font-Bold="True" ForeColor="Black" Text="Place"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox6" runat="server" Height="16px" Width="122px"></asp:TextBox>
            </td>
            <td class="auto-style8"></td>
        </tr>
        <tr>
            <td class="auto-style5"></td>
            <td class="auto-style20">
                <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="Black" Text="State"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Value="1">kerala</asp:ListItem>
                    <asp:ListItem Value="2">tamil nadu</asp:ListItem>
                    <asp:ListItem Value="3">gujarat</asp:ListItem>
                    <asp:ListItem Value="4">karnataka</asp:ListItem>
                    <asp:ListItem Value="5">maharashtra</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style8"></td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style18">
                <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="Black" Text="District"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem Value="1">thrissur</asp:ListItem>
                    <asp:ListItem Value="2">idukki</asp:ListItem>
                    <asp:ListItem Value="3">kannur</asp:ListItem>
                    <asp:ListItem Value="4">malappuram</asp:ListItem>
                    <asp:ListItem Value="5">palakkad</asp:ListItem>
                    <asp:ListItem Value="6">ahmedabad</asp:ListItem>
                    <asp:ListItem Value="7">udaipur</asp:ListItem>
                    <asp:ListItem Value="8">patan</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style18">
                <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Black" Text="Username"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox7" runat="server" Height="17px" Width="102px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style18">
                <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="Black" Text="Password"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox8" runat="server" Height="20px" Width="117px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style18"></td>
            <td class="auto-style4"></td>
            <td></td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td class="auto-style4">
                <asp:Button ID="Button1" runat="server" Font-Bold="True" ForeColor="Black" OnClick="Button1_Click" Text="Register" />
                <asp:Label ID="Label12" runat="server" Text="succesfully inserted" Visible="False"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
