using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kindergarten_app.Entities
{
    public partial class Parent
    {
        public string FullName
        {
            get
            {
                { return Last_name + " " + First_name + " " + Patronimyc; }
            }
        }
    }
    public partial class Workers
    {
        public string FullName
        {
            get
            {
                { return Last_name + " " + First_name + " " + Patronimyc; }
            }
        }
    }
    public partial class Kid
    {
        public string FullName
        {
            get
            {
                { return Last_name + " " + First_name + " " + Patronimyc; }
            }
        }
    }
}
