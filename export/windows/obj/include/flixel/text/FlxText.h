// Generated by Haxe 4.3.4
#ifndef INCLUDED_flixel_text_FlxText
#define INCLUDED_flixel_text_FlxText

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_flixel_FlxSprite
#include <flixel/FlxSprite.h>
#endif
HX_DECLARE_CLASS1(flixel,FlxBasic)
HX_DECLARE_CLASS1(flixel,FlxCamera)
HX_DECLARE_CLASS1(flixel,FlxObject)
HX_DECLARE_CLASS1(flixel,FlxSprite)
HX_DECLARE_CLASS2(flixel,graphics,FlxGraphic)
HX_DECLARE_CLASS3(flixel,graphics,atlas,FlxAtlas)
HX_DECLARE_CLASS3(flixel,graphics,frames,FlxFramesCollection)
HX_DECLARE_CLASS2(flixel,math,FlxBasePoint)
HX_DECLARE_CLASS2(flixel,math,FlxRect)
HX_DECLARE_CLASS2(flixel,text,FlxText)
HX_DECLARE_CLASS2(flixel,text,FlxTextBorderStyle)
HX_DECLARE_CLASS2(flixel,text,FlxTextFormat)
HX_DECLARE_CLASS2(flixel,text,FlxTextFormatMarkerPair)
HX_DECLARE_CLASS3(flixel,text,_FlxText,FlxTextFormatRange)
HX_DECLARE_CLASS2(flixel,util,IFlxDestroyable)
HX_DECLARE_CLASS2(flixel,util,IFlxPooled)
HX_DECLARE_CLASS2(openfl,display,BitmapData)
HX_DECLARE_CLASS2(openfl,display,DisplayObject)
HX_DECLARE_CLASS2(openfl,display,IBitmapDrawable)
HX_DECLARE_CLASS2(openfl,display,InteractiveObject)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)
HX_DECLARE_CLASS2(openfl,geom,ColorTransform)
HX_DECLARE_CLASS2(openfl,text,TextField)
HX_DECLARE_CLASS2(openfl,text,TextFormat)

namespace flixel{
namespace text{


class HXCPP_CLASS_ATTRIBUTES FlxText_obj : public  ::flixel::FlxSprite_obj
{
	public:
		typedef  ::flixel::FlxSprite_obj super;
		typedef FlxText_obj OBJ_;
		FlxText_obj();

	public:
		enum { _hx_ClassId = 0x752f90b6 };

