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
    /// Логика взаимодействия для PrivateLessonsPage.xaml
    /// </summary>
    public partial class PrivateLessonsPage : Page
    {
        public PrivateLessonsPage()
        {
            InitializeComponent();
            UpdateDgSource();
        }

        private void UpdateDgSource()
        {
            var lessons = AppData.Context.PrivateLessons.Where(p => p.Date <= DateTime.Now || p.IsValid == true).ToList();
            DgPrivateLessons.ItemsSource = lessons;
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы действительно хотите удалить этот элемент?", "Удаление", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    var lesson = DgPrivateLessons.SelectedItem as PrivateLessons;
                    lesson.IsValid = false;
                    AppData.Context.SaveChanges();
                    UpdateDgSource();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void BtnModify_Click(object sender, RoutedEventArgs e)
        {
            AddPrivateLessonWindow addLesson = new AddPrivateLessonWindow(DgPrivateLessons.SelectedItem as PrivateLessons);
            addLesson.ShowDialog();
            UpdateDgSource();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            AddPrivateLessonWindow addLesson = new AddPrivateLessonWindow();
            addLesson.ShowDialog();
            UpdateDgSource();
        }

        private void TbSerch_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (TbSerch.Text == "")
                UpdateDgSource();
            else
            {
                DgPrivateLessons.ItemsSource = AppData.Context.PrivateLessons.Where(p => (p.Date.ToString().Contains(TbSerch.Text.ToLower().Trim()) ||
                    p.Kid.First_name.Contains(TbSerch.Text.ToLower().Trim()) || p.Kid.Last_name.Contains(TbSerch.Text.ToLower().Trim()) || p.Kid.Patronimyc.Contains(TbSerch.Text.ToLower().Trim())
                    || p.Workers.First_name.Contains(TbSerch.Text.ToLower().Trim()) || p.Workers.Last_name.Contains(TbSerch.Text.ToLower().Trim()) || p.Workers.Patronimyc.Contains(TbSerch.Text.ToLower().Trim())) && p.IsValid == true).ToList();
            }
        }
    }
}
