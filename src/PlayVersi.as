package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class PlayVersi extends Sprite
	{
		private var reversi:Reversi;
		public function PlayVersi()
		{
			super();
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;
			//this.reversi = new Reversi(265);
			this.reversi = new Reversi(-1);
			this.addChild(this.reversi);
		}
	}
}