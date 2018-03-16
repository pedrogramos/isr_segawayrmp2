// Generated by gencpp from file RMPISR/resetrmpRequest.msg
// DO NOT EDIT!


#ifndef RMPISR_MESSAGE_RESETRMPREQUEST_H
#define RMPISR_MESSAGE_RESETRMPREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Pose2D.h>

namespace RMPISR
{
template <class ContainerAllocator>
struct resetrmpRequest_
{
  typedef resetrmpRequest_<ContainerAllocator> Type;

  resetrmpRequest_()
    : pose()  {
    }
  resetrmpRequest_(const ContainerAllocator& _alloc)
    : pose(_alloc)  {
  (void)_alloc;
    }



   typedef  ::geometry_msgs::Pose2D_<ContainerAllocator>  _pose_type;
  _pose_type pose;




  typedef boost::shared_ptr< ::RMPISR::resetrmpRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::RMPISR::resetrmpRequest_<ContainerAllocator> const> ConstPtr;

}; // struct resetrmpRequest_

typedef ::RMPISR::resetrmpRequest_<std::allocator<void> > resetrmpRequest;

typedef boost::shared_ptr< ::RMPISR::resetrmpRequest > resetrmpRequestPtr;
typedef boost::shared_ptr< ::RMPISR::resetrmpRequest const> resetrmpRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::RMPISR::resetrmpRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::RMPISR::resetrmpRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::RMPISR::resetrmpRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::RMPISR::resetrmpRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::RMPISR::resetrmpRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::RMPISR::resetrmpRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::RMPISR::resetrmpRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::RMPISR::resetrmpRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::RMPISR::resetrmpRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "271cb12677c4cd9bccbc642cd9258d1f";
  }

  static const char* value(const ::RMPISR::resetrmpRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x271cb12677c4cd9bULL;
  static const uint64_t static_value2 = 0xccbc642cd9258d1fULL;
};

template<class ContainerAllocator>
struct DataType< ::RMPISR::resetrmpRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "RMPISR/resetrmpRequest";
  }

  static const char* value(const ::RMPISR::resetrmpRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::RMPISR::resetrmpRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Pose2D pose\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Pose2D\n\
# This expresses a position and orientation on a 2D manifold.\n\
\n\
float64 x\n\
float64 y\n\
float64 theta\n\
";
  }

  static const char* value(const ::RMPISR::resetrmpRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::RMPISR::resetrmpRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.pose);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct resetrmpRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::RMPISR::resetrmpRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::RMPISR::resetrmpRequest_<ContainerAllocator>& v)
  {
    s << indent << "pose: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose2D_<ContainerAllocator> >::stream(s, indent + "  ", v.pose);
  }
};

} // namespace message_operations
} // namespace ros

#endif // RMPISR_MESSAGE_RESETRMPREQUEST_H
