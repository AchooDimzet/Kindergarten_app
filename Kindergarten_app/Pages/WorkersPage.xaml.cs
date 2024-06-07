using Kindergarten_app.Classes;
using Kindergarten_app.Entities;
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
    /// Логика взаимодействия для WorkersPage.xaml
    /// </summary>
    public partial class WorkersPage : Page
    {
        public WorkersPage()
        {
            InitializeComponent();
            UpdateDgSource();
        }
        private void UpdateDgSource()
        {
            var workers = AppData.Context.Workers.Where(p => p.IsValid == true).ToList();
            DgWorkers.ItemsSource = workers;
        }

        private void BtnModify_Click(object sender, RoutedEventArgs e)
        {
            AddWorkerWindow addWorker = new AddWorkerWindow(DgWorkers.SelectedItem as Workers);
            addWorker.ShowDialog();
            UpdateDgSource();
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы дейстивтельно хотите удалить этот элемент?", "Удаление", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    var workers = DgWorkers.SelectedItem as Workers;
                    workers.IsValid = false;
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
                DgWorkers.ItemsSource = AppData.Context.Workers.Where(p => (p.First_name.Contains(TbSerch.Text.ToLower().Trim())
                    || p.Last_name.Contains(TbSerch.Text.ToLower().Trim()) || p.Patronimyc.Contains(TbSerch.Text.ToLower().Trim())) && p.IsValid == true).ToList();
            }
        }

        private void BtnAddClient_Click(object sender, RoutedEventArgs e)
        {
            AddWorkerWindow addWorker = new AddWorkerWindow();
            addWorker.ShowDialog();
            UpdateDgSource();
        }
    }
}
