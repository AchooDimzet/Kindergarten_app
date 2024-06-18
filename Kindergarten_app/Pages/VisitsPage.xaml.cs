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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Kindergarten_app.Pages
{
    /// <summary>
    /// Логика взаимодействия для VisitsPage.xaml
    /// </summary>
    public partial class VisitsPage : Page
    {
        public VisitsPage()
        {
            InitializeComponent();
            UpdateDgSource();
        }
        private void UpdateDgSource()
        {
            var visits = AppData.Context.Visits.Where(p => p.IsValid == true).ToList();
            DgKids.ItemsSource = visits;
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы дейстивтельно хотите удалить этот элемент?", "Удаление", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    var visit = DgKids.SelectedItem as Visits;
                    visit.IsValid = false;
                    AppData.Context.SaveChanges();
                    UpdateDgSource();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void BtnAddKid_Click(object sender, RoutedEventArgs e)
        {

        }

        private void TbSerch_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (TbSerch.Text == "")
                UpdateDgSource();
            else
            {
                DgKids.ItemsSource = AppData.Context.Visits.Where(p => (p.Kid.Last_name.Contains(TbSerch.Text.ToLower().Trim()) && p.IsValid == true) || (p.Kid.First_name.Contains(TbSerch.Text.ToLower().Trim()) && p.IsValid == true) || (p.Kid.Patronimyc.Contains(TbSerch.Text.ToLower().Trim()) || (p.Date.ToString().Contains(TbSerch.Text.ToLower().Trim())) && p.IsValid == true)).ToList();
            }
        }
    }
}
