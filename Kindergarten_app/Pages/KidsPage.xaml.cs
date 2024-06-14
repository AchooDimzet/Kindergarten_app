using Kindergarten_app.Entities;
using Kindergarten_app.Classes;
using Kindergarten_app.Windows;
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
    /// Логика взаимодействия для KidsPage.xaml
    /// </summary>
    public partial class KidsPage : Page
    {
        public KidsPage()
        {
            InitializeComponent();
            UpdateDgSource();
        }

        private void UpdateDgSource()
        {
            var Kids = AppData.Context.Kid.Where(p => p.IsValid == true).ToList();
            DgKids.ItemsSource = Kids;
        }

        private void BtnModify_Click(object sender, RoutedEventArgs e)
        {
            AddKidWindow addKid = new AddKidWindow(DgKids.SelectedItem as Kid);
            addKid.ShowDialog();
            UpdateDgSource();
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы дейстивтельно хотите удалить этот элемент?", "Удаление", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    var kid = DgKids.SelectedItem as Kid;
                    kid.IsValid = false;
                    AppData.Context.SaveChanges();
                    UpdateDgSource();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void TbSerch_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (TbSerch.Text == "")
                UpdateDgSource();
            else
            {
                DgKids.ItemsSource = AppData.Context.Kid.Where(p => (p.Last_name.Contains(TbSerch.Text.ToLower().Trim()) && p.IsValid == true) || (p.First_name.Contains(TbSerch.Text.ToLower().Trim()) && p.IsValid == true) || (p.Patronimyc.Contains(TbSerch.Text.ToLower().Trim()) && p.IsValid == true)).ToList();
            }
        }

        private void BtnAddKid_Click(object sender, RoutedEventArgs e)
        {
            AddKidWindow addKid = new AddKidWindow();
            addKid.ShowDialog();
            UpdateDgSource();
        }
    }
}
