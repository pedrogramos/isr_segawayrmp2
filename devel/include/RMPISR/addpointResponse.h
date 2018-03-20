// Generated by gencpp from file RMPISR/addpointResponse.msg
// DO NOT EDIT!


#ifndef RMPISR_MESSAGE_ADDPOINTRESPONSE_H
#define RMPISR_MESSAGE_ADDPOINTRESPONSE_H


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
struct addpointResponse_
{
  typedef addpointResponse_<ContainerAllocator> Type;

  addpointResponse_()
    {
    }
  addpointResponse_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::RMPISR::addpointResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::RMPISR::addpointResponse_<ContainerAllocator> const> ConstPtr;

}; // struct addpointResponse_

typedef ::RMPISR::addpointResponse_<std::allocator<void> > addpointResponse;

typedef boost::shared_ptr< ::RMPISR::addpointResponse > addpointResponsePtr;
typedef boost::shared_ptr< ::RMPISR::addpointResponse const> addpointResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::RMPISR::addpointResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::RMPISR::addpointResponse_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::RMPISR::addpointResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::RMPISR::addpointResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::RMPISR::addpointResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::RMPISR::addpointResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::RMPISR::addpointResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::RMPISR::addpointResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::RMPISR::addpointResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::RMPISR::addpointResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::RMPISR::addpointResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "RMPISR/addpointResponse";
  }

  static const char* value(const ::RMPISR::addpointResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::RMPISR::addpointResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
";
  }

  static const char* value(const ::RMPISR::addpointResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::RMPISR::addpointResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct addpointResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::RMPISR::addpointResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::RMPISR::addpointResponse_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // RMPISR_MESSAGE_ADDPOINTRESPONSE_H
