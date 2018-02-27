// Generated by gencpp from file RMPISR/addpointRequest.msg
// DO NOT EDIT!


#ifndef RMPISR_MESSAGE_ADDPOINTREQUEST_H
#define RMPISR_MESSAGE_ADDPOINTREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace RMPISR
{
template <class ContainerAllocator>
struct addpointRequest_
{
  typedef addpointRequest_<ContainerAllocator> Type;

  addpointRequest_()
    : xf(0.0)
    , yf(0.0)
    , type(false)  {
    }
  addpointRequest_(const ContainerAllocator& _alloc)
    : xf(0.0)
    , yf(0.0)
    , type(false)  {
  (void)_alloc;
    }



   typedef double _xf_type;
  _xf_type xf;

   typedef double _yf_type;
  _yf_type yf;

   typedef uint8_t _type_type;
  _type_type type;




  typedef boost::shared_ptr< ::RMPISR::addpointRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::RMPISR::addpointRequest_<ContainerAllocator> const> ConstPtr;

}; // struct addpointRequest_

typedef ::RMPISR::addpointRequest_<std::allocator<void> > addpointRequest;

typedef boost::shared_ptr< ::RMPISR::addpointRequest > addpointRequestPtr;
typedef boost::shared_ptr< ::RMPISR::addpointRequest const> addpointRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::RMPISR::addpointRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::RMPISR::addpointRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace RMPISR

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::RMPISR::addpointRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::RMPISR::addpointRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::RMPISR::addpointRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::RMPISR::addpointRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::RMPISR::addpointRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::RMPISR::addpointRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::RMPISR::addpointRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2c13470f9a76d841f1bd464dbd411b07";
  }

  static const char* value(const ::RMPISR::addpointRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2c13470f9a76d841ULL;
  static const uint64_t static_value2 = 0xf1bd464dbd411b07ULL;
};

template<class ContainerAllocator>
struct DataType< ::RMPISR::addpointRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "RMPISR/addpointRequest";
  }

  static const char* value(const ::RMPISR::addpointRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::RMPISR::addpointRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 xf\n\
float64 yf\n\
bool type\n\
";
  }

  static const char* value(const ::RMPISR::addpointRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::RMPISR::addpointRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.xf);
      stream.next(m.yf);
      stream.next(m.type);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct addpointRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::RMPISR::addpointRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::RMPISR::addpointRequest_<ContainerAllocator>& v)
  {
    s << indent << "xf: ";
    Printer<double>::stream(s, indent + "  ", v.xf);
    s << indent << "yf: ";
    Printer<double>::stream(s, indent + "  ", v.yf);
    s << indent << "type: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.type);
  }
};

} // namespace message_operations
} // namespace ros

#endif // RMPISR_MESSAGE_ADDPOINTREQUEST_H
