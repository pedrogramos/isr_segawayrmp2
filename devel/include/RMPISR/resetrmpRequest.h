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

#include <std_msgs/Float32MultiArray.h>

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



   typedef  ::std_msgs::Float32MultiArray_<ContainerAllocator>  _pose_type;
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



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'RMPISR': ['/home/rmp/catkin_ws/src/RMPISR/msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::RMPISR::resetrmpRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::RMPISR::resetrmpRequest_<ContainerAllocator> const>
  : FalseType
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
    return "f759b8f7398989ae2c04da536ffa12af";
  }

  static const char* value(const ::RMPISR::resetrmpRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf759b8f7398989aeULL;
  static const uint64_t static_value2 = 0x2c04da536ffa12afULL;
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
    return "std_msgs/Float32MultiArray pose\n\
\n\
================================================================================\n\
MSG: std_msgs/Float32MultiArray\n\
# Please look at the MultiArrayLayout message definition for\n\
# documentation on all multiarrays.\n\
\n\
MultiArrayLayout  layout        # specification of data layout\n\
float32[]         data          # array of data\n\
\n\
\n\
================================================================================\n\
MSG: std_msgs/MultiArrayLayout\n\
# The multiarray declares a generic multi-dimensional array of a\n\
# particular data type.  Dimensions are ordered from outer most\n\
# to inner most.\n\
\n\
MultiArrayDimension[] dim # Array of dimension properties\n\
uint32 data_offset        # padding elements at front of data\n\
\n\
# Accessors should ALWAYS be written in terms of dimension stride\n\
# and specified outer-most dimension first.\n\
# \n\
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]\n\
#\n\
# A standard, 3-channel 640x480 image with interleaved color channels\n\
# would be specified as:\n\
#\n\
# dim[0].label  = \"height\"\n\
# dim[0].size   = 480\n\
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)\n\
# dim[1].label  = \"width\"\n\
# dim[1].size   = 640\n\
# dim[1].stride = 3*640 = 1920\n\
# dim[2].label  = \"channel\"\n\
# dim[2].size   = 3\n\
# dim[2].stride = 3\n\
#\n\
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.\n\
\n\
================================================================================\n\
MSG: std_msgs/MultiArrayDimension\n\
string label   # label of given dimension\n\
uint32 size    # size of given dimension (in type units)\n\
uint32 stride  # stride of given dimension\n\
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
    Printer< ::std_msgs::Float32MultiArray_<ContainerAllocator> >::stream(s, indent + "  ", v.pose);
  }
};

} // namespace message_operations
} // namespace ros

#endif // RMPISR_MESSAGE_RESETRMPREQUEST_H
