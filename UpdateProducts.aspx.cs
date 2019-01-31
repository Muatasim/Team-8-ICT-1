using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Grocery_Demo
{
    public partial class UpdateProducts : System.Web.UI.Page
    {
        int PageSize = 10;        
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

            if (!Page.IsPostBack)
            {
                DisplayProducts(1, PageSize);
            }

        }

        SqlDataAdapter da;
        DataSet ds = new DataSet();

        private void DisplayProducts(int PageIndex, int PageSize)
        {
            Session["ButtonClicked"] = null;
            if (Session["BranchAdmin"] != null)
            {
                string branch = Session["BranchAdmin"].ToString();
                string CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(CS))
                {


                    using (SqlCommand cmd = new SqlCommand("AdminViewProductsOnBranch", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@GroceryBranchName", branch);
                        cmd.Parameters.AddWithValue("@PageIndex", PageIndex);
                        cmd.Parameters.AddWithValue("@PageSize", PageSize);
                        cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                        cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                        da = new SqlDataAdapter(cmd);
                        da.Fill(ds);
                        con.Open();
                        cmd.ExecuteNonQuery();

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            GridView1.DataSource = ds.Tables[0];
                            GridView1.DataBind();
                        }
                        int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                        this.PopulatePager(recordCount, PageIndex);
                    }
                }
            }
        }

        public void lnkbtn_PageIndexChanged(object sender, EventArgs e)
        {
            int PageIndex = int.Parse((sender as LinkButton).CommandArgument);
            DisplayProducts(PageIndex, PageSize);
            Session["CurrentPage"] = PageIndex;
        }

        private void PopulatePager(int recordCount, int currentPage)
        {
            double dblPageCount = (double)((decimal)recordCount / (PageSize));
            int pageCount = (int)Math.Ceiling(dblPageCount);
            List<ListItem> pages = new List<ListItem>();
            if (pageCount > 0)
            {
                pages.Add(new ListItem("FIRST >> ", "1", currentPage > 1));
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
                pages.Add(new ListItem(" << LAST", pageCount.ToString(), currentPage < pageCount));
            }
            Repeater1.DataSource = pages;
            Repeater1.DataBind();

            Repeater1.Visible = true;
            Repeater2.Visible = false;
            Repeater3.Visible = false;
        }

        public void Search_Product(object sender, EventArgs e)

        {
            int PageIndex = 1;
            DisplaySearch(PageIndex, PageSize);
            Session["ButtonClicked"] = 9;
            Session["CurrentPage"] = PageIndex;
        }
        protected void DisplaySearch(int PageIndex, int PageSize)
        {
            if (Session["BranchAdmin"] != null)
            {
                string branch = Session["BranchAdmin"].ToString();
                string CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(CS))
                {
                    using (SqlCommand cmd = new SqlCommand("AdminSearchProductsOnBranch", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProductName", TextBox1.Text + "%");
                        cmd.Parameters.AddWithValue("@GroceryBranchName", branch);
                        cmd.Parameters.AddWithValue("@PageIndex", PageIndex);
                        cmd.Parameters.AddWithValue("@PageSize", PageSize);
                        cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                        cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                        da = new SqlDataAdapter(cmd);
                        da.Fill(ds);
                        con.Open();
                        cmd.ExecuteNonQuery();

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            GridView1.DataSource = ds.Tables[0];
                            GridView1.DataBind();
                            con.Close();
                        }

                        else
                        {
                            Label3.Text = " Couldn't find your product";
                            GridView1.DataSource = ds;
                            GridView1.DataBind();
                            ds.Clear();
                            con.Close();
                        }

                        int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                        this.PopulateSearchPager(recordCount, PageIndex);
                    }
                }
            }
        }
        public void lnkbtn_PageSearchIndexChanged(object sender, EventArgs e)
        {
            int PageIndex = int.Parse((sender as LinkButton).CommandArgument);
            DisplaySearch(PageIndex, PageSize);
            Session["CurrentPage"] = PageIndex;
        }
        private void PopulateSearchPager(int recordCount, int currentPage)
        {
            double dblPageCount = (double)((decimal)recordCount / (PageSize));
            int pageCount = (int)Math.Ceiling(dblPageCount);
            List<ListItem> pages = new List<ListItem>();
            if (pageCount > 0)
            {
                pages.Add(new ListItem("FIRST >> ", "1", currentPage > 1));
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
                pages.Add(new ListItem(" << LAST", pageCount.ToString(), currentPage < pageCount));
            }
            Repeater2.DataSource = pages;
            Repeater2.DataBind();

            Repeater1.Visible = false;
            Repeater2.Visible = true;
            Repeater3.Visible = false;
        }
       
        public void View_Product(object sender, EventArgs e)
        {
          int PageIndex = 1;
          DisplayViewProduct(PageIndex, PageSize);
          Session["ButtonClicked"] = 10;
          Session["CurrentPage"] = PageIndex;
        }
        protected void DisplayViewProduct(int PageIndex, int PageSize)
        {
            if (Session["BranchAdmin"] != null)
            {
                string branch = Session["BranchAdmin"].ToString();
                string CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(CS))
                {
                    using (SqlCommand cmd = new SqlCommand("AdminViewCategoriesOnBranch", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProductCategoryName", DropDownList1.SelectedValue);
                        cmd.Parameters.AddWithValue("@GroceryBranchName", branch);
                        cmd.Parameters.AddWithValue("@PageIndex", PageIndex);
                        cmd.Parameters.AddWithValue("@PageSize", PageSize);
                        cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                        cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                        da = new SqlDataAdapter(cmd);
                        da.Fill(ds);
                        con.Open();
                        cmd.ExecuteNonQuery();

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            GridView1.DataSource = ds.Tables[0];
                            GridView1.DataBind();
                            con.Close();
                        }

                        int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                        this.PopulateViewProductPager(recordCount, PageIndex);
                    }

                }
            }
        }

        public void lnkbtn_ViewProductIndexChanged(object sender, EventArgs e)
        {
            int PageIndex = int.Parse((sender as LinkButton).CommandArgument);
            DisplayViewProduct(PageIndex, PageSize);
            Session["CurrentPage"] = PageIndex;
        }
        private void PopulateViewProductPager(int recordCount, int currentPage)
        {
            double dblPageCount = (double)((decimal)recordCount / (PageSize));
            int pageCount = (int)Math.Ceiling(dblPageCount);
            List<ListItem> pages = new List<ListItem>();
            if (pageCount > 0)
            {
                pages.Add(new ListItem("FIRST >> ", "1", currentPage > 1));
                for (int i = 1; i <= pageCount; i++)
                {
                    pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                }
                pages.Add(new ListItem(" << LAST", pageCount.ToString(), currentPage < pageCount));
            }
            Repeater3.DataSource = pages;
            Repeater3.DataBind();

            Repeater1.Visible = false;
            Repeater2.Visible = false;
            Repeater3.Visible = true;
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

            if (Price > 00.09m)
            {
                string CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("UpdateProductPrice", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@ProductPrice", Price);
                cmd.Parameters.AddWithValue("@ProductName", ProductName);
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox("Price has been updated in all branches");               
                
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

            if (Quantity == 0 || Quantity > 0)
            {
                string CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("UpdateProductQuantity", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@ProductQuantity", Quantity);
                cmd.Parameters.AddWithValue("@ProductNo", ProductNo);
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox("Quantity has been updated");               

            }

        }
    
        public void Delete_Click(object sender, EventArgs e)
        {
            GridViewRow gvr = (GridViewRow)(sender as Control).Parent.Parent;
            int index = gvr.RowIndex;
            Button button12 = (Button)GridView1.Rows[index].Cells[6].FindControl("Button12");
           
            GridViewRow row = (GridViewRow)button12.NamingContainer;
            string ProductNo = row.Cells[0].Text;
                        
                string CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("DeleteProduct", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();             
                cmd.Parameters.AddWithValue("@ProductNo", ProductNo);
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox("Product has been removed from the stock");
                var PageIndex = (int)Session["CurrentPage"];
                if (Session["ButtonClicked"] != null)
               {
                var button = (int)Session["ButtonClicked"];
                
                if (button == 9)
                {
                    DisplaySearch(PageIndex, PageSize);
                }
                else if (button == 10)
                {
                    DisplayViewProduct(PageIndex, PageSize);
                }

               }



            if (Session["ButtonClicked"] == null)
            {
               DisplayProducts(PageIndex, PageSize);
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_RowUpdating(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, EventArgs e)
        {

        }

        public void MessageBox(string message)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "MessageBox", "<script language='javascript'>alert('" + message + "')</script>");
        }

    }
}