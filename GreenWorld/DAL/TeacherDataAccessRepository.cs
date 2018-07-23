using Microsoft.Practices.Unity;
using GreenWorld.Controllers;
using GreenWorld.Filters;
using GreenWorld.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace GreenWorld.DAL
{
    [ExceptionHandler]
    public class TeacherDataAccessRepository : BaseController, ITeacherAccessRepository<RegisterTeacher, int>
    {
        public TeacherDataAccessRepository()
        {
            Db = new GreenWorldDataContext();
        }
        public IEnumerable<RegisterTeacher> Get()
        {
            var entities = Db.TeacherTbls.Select(x => new RegisterTeacher()
            {
                Id = x.Id,
                GuidId = x.GuidId,
                FullName = x.FullName,
                RegistrationNo = x.RegistrationNo,
                RegistrationType = x.RegistrationType,
                ClinicHospitalName = x.ClinicHospitalName,
                Designation = x.Designation,
                YearOfExperience = x.YearOfExperience,

         
                Addresss = x.Addresss,
                DateOfBirth = x.DateOfBirth,
                PhoneNumber = x.PhoneNumber,
                Email = x.Email,
                SelectedVisitDaysStr = GetDaysNameFromNumbers(x.CanVisitDays),
                VisitTimeStart = x.VisitTimeStart,
                VisitTimeEnd = x.VisitTimeEnd,
                VisitTime = GetTimeFromTimeSpan(x.VisitTimeStart, x.VisitTimeEnd),
                SlotDuration = x.SlotDuration,
                VisitFee = x.VisitFee,
                VisitingCard = HttpUtility.UrlPathEncode(baseUrl + x.VisitingCard),
                RawDBImagePath = x.VisitingCard,
                CreatedOnUtc = x.CreatedOnUtc,
                UpdatedOnUtc = x.UpdatedOnUtc,
                Active = x.Active,
            }).ToList();

            return entities;
        }

        public string GetTimeFromTimeSpan(TimeSpan start,TimeSpan end)
        {
            var timeStart = start.ToString(@"hh\:mm\:ss");
            var timeEnd = end.ToString(@"hh\:mm\:ss");
            return timeStart+" - " +timeEnd;
        }

      

        public RegisterTeacher Get(int id)
        {
            var entity = Db.TeacherTbls.Where(x => x.Id == id).Select(x => new RegisterTeacher()
            {
                Id = x.Id,
                GuidId = x.GuidId,
                FullName = x.FullName,
                RegistrationNo = x.RegistrationNo,
                RegistrationType = x.RegistrationType,
                ClinicHospitalName = x.ClinicHospitalName,
                Designation = x.Designation,
                YearOfExperience = x.YearOfExperience,

                //WorkingTypeName = Db.TeacherWorkingAreaTbls.SingleOrDefault(y => y.Id.ToString() == x.WorkingArea).WorkingArea,
                Addresss = x.Addresss,
                DateOfBirth = x.DateOfBirth,
                PhoneNumber = x.PhoneNumber,
                Email = x.Email,
                SelectedVisitDaysStr = GetDaysNameFromNumbers(x.CanVisitDays),
                SelectedVisitDays = GetListFromCommaSeparatedIntList(x.CanVisitDays),
                HiddenDays =GetHiddenDaysFromActiveDays(x.CanVisitDays),
                VisitTimeStart = x.VisitTimeStart,
                VisitTimeEnd = x.VisitTimeEnd,
                VisitTime = GetTimeFromTimeSpan(x.VisitTimeStart, x.VisitTimeEnd) ,
                SlotDuration = x.SlotDuration,
                VisitFee = x.VisitFee,
                VisitingCard = HttpUtility.UrlPathEncode(baseUrl + x.VisitingCard),
                RawDBImagePath = x.VisitingCard,
                CreatedOnUtc = x.CreatedOnUtc,
                UpdatedOnUtc = x.UpdatedOnUtc,
                Active = x.Active,

            }).SingleOrDefault();


            return entity;
        }

        public void Post(RegisterTeacher entity)
        {
            var imgAddress = string.Empty;
            if (entity.VisitingCard != null)
            {
                imgAddress = entity.VisitingCard.TrimStart('/');
            }

            // string visitDays=string.Empty;

            var visitDays = new StringBuilder();
            foreach (var item in entity.SelectedVisitDays)
            {

                if (visitDays.ToString() != string.Empty)
                {
                    visitDays.Append("," + item);
                }
                else
                {
                    visitDays.Append(item);
                }
            }

            if (entity.SlotDuration == 0)
                entity.SlotDuration = 10;

            if (entity.VisitTimeEnd.ToString() == "00:00:00")
            {
                entity.VisitTimeEnd = new TimeSpan(0, 23, 0, 0);
            }

            Db.TeacherTbls.InsertOnSubmit(new TeacherTbl
            {      
                GuidId = entity.GuidId,
                FullName = entity.FullName,

                ClinicHospitalName = entity.ClinicHospitalName,
                Designation = entity.Designation,
                YearOfExperience = entity.YearOfExperience,

                Addresss = entity.Addresss,
                DateOfBirth = entity.DateOfBirth,
                PhoneNumber = entity.PhoneNumber,
                Email = entity.Email,
                CanVisitDays = visitDays.ToString(),

                VisitTimeStart = entity.VisitTimeStart,
                VisitTimeEnd = entity.VisitTimeEnd,
                SlotDuration = entity.SlotDuration,
                VisitFee = entity.VisitFee,

                VisitingCard = imgAddress,
                CreatedOnUtc = DateTime.Now,
                UpdatedOnUtc = DateTime.Now,
                Active = entity.Active,
            });

            try
            {
                Db.SubmitChanges();
            }
            catch (Exception )
            {
                throw new Exception("Exception");
            }
        }

        public void Put(int id, RegisterTeacher entity)
        {
            var isEntity = from x in Db.TeacherTbls
                           where x.Id == entity.Id
                           select x;

            var imgAddress = string.Empty;
            if (entity.RawDBImagePath != null)
            {
                imgAddress = entity.RawDBImagePath.TrimStart('/');
            }

            var visitDays = new StringBuilder();
            foreach (var item in entity.SelectedVisitDays)
            {

                if (visitDays.ToString() != string.Empty)
                {
                    visitDays.Append("," + item);
                }
                else
                {
                    visitDays.Append(item);
                }
            }

            if (entity.SlotDuration == 0)
                entity.SlotDuration = 10;


            var entitySingle = isEntity.Single();
            entitySingle.FullName = entity.FullName;
            entitySingle.RegistrationNo = entity.RegistrationNo;
            entitySingle.RegistrationType = entity.RegistrationType;
            entitySingle.ClinicHospitalName = entity.ClinicHospitalName;
            entitySingle.Designation = entity.Designation;
            entitySingle.YearOfExperience = entity.YearOfExperience;
            entitySingle.Addresss = entity.Addresss;
            entitySingle.DateOfBirth = entity.DateOfBirth;
            entitySingle.PhoneNumber = entity.PhoneNumber;
            entitySingle.Email = entity.Email;
            entitySingle.CanVisitDays = visitDays.ToString();
            entitySingle.VisitTimeStart = entity.VisitTimeStart;
            entitySingle.VisitTimeEnd = entity.VisitTimeEnd;
            entitySingle.SlotDuration = entity.SlotDuration;
            entitySingle.VisitFee = entity.VisitFee;
            entitySingle.VisitingCard = imgAddress;
            entitySingle.UpdatedOnUtc = DateTime.Now;
            entitySingle.Active = entity.Active;

            try
            {
                Db.SubmitChanges();
            }
            catch (Exception)
            {
                throw new Exception("Exception");
            }
        }


        public void Delete(int id)
        {
            var query = from x in Db.TeacherTbls
                        where x.Id == id
                        select x;

            if (query.Count() == 1)
            {
                var entity = query.SingleOrDefault();
                Db.TeacherTbls.DeleteOnSubmit(entity ?? throw new InvalidOperationException());
            }

            try
            {
                Db.SubmitChanges();
            }
            catch (Exception)
            {
                throw new Exception("Exception");
            }
        }

    }
}