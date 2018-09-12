using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Grocery_Demo
{
    public partial class UpdateProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsernameAdmin"] != null && Session["PasswordAdmin"] != null && Session["BranchAdmin"] != null)
            {
                string username = Session["UsernameAdmin"].ToString();
                string password = Session["PasswordAdmin"].ToString();
                string branch = Session["BranchAdmin"].ToString();
                string CS;
                CS = "data source=LAPTOP-ODS96MIK\\MSSQL2014; database = Grocery_Demo; integrated security=SSPI";
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

            if (!Page.IsPostBack)
            {
                DisplayProducts();
            }

        }

        private void DisplayProducts()
        {
         if (Session["BranchAdmin"] != null)
            {
                string branch = Session["BranchAdmin"].ToString();
                string CS;
                CS = "data source=LAPTOP-ODS96MIK\\MSSQL2014; database = Grocery_Demo; integrated security=SSPI";
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("AdminViewProductsOnBranch", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@GroceryBranchName", branch);

                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();
            }
        }

        protected void Search_Product(object sender, EventArgs e)
        {
            if (Session["BranchAdmin"] != null)
            {
                string branch = Session["BranchAdmin"].ToString();
                string CS;
                CS = "data source=LAPTOP-ODS96MIK\\MSSQL2014; database = Grocery_Demo; integrated security=SSPI";
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("AdminSearchProductsOnBranch", con);
                cmd.Parameters.AddWithValue("@ProductName", TextBox1.Text + "%");
                cmd.Parameters.AddWithValue("@GroceryBranchName", branch);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();

                con.Open();
                SqlDataReader read = cmd.ExecuteReader();
                read.Read();
                if (read.HasRows == false)
                {
                    Label3.Text = "Couldn't find your product";
                    con.Close();
                }
            }
        }

        protected void View_Product(object sender, EventArgs e)
        {
            if (Session["BranchAdmin"] != null)
            {
                string branch = Session["BranchAdmin"].ToString();
                string CS;
                CS = "data source=LAPTOP-ODS96MIK\\MSSQL2014; database = Grocery_Demo; integrated security=SSPI";
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("AdminViewCategoriesOnBranch", con);
                cmd.Parameters.AddWithValue("@ProductCategoryName", DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@GroceryBranchName", branch);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();

                con.Open();
                SqlDataReader read = cmd.ExecuteReader();
                read.Read();
                con.Close();
            }
        }

        protected void Price_Update_Click(object sender, EventArgs e)
        {
            GridViewRow gvr = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gvr.RowIndex;
            TextBox box3 = (TextBox)GridView1.Rows[index].Cells[4].FindControl("TextBox3");
            decimal Price;
            bool prc = decimal.TryParse(box3.Text, out Price);

            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            string ProductName = row.Cells[2].Text;

            if (Price > 00.00m)
            {
                string CS;
                CS = "data source=LAPTOP-ODS96MIK\\MSSQL2014; database = Grocery_Demo; integrated security=SSPI";
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("UpdateProductPrice", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@ProductPrice", Price);
                cmd.Parameters.AddWithValue("@ProductName", ProductName);
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox("Price has been updated in all branches");
                DisplayProducts();
            }
        }

        protected void Quantity_Update_Click(object sender, EventArgs e)
        {
            GridViewRow gvr = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gvr.RowIndex;
            TextBox box4 = (TextBox)GridView1.Rows[index].Cells[5].FindControl("TextBox4");
            int Quantity;
            bool qty = int.TryParse(box4.Text, out Quantity);

            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            string ProductNo = row.Cells[0].Text;

            if (Quantity > 0)
            {
                string CS;
                CS = "data source=LAPTOP-ODS96MIK\\MSSQL2014; database = Grocery_Demo; integrated security=SSPI";
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("UpdateProductQuantity", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@ProductQuantity", Quantity);
                cmd.Parameters.AddWithValue("@ProductNo", ProductNo);
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox("Quantity has been updated");
                DisplayProducts();
            }

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='green';";
            //    e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
            //}
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        public void MessageBox(string message)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "MessageBox", "<script language='javascript'>alert('" + message + "')</script>");
        }

    }
}