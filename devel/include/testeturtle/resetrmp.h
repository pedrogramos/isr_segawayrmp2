// Generated by gencpp from file testeturtle/resetrmp.msg
// DO NOT EDIT!


#ifndef TESTETURTLE_MESSAGE_RESETRMP_H
#define TESTETURTLE_MESSAGE_RESETRMP_H

#include <ros/service_traits.h>


#include <testeturtle/resetrmpRequest.h>
#include <testeturtle/resetrmpResponse.h>


namespace testeturtle
{

struct resetrmp
{

typedef resetrmpRequest Request;
typedef resetrmpResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct resetrmp
} // namespace testeturtle


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::testeturtle::resetrmp > {
  static const char* value()
  {
    return "271cb12677c4cd9bccbc642cd9258d1f";
  }

  static const char* value(const ::testeturtle::resetrmp&) { return value(); }
};

template<>
struct DataType< ::testeturtle::resetrmp > {
  static const char* value()
  {
    return "testeturtle/resetrmp";
  }

  static const char* value(const ::testeturtle::resetrmp&) { return value(); }
};


// service_traits::MD5Sum< ::testeturtle::resetrmpRequest> should match 
// service_traits::MD5Sum< ::testeturtle::resetrmp > 
template<>
struct MD5Sum< ::testeturtle::resetrmpRequest>
{
  static const char* value()
  {
    return MD5Sum< ::testeturtle::resetrmp >::value();
  }
  static const char* value(const ::testeturtle::resetrmpRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::testeturtle::resetrmpRequest> should match 
// service_traits::DataType< ::testeturtle::resetrmp > 
template<>
struct DataType< ::testeturtle::resetrmpRequest>
{
  static const char* value()
  {
    return DataType< ::testeturtle::resetrmp >::value();
  }
  static const char* value(const ::testeturtle::resetrmpRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::testeturtle::resetrmpResponse> should match 
// service_traits::MD5Sum< ::testeturtle::resetrmp > 
template<>
struct MD5Sum< ::testeturtle::resetrmpResponse>
{
  static const char* value()
  {
    return MD5Sum< ::testeturtle::resetrmp >::value();
  }
  static const char* value(const ::testeturtle::resetrmpResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::testeturtle::resetrmpResponse> should match 
// service_traits::DataType< ::testeturtle::resetrmp > 
template<>
struct DataType< ::testeturtle::resetrmpResponse>
{
  static const char* value()
  {
    return DataType< ::testeturtle::resetrmp >::value();
  }
  static const char* value(const ::testeturtle::resetrmpResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // TESTETURTLE_MESSAGE_RESETRMP_H
