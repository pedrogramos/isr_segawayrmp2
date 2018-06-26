// Generated by gencpp from file perception_pkg/add_obstacleResponse.msg
// DO NOT EDIT!


#ifndef PERCEPTION_PKG_MESSAGE_ADD_OBSTACLERESPONSE_H
#define PERCEPTION_PKG_MESSAGE_ADD_OBSTACLERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace perception_pkg
{
template <class ContainerAllocator>
struct add_obstacleResponse_
{
  typedef add_obstacleResponse_<ContainerAllocator> Type;

  add_obstacleResponse_()
    {
    }
  add_obstacleResponse_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::perception_pkg::add_obstacleResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::perception_pkg::add_obstacleResponse_<ContainerAllocator> const> ConstPtr;

}; // struct add_obstacleResponse_

typedef ::perception_pkg::add_obstacleResponse_<std::allocator<void> > add_obstacleResponse;

typedef boost::shared_ptr< ::perception_pkg::add_obstacleResponse > add_obstacleResponsePtr;
typedef boost::shared_ptr< ::perception_pkg::add_obstacleResponse const> add_obstacleResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::perception_pkg::add_obstacleResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::perception_pkg::add_obstacleResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace perception_pkg

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::perception_pkg::add_obstacleResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::perception_pkg::add_obstacleResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::perception_pkg::add_obstacleResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::perception_pkg::add_obstacleResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::perception_pkg::add_obstacleResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::perception_pkg::add_obstacleResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::perception_pkg::add_obstacleResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::perception_pkg::add_obstacleResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::perception_pkg::add_obstacleResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "perception_pkg/add_obstacleResponse";
  }

  static const char* value(const ::perception_pkg::add_obstacleResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::perception_pkg::add_obstacleResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
";
  }

  static const char* value(const ::perception_pkg::add_obstacleResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::perception_pkg::add_obstacleResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct add_obstacleResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::perception_pkg::add_obstacleResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::perception_pkg::add_obstacleResponse_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // PERCEPTION_PKG_MESSAGE_ADD_OBSTACLERESPONSE_H