		void __construct(::hx::Null< Float >  __o_X,::hx::Null< Float >  __o_Y,::hx::Null< Float >  __o_FieldWidth,::String Text,::hx::Null< int >  __o_Size,::hx::Null< bool >  __o_EmbeddedFont);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="flixel.text.FlxText")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"flixel.text.FlxText"); }
		static ::hx::ObjectPtr< FlxText_obj > __new(::hx::Null< Float >  __o_X,::hx::Null< Float >  __o_Y,::hx::Null< Float >  __o_FieldWidth,::String Text,::hx::Null< int >  __o_Size,::hx::Null< bool >  __o_EmbeddedFont);
		static ::hx::ObjectPtr< FlxText_obj > __alloc(::hx::Ctx *_hx_ctx,::hx::Null< Float >  __o_X,::hx::Null< Float >  __o_Y,::hx::Null< Float >  __o_FieldWidth,::String Text,::hx::Null< int >  __o_Size,::hx::Null< bool >  __o_EmbeddedFont);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~FlxText_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("FlxText",1f,06,52,dd); }

		static void __boot();
		static int VERTICAL_GUTTER;
		::String text;
		 ::flixel::text::FlxTextBorderStyle borderStyle;
		int borderColor;
		Float borderSize;
		Float borderQuality;
		 ::openfl::text::TextField textField;
		bool _autoHeight;
		 ::flixel::math::FlxBasePoint shadowOffset;
		 ::openfl::text::TextFormat _defaultFormat;
		 ::openfl::text::TextFormat _formatAdjusted;
		::Array< ::Dynamic> _formatRanges;
		::String _font;
		bool _regen;
		 ::openfl::display::BitmapData _borderPixels;
		 ::openfl::geom::ColorTransform _borderColorTransform;
		bool _hasBorderAlpha;
		void destroy();

		void drawFrame(::hx::Null< bool >  Force);

		bool stampOnAtlas( ::flixel::graphics::atlas::FlxAtlas atlas);
		::Dynamic stampOnAtlas_dyn();

		 ::flixel::text::FlxText applyMarkup(::String input,::Array< ::Dynamic> rules);
		::Dynamic applyMarkup_dyn();

		 ::flixel::text::FlxText addFormat( ::flixel::text::FlxTextFormat Format,::hx::Null< int >  Start,::hx::Null< int >  End);
		::Dynamic addFormat_dyn();

		 ::flixel::text::FlxText removeFormat( ::flixel::text::FlxTextFormat Format, ::Dynamic Start, ::Dynamic End);
		::Dynamic removeFormat_dyn();

		 ::flixel::text::FlxText clearFormats();
		::Dynamic clearFormats_dyn();

		 ::flixel::text::FlxText setFormat(::String Font,::hx::Null< int >  Size,::hx::Null< int >  Color,::String Alignment, ::flixel::text::FlxTextBorderStyle BorderStyle,::hx::Null< int >  BorderColor,::hx::Null< bool >  EmbeddedFont);
		::Dynamic setFormat_dyn();

		 ::flixel::text::FlxText setBorderStyle( ::flixel::text::FlxTextBorderStyle Style,::hx::Null< int >  Color,::hx::Null< Float >  Size,::hx::Null< Float >  Quality);
		::Dynamic setBorderStyle_dyn();

		void updateHitbox();

		 ::flixel::math::FlxRect getScreenBounds( ::flixel::math::FlxRect newRect, ::flixel::FlxCamera camera);

		Float set_fieldWidth(Float value);
		::Dynamic set_fieldWidth_dyn();

		Float get_fieldWidth();
		::Dynamic get_fieldWidth_dyn();

		Float get_fieldHeight();
		::Dynamic get_fieldHeight_dyn();

		Float set_fieldHeight(Float value);
		::Dynamic set_fieldHeight_dyn();

		bool set_autoSize(bool value);
		::Dynamic set_autoSize_dyn();

		bool get_autoSize();
		::Dynamic get_autoSize_dyn();

		::String set_text(::String Text);
		::Dynamic set_text_dyn();

		int get_size();
		::Dynamic get_size_dyn();

		int set_size(int Size);
		::Dynamic set_size_dyn();

		int set_color(int Color);

		::String get_font();
		::Dynamic get_font_dyn();

		::String set_font(::String Font);
		::Dynamic set_font_dyn();

		bool get_embedded();
		::Dynamic get_embedded_dyn();

		::String get_systemFont();
		::Dynamic get_systemFont_dyn();

		::String set_systemFont(::String Font);
		::Dynamic set_systemFont_dyn();

		bool get_bold();
		::Dynamic get_bold_dyn();

		bool set_bold(bool value);
		::Dynamic set_bold_dyn();

		bool get_italic();
		::Dynamic get_italic_dyn();

		bool set_italic(bool value);
		::Dynamic set_italic_dyn();

		bool get_wordWrap();
		::Dynamic get_wordWrap_dyn();

		bool set_wordWrap(bool value);
		::Dynamic set_wordWrap_dyn();

		::String get_alignment();
		::Dynamic get_alignment_dyn();

		::String set_alignment(::String Alignment);
		::Dynamic set_alignment_dyn();

		 ::flixel::text::FlxTextBorderStyle set_borderStyle( ::flixel::text::FlxTextBorderStyle style);
		::Dynamic set_borderStyle_dyn();

		int set_borderColor(int Color);
		::Dynamic set_borderColor_dyn();

		Float set_borderSize(Float Value);
		::Dynamic set_borderSize_dyn();

		Float set_borderQuality(Float Value);
		::Dynamic set_borderQuality_dyn();

		 ::flixel::graphics::FlxGraphic set_graphic( ::flixel::graphics::FlxGraphic Value);

		Float get_width();

		Float get_height();

		void updateColorTransform();

		void regenGraphic();
		::Dynamic regenGraphic_dyn();

		void drawTextFieldTo( ::openfl::display::BitmapData graphic);
		::Dynamic drawTextFieldTo_dyn();

		void draw();

		void calcFrame(::hx::Null< bool >  RunOnCpp);

		void applyBorderStyle();
		::Dynamic applyBorderStyle_dyn();

		void applyBorderTransparency();
		::Dynamic applyBorderTransparency_dyn();

		void copyTextWithOffset(Float x,Float y);
		::Dynamic copyTextWithOffset_dyn();

		void applyFormats( ::openfl::text::TextFormat FormatAdjusted,::hx::Null< bool >  UseBorderColor);
		::Dynamic applyFormats_dyn();

		void copyTextFormat( ::openfl::text::TextFormat from, ::openfl::text::TextFormat to,::hx::Null< bool >  withAlign);
		::Dynamic copyTextFormat_dyn();

		 ::openfl::text::TextFormat dtfCopy();
		::Dynamic dtfCopy_dyn();

		void updateDefaultFormat();
		::Dynamic updateDefaultFormat_dyn();

		 ::flixel::graphics::frames::FlxFramesCollection set_frames( ::flixel::graphics::frames::FlxFramesCollection Frames);

};

} // end namespace flixel
} // end namespace text

#endif /* INCLUDED_flixel_text_FlxText */ 
