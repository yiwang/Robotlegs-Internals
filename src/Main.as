package
{
	import flash.display.Sprite;
	import org.robotlegs.adapters.SwiftSuspendersInjector;
	import org.robotlegs.core.IInjector;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	
	public class Main extends Sprite
	{
		public function Main()
		{
			//“When I ask for a Sprite, give me one. Many thanks, bev.”
			// Create a DI container
			var injector:IInjector = new SwiftSuspendersInjector();
			
			// Map as Singleton
			injector.mapSingleton(Sprite);
			
			// Pull some instances out of the container
			var spr1:Sprite = injector.getInstance(Sprite);
			var spr2:Sprite = injector.getInstance(Sprite);
			
			// Compare them
			trace('identical=' + (spr1 == spr2));
			
			//“When I ask for a Sprite, give me a Sprite. A new one, every time.”
			// Map as Class
			injector.mapClass(Sprite, Sprite);
			
			var spr3:Sprite = injector.getInstance(Sprite);
			var spr4:Sprite = injector.getInstance(Sprite);
			
			trace('identical=' + (spr3 == spr4));
			
			//“When I ask for a Sprite, give me this one.”
			
			var spr5:Sprite = new Sprite();
			
			// Map as Value
			injector.mapValue(Sprite, spr5);
			
			var spr6:Sprite = injector.getInstance(Sprite);
			var spr7:Sprite = injector.getInstance(Sprite);
			
			trace('identical=' + (spr5 == spr6 && spr6 == spr7 && spr7 == spr5));
			
			//“When I ask for a DisplayObject, give me a MovieClip. The same one, every time.”
			
			// Map Singleton Of
			injector.mapSingletonOf(DisplayObject, MovieClip);
			
			var obj1:DisplayObject = injector.getInstance(DisplayObject);
			var obj2:DisplayObject = injector.getInstance(DisplayObject);
			
			trace('isMovieClip=' + (obj1 is MovieClip));
			trace('isMovieClip=' + (obj2 is MovieClip));
		}
	}
}