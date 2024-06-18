using Kindergarten_app.Classes;
using Kindergarten_app.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Kindergarten_app.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddVisitWindow.xaml
    /// </summary>
    public partial class AddVisitWindow : Window
    {
        public AddVisitWindow()
        {
            InitializeComponent();
            CbKid.ItemsSource = AppData.Context.Kid.ToList();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            AppData.Context.PrivateLessons.Add(new PrivateLessons()
            {
                Date = DatePicker.SelectedDate.Value,
                KidId = CbKid.SelectedIndex + 1,
                IsValid = true
            });
            AppData.Context.SaveChanges();
            this.Close();
        }
    }
}
