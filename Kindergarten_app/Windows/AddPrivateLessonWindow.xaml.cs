using Kindergarten_app.Classes;
using Kindergarten_app.Entities;
using System;
using System.Collections.Generic;
using System.Diagnostics;
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
using static System.Net.Mime.MediaTypeNames;

namespace Kindergarten_app.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddPrivateLessonWindow.xaml
    /// </summary>
    public partial class AddPrivateLessonWindow : Window
    {
        private PrivateLessons currentPrivateLesson;
        public AddPrivateLessonWindow()
        {
            InitializeComponent();
            CbEducationType.ItemsSource = AppData.Context.EducationTypes.ToList();
            CbKid.ItemsSource = AppData.Context.Kid.ToList();
            CbWorker.ItemsSource = AppData.Context.Workers.ToList();
        }

        public AddPrivateLessonWindow(PrivateLessons addLesson)
        {
            InitializeComponent();
            CbEducationType.ItemsSource = AppData.Context.EducationTypes.ToList();
            CbKid.ItemsSource = AppData.Context.Kid.ToList();
            CbWorker.ItemsSource = AppData.Context.Workers.ToList();
            currentPrivateLesson = addLesson;

            DatePicker.SelectedDate = currentPrivateLesson.Date;
            CbEducationType.SelectedItem = currentPrivateLesson.EducationTypeId;
            CbKid.SelectedItem = currentPrivateLesson.Kid;
            CbWorker.SelectedItem = currentPrivateLesson.WorkerId;
            TbPrice.Text = currentPrivateLesson.Price;
            TbDescription.Text = currentPrivateLesson.Description;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            //try
            //{
                if (currentPrivateLesson == null)
                {
                    AppData.Context.PrivateLessons.Add(new PrivateLessons()
                    {
                        Date = DatePicker.SelectedDate.Value,
                        EducationTypeId = CbEducationType.SelectedIndex + 1,
                        KidId = CbKid.SelectedIndex + 1,
                        WorkerId = CbWorker.SelectedIndex + 1,
                        Price = TbPrice.Text,
                        Description = TbDescription.Text,
                        IsValid = true
                    });
                    AppData.Context.SaveChanges();
                    this.Close();
                }
                else
                {
                    currentPrivateLesson.Date = DatePicker.SelectedDate.Value;
                    currentPrivateLesson.EducationTypeId = CbEducationType.SelectedIndex + 1;
                    currentPrivateLesson.KidId = CbKid.SelectedIndex + 1;
                    currentPrivateLesson.WorkerId = CbWorker.SelectedIndex + 1;
                    currentPrivateLesson.Price = TbPrice.Text;
                    currentPrivateLesson.Description = TbDescription.Text;
                    currentPrivateLesson.IsValid = true;
                    AppData.Context.SaveChanges();
                    this.Close();
                }
            //}
            //catch(Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Проверьте правильность введенных данных", MessageBoxButton.OK, MessageBoxImage.Error);
            //}
            
        }
    }
}
