// Generated by Haxe 4.3.4
#ifndef INCLUDED_flixel_effects_FlxFlicker
#define INCLUDED_flixel_effects_FlxFlicker

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_flixel_util_IFlxDestroyable
#include <flixel/util/IFlxDestroyable.h>
#endif
HX_DECLARE_CLASS1(flixel,FlxBasic)
HX_DECLARE_CLASS1(flixel,FlxObject)
HX_DECLARE_CLASS2(flixel,effects,FlxFlicker)
HX_DECLARE_CLASS2(flixel,util,FlxPool)
HX_DECLARE_CLASS2(flixel,util,FlxTimer)
HX_DECLARE_CLASS2(flixel,util,IFlxDestroyable)
HX_DECLARE_CLASS2(flixel,util,IFlxPool)
HX_DECLARE_CLASS1(haxe,IMap)
HX_DECLARE_CLASS2(haxe,ds,ObjectMap)

namespace flixel{
namespace effects{


class HXCPP_CLASS_ATTRIBUTES FlxFlicker_obj : public ::hx::Object
{
	public:
		typedef ::hx::Object super;
		typedef FlxFlicker_obj OBJ_;
		FlxFlicker_obj();

	public:
		enum { _hx_ClassId = 0x655839ec };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="flixel.effects.FlxFlicker")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"flixel.effects.FlxFlicker"); }
		static ::hx::ObjectPtr< FlxFlicker_obj > __new();
		static ::hx::ObjectPtr< FlxFlicker_obj > __alloc(::hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~FlxFlicker_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		void *_hx_getInterface(int inHash);
		::String __ToString() const { return HX_("FlxFlicker",c6,94,18,a6); }

		static void __boot();
		static  ::flixel::util::FlxPool _pool;
		static  ::haxe::ds::ObjectMap _boundObjects;
		static  ::flixel::effects::FlxFlicker flicker( ::flixel::FlxObject Object,::hx::Null< Float >  Duration,::hx::Null< Float >  Interval,::hx::Null< bool >  EndVisibility,::hx::Null< bool >  ForceRestart, ::Dynamic CompletionCallback, ::Dynamic ProgressCallback);
		static ::Dynamic flicker_dyn();

		static bool isFlickering( ::flixel::FlxObject Object);
		static ::Dynamic isFlickering_dyn();

		static void stopFlickering( ::flixel::FlxObject Object);
		static ::Dynamic stopFlickering_dyn();

		 ::flixel::FlxObject object;
		bool endVisibility;
		 ::flixel::util::FlxTimer timer;
		 ::Dynamic completionCallback;
		Dynamic completionCallback_dyn() { return completionCallback;}
		 ::Dynamic progressCallback;
		Dynamic progressCallback_dyn() { return progressCallback;}
		Float duration;
		Float interval;
		void destroy();
		::Dynamic destroy_dyn();

		void start( ::flixel::FlxObject Object,Float Duration,Float Interval,bool EndVisibility, ::Dynamic CompletionCallback, ::Dynamic ProgressCallback);
		::Dynamic start_dyn();

		void stop();
		::Dynamic stop_dyn();

		void release();
		::Dynamic release_dyn();

		void flickerProgress( ::flixel::util::FlxTimer Timer);
		::Dynamic flickerProgress_dyn();

};

} // end namespace flixel
} // end namespace effects

#endif /* INCLUDED_flixel_effects_FlxFlicker */ 
