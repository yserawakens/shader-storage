Shader "Holistic/Shader4"
{
	Properties
	{
		_myTex("Texture" ,2D) = "white"{}
		_myBump("Normal",2D) ="Bump" {}
	    _mySlider("Normal value Derinlik",Range(0,10) )=1
	    _textureBump("Texture Tilling",Range(0,10))=1
	}
	SubShader
	{
		CGPROGRAM	
		#pragma surface surf Lambert

		sampler2D _myTex;
		sampler2D _myBump;
        float _mySlider;
        float _textureBump;
		struct Input 
		{
			float2 uv_myTex;
			float2 uv_myBump;
            
            
		};
		void surf(Input IN, inout SurfaceOutput o) 
		{
			o.Albedo =tex2D(_myTex, IN.uv_myTex*_textureBump).rgb;
			
            o.Normal=UnpackNormal( tex2D(_myBump, IN.uv_myBump * _textureBump));
            o.Normal*=float3(_mySlider,_mySlider,1);
			//o.Emission = texCUBE(_myCube, IN.worldRefl).rgb;
		}
		
		
		
		ENDCG
	}

		FallBack "Diffuse"
}