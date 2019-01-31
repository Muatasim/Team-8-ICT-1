using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Grocery_Demo
{
    public interface Interface1
    {
        //SqlConnection GetConnection();
        void Add_Click(object sender, EventArgs e, FileUpload fu);
        void Display(string query, GridView grd);
    }
}
