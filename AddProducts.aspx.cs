﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

namespace Grocery_Demo
{
    public partial class AddProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsernameAdmin"] != null && Session["PasswordAdmin"] != null && Session["BranchAdmin"] != null)
            {
                string username = Session["UsernameAdmin"].ToString();
                string password = Session["PasswordAdmin"].ToString();
                string branch = Session["BranchAdmin"].ToString();
                string CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("AdminValidation", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@AdministratorUsername", username);
                cmd.Parameters.AddWithValue("@AdministratorPassword", password);
                cmd.Parameters.AddWithValue("@GroceryBranchName", branch);
                con.Open();
                SqlDataReader read = cmd.ExecuteReader();
                read.Read();
                if (read.HasRows == false)
                {
                    Response.Redirect("SignIn.aspx");
                }
                con.Close();
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }

            Label1.Text = Session["BranchAdmin"].ToString();
            Label2.Text = Session["UsernameAdmin"].ToString();
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedfile = FileUpload1.PostedFile;
            string filename = Path.GetFileName(postedfile.FileName);
            string fileextension = Path.GetExtension(filename);
            int filesize = postedfile.ContentLength;
            int Quantity;
            TextBox box3 = (TextBox)FindControl("TextBox3");
            bool qty = int.TryParse(box3.Text, out Quantity);


            if ((fileextension.ToLower() == ".jpg" || fileextension.ToLower() == ".jpeg" || fileextension.ToLower() == ".bmp" ||
                fileextension.ToLower() == ".gif" || fileextension.ToLower() == ".png") && (Quantity > 0))
            {
                Stream stream = postedfile.InputStream;
                BinaryReader binaryreader = new BinaryReader(stream);
                byte[] bytes = binaryreader.ReadBytes((int)stream.Length);
                string branch = Session["BranchAdmin"].ToString();
                string CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("AddProducts", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                con.Open();
                cmd.Parameters.AddWithValue("@ProductImage", FileUpload1.FileBytes);
                cmd.Parameters.AddWithValue("@ProductName", TextBox1.Text);
                cmd.Parameters.AddWithValue("@ProductCategoryName", DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@ProductPrice", TextBox2.Text);
                cmd.Parameters.AddWithValue("@ProductQuantity", TextBox3.Text);
                cmd.Parameters.AddWithValue("@GroceryBranchName", branch);
                cmd.Parameters.AddWithValue("@BarcodeNo", TextBox4.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('New Product has been added')</script>");
                Server.Transfer("AddProducts.aspx");
            }

            else if (Quantity == 0)
            {
                Label8.Text = " Add at least one quantity";
            }
        }

    }

}