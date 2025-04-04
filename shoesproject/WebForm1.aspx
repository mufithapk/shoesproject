<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="shoesproject.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 189px;
        }
        .auto-style3 {
            width: 165px;
        }
        .auto-style4 {
            width: 523px;
        }
        .auto-style5 {
            height: 19px;
        }
        .auto-style6 {
            width: 165px;
            height: 19px;
        }
        .auto-style7 {
            width: 189px;
            height: 19px;
        }
        .auto-style8 {
            width: 523px;
            height: 19px;
        }
        .auto-style11 {
            width: 479px;
        }
        .auto-style12 {
            height: 19px;
            width: 479px;
        }
        .auto-style13 {
            width: 131%;
        }
        .auto-style14 {
            width: 787px;
        }
        .auto-style15 {
            height: 19px;
            width: 787px;
        }
        .auto-style18 {
            width: 110px;
        }
        .auto-style19 {
            width: 110px;
            height: 19px;
        }
        .auto-style20 {
            width: 1204px;
        }
        .auto-style21 {
            height: 19px;
            width: 1204px;
        }
        .auto-style22 {
            width: 624px;
        }
        .auto-style23 {
            height: 19px;
            width: 624px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style18">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style20">
                <table class="auto-style13">
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="auto-style11">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style4">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style5"></td>
                        <td class="auto-style5"></td>
                        <td class="auto-style12"></td>
                        <td class="auto-style6"></td>
                        <td class="auto-style7"></td>
                        <td class="auto-style8">
                            <asp:Label ID="Label3" runat="server" BackColor="White" BorderColor="Black" Font-Bold="True" Font-Size="Larger" Font-Strikeout="False" ForeColor="Black" Text="Log in"></asp:Label>
                        </td>
                        <td class="auto-style5"></td>
                        <td class="auto-style5"></td>
                        <td class="auto-style5"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="auto-style11">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style4">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="auto-style11">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style2">
                            <asp:Label ID="Label1" runat="server" BackColor="White" BorderColor="#66FF99" Font-Bold="True" ForeColor="Black" Text="user name"></asp:Label>
                        </td>
                        <td class="auto-style4">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style5"></td>
                        <td class="auto-style5"></td>
                        <td class="auto-style12"></td>
                        <td class="auto-style6"></td>
                        <td class="auto-style7"></td>
                        <td class="auto-style8"></td>
                        <td class="auto-style5"></td>
                        <td class="auto-style5"></td>
                        <td class="auto-style5"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td></td>
                        <td class="auto-style11">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style2">
                            <asp:Label ID="Label2" runat="server" BackColor="White" BorderColor="Black" Font-Bold="True" ForeColor="Black" Text="password"></asp:Label>
                        </td>
                        <td class="auto-style4">
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style5"></td>
                        <td class="auto-style5"></td>
                        <td class="auto-style12"></td>
                        <td class="auto-style6"></td>
                        <td class="auto-style7"></td>
                        <td class="auto-style8"></td>
                        <td class="auto-style5"></td>
                        <td class="auto-style5"></td>
                        <td class="auto-style5"></td>
                    </tr>
                    <tr>
                        <td class="auto-style5"></td>
                        <td class="auto-style5"></td>
                        <td class="auto-style12"></td>
                        <td class="auto-style6"></td>
                        <td class="auto-style7"></td>
                        <td class="auto-style8">
                            <asp:Button ID="Button1" runat="server" BackColor="#00CC00" BorderColor="White" ForeColor="Black" Height="18px" Text="Login" Width="69px" OnClick="Button1_Click" />
                        </td>
                        <td class="auto-style5"></td>
                        <td class="auto-style5"></td>
                        <td class="auto-style5"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="auto-style11">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style4">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
            <td class="auto-style14">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td></td>
            <td>
                <asp:Label ID="Label4" runat="server" BackColor="White" BorderColor="Black" Font-Bold="True" ForeColor="Black" Text="Don't have an account?"></asp:Label>
                <asp:Button ID="Button2" runat="server" BackColor="#66FFFF" BorderColor="White" ForeColor="Black" OnClick="Button2_Click" Text="signup" />
            </td>
            <td>&nbsp;</td>
            <td></td>
            <td>&nbsp;</td>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style18">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style20">&nbsp;</td>
            <td class="auto-style14">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style18">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style20">&nbsp;</td>
            <td class="auto-style14">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style18">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style20">&nbsp;</td>
            <td class="auto-style14">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style15"></td>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style18">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style20">&nbsp;</td>
            <td class="auto-style14">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style19">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style15"></td>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
        </tr>
    </table>
</asp:Content>
