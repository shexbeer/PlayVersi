//  Adobe(R) Systems Incorporated Source Code License Agreement
//  Copyright(c) 2006-2010 Adobe Systems Incorporated. All rights reserved.
//	
//  Please read this Source Code License Agreement carefully before using
//  the source code.
//	
//  Adobe Systems Incorporated grants to you a perpetual, worldwide, non-exclusive, 
//  no-charge, royalty-free, irrevocable copyright license, to reproduce,
//  prepare derivative works of, publicly display, publicly perform, and
//  distribute this source code and such derivative works in source or 
//  object code form without any attribution requirements.    
//	
//  The name "Adobe Systems Incorporated" must not be used to endorse or promote products
//  derived from the source code without prior written permission.
//	
//  You agree to indemnify, hold harmless and defend Adobe Systems Incorporated from and
//  against any loss, damage, claims or lawsuits, including attorney's 
//  fees that arise or result from your use or distribution of the source 
//  code.
//  
//  THIS SOURCE CODE IS PROVIDED "AS IS" AND "WITH ALL FAULTS", WITHOUT 
//  ANY TECHNICAL SUPPORT OR ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING,
//  BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
//  FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  ALSO, THERE IS NO WARRANTY OF 
//  NON-INFRINGEMENT, TITLE OR QUIET ENJOYMENT.  IN NO EVENT SHALL ADOBE 
//  OR ITS SUPPLIERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
//  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
//  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
//  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
//  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
//  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOURCE CODE, EVEN IF
//  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

package com.christianseidel.components
{
	import flash.display.Sprite;
	import flash.text.engine.ElementFormat;
	import flash.text.engine.FontDescription;
	import flash.text.engine.TextBlock;
	import flash.text.engine.TextElement;
	import flash.text.engine.TextLine;
	
	public class MultilineLabel extends Sprite
	{
		//private var textField:TextField;
		public static const LEADING:Number = 1.25;
		public var textHeight:uint;
		
		public function MultilineLabel(text:String,
									   width:uint,
									   height:int = -1,
									   fontWeight:String = "normal",
									   fontColor:int = 0xffffff,
									   fontName:String = "_sans",
									   fontSize:uint = 18)
		{
			super();
			var fontDesc:FontDescription = new FontDescription(fontName, fontWeight);
			var elementFormat:ElementFormat = new ElementFormat(fontDesc, fontSize, fontColor);
			var textElement:TextElement = new TextElement(text, elementFormat);
			var textBlock:TextBlock = new TextBlock(textElement);
			var textLine:TextLine;
			var leading:Number = 1.25;
			var yPos:Number = 0;
			var totalHeight:uint = 0;
			
			while (textLine = textBlock.createTextLine(textLine, width, 0, true)) 
			{
				this.textHeight += textLine.textHeight;
				textLine.x = 0; 
				textLine.y = yPos;
				yPos += LEADING * textLine.height; 
				this.addChild(textLine); 
				totalHeight += yPos;
			}
			
			// Text is getting cut off by a fraction of a pixel. Round up seems to fix it. 
			//this.height = (height != -1) ? Math.ceil(height) : totalHeight; 
		}
	}
}