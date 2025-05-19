using ImportExcelFIle.DotNETCore.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Linq.Expressions;
namespace ImportExcelFIle.DotNETCore.Models
{
    internal static class Filters
    {
        public static Expression<Func<T, bool>> FilterDate<T>(DateTime? ThoiGian)
        {
            try
            {
                if (typeof(IThoiGian).IsAssignableFrom(typeof(T)))
                {
                    var param = Expression.Parameter(typeof(T));
                    var ThoiGianbatdau = Expression.PropertyOrField(param, nameof(IThoiGian.ThoiGianBatDau));
                    var ThoiGianketthuc = Expression.PropertyOrField(param, nameof(IThoiGian.ThoiGianKetThuc));
                    if (ThoiGian == null)
                    {
                        return Expression.Lambda<Func<T, bool>>(Expression.Equal(ThoiGianketthuc, Expression.Constant(null, typeof(DateTime?))), param);
                    }
                    else
                    {
                        var ExRight = Expression.Constant(ThoiGian, typeof(DateTime?));
                        Expression<Func<DateTime>> ex2 = () => (DateTime)ThoiGian;
                        return Expression.Lambda<Func<T, bool>>(
                            Expression.Or(
                                            Expression.GreaterThanOrEqual(ThoiGianketthuc, ExRight),
                                            Expression.And(
                                                (
                                                    Expression.Equal(ThoiGianketthuc, Expression.Constant(null, typeof(DateTime?)))),
                                                    Expression.LessThanOrEqual(ThoiGianbatdau, ex2.Body)
                                                )
                                        )
                            , param);
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return null;
        }

        public static Expression<Func<T, bool>> FilterDate<T>(DateTime? TGBD, DateTime? TGKT)
        {
            try
            {
                if (typeof(IThoiGian).IsAssignableFrom(typeof(T)))
                {
                    var param = Expression.Parameter(typeof(T));
                    var ThoiGianbatdau = Expression.PropertyOrField(param, nameof(IThoiGian.ThoiGianBatDau));
                    var ThoiGianketthuc = Expression.PropertyOrField(param, nameof(IThoiGian.ThoiGianKetThuc));
                    // Không có thời gian gì thì lấy                                                                           cái hiện hành tức là không có thời gian kết thúc
                    if (TGBD == null&&TGKT == null)
                    {
                        return Expression.Lambda<Func<T, bool>>(Expression.Equal(ThoiGianketthuc, Expression.Constant(null, typeof(DateTime?))), param);
                    }
                    //Có cả thời gian bắt đầu và thời gian kết thúc
                    else if(TGBD!= null && TGKT != null)
                    {
                        var tmpTGBT = TGBD.Value;
                        var tmpTGKT = TGKT.Value;
                        var tgBauDau = Expression.Constant(tmpTGBT, typeof(DateTime));
                        var tgKetThuc = Expression.Constant(tmpTGKT, typeof(DateTime));

                        Expression<Func<DateTime>> exBatDau = () => (DateTime)tmpTGBT;
                        Expression<Func<DateTime>> exKetThuc = () => (DateTime)tmpTGKT;
                        Expression<Func<DateTime?>> exBatDauQ = () => (DateTime)tmpTGBT;
                        Expression<Func<DateTime?>> exKetThucQ = () => (DateTime)tmpTGKT;
                        //var objectMember = GetValue(ThoiGianketthuc);

                        if (ThoiGianketthuc == null)
                        {
                            return Expression.Lambda<Func<T, bool>>(
                           Expression.Not(
                                                Expression.GreaterThanOrEqual(ThoiGianbatdau, tgKetThuc)
                                        )
                            , param);
                        }
                        return Expression.Lambda<Func<T, bool>>(
                           Expression.Not( Expression.Or(
                                            Expression.And(
                                                Expression.GreaterThanOrEqual(ThoiGianbatdau, tgBauDau), 
                                                Expression.GreaterThanOrEqual(ThoiGianbatdau, tgKetThuc)
                                                ),
                                            Expression.And(
                                                Expression.LessThanOrEqual(ThoiGianketthuc, exBatDauQ.Body),
                                                Expression.LessThanOrEqual(ThoiGianketthuc, exKetThucQ.Body)
                                                )
                                        ))
                            , param);
                    }
                    //bắt đầu từ
                    else if(TGBD !=null)
                    {
                        var tgBatDau = Expression.Constant(TGBD, typeof(DateTime?));
                        Expression<Func<DateTime>> ex2 = () => (DateTime)TGBD;
                        return Expression.Lambda<Func<T, bool>>(
                            Expression.Or(
                                            Expression.GreaterThanOrEqual(ThoiGianketthuc, tgBatDau),
                                            Expression.And(
                                                (
                                                    Expression.Equal(ThoiGianketthuc, Expression.Constant(null, typeof(DateTime?)))),
                                                    Expression.LessThanOrEqual(ThoiGianbatdau, ex2.Body)
                                                )
                                        )
                            , param);
                    }
                    //Thời gian kết thúc khác null tìm chặn trên
                    else
                    {
                        var tgKetThuc = Expression.Constant(TGKT, typeof(DateTime?));
                        Expression<Func<DateTime>> ex2 = () => (DateTime)TGKT;

                        return Expression.Lambda<Func<T, bool>>(    
                                                    Expression.LessThan(ThoiGianbatdau, ex2.Body)
                            , param);
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }

            return null;
        }
        public static Expression<Func<T, bool>> CustomFilter<T>(string propertyName, string comparison, object value)
        {
            var parameter = Expression.Parameter(typeof(T));
            var left = propertyName.Split('.').Aggregate((Expression)parameter, Expression.PropertyOrField);
            var body = MakeComparison(left, comparison, value);
            return Expression.Lambda<Func<T, bool>>(body, parameter);
        }
        static object GetValue(MemberExpression member)
        {
            var objectMember = Expression.Convert(member, typeof(object));

            var getterLambda = Expression.Lambda<Func<object>>(objectMember);

            var getter = getterLambda.Compile();

            return getter();
        }

        static Expression MakeComparison(Expression left, string comparison, object value)
        {
            var constant = Expression.Constant(value, left.Type);
            switch (comparison)
            {
                case "==":
                    return Expression.MakeBinary(ExpressionType.Equal, left, constant);
                case "!=":
                    return Expression.MakeBinary(ExpressionType.NotEqual, left, constant);
                case ">":
                    return Expression.MakeBinary(ExpressionType.GreaterThan, left, constant);
                case ">=":
                    return Expression.MakeBinary(ExpressionType.GreaterThanOrEqual, left, constant);
                case "<":
                    return Expression.MakeBinary(ExpressionType.LessThan, left, constant);
                case "<=":
                    return Expression.MakeBinary(ExpressionType.LessThanOrEqual, left, constant);
                case "Contains":
                case "StartsWith":
                case "EndsWith":
                    if (value is string)
                    {
                        return Expression.Call(left, comparison, Type.EmptyTypes, constant);
                    }
                    throw new NotSupportedException($"Comparison operator '{comparison}' only supported on string.");
                default:
                    throw new NotSupportedException($"Invalid comparison operator '{comparison}'.");
            }
        }
    }
}
