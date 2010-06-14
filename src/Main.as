package
{
	import flash.display.Sprite;
	import org.robotlegs.adapters.SwiftSuspendersInjector;
	import org.robotlegs.core.IInjector;
	
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
		}
	}
}