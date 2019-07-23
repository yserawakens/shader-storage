Shader "Holistic/PackedPractice"{
	Properties{
		_myColour ("Example Name",Color)=(1.0,1.0,1.0,1.0)
		//_EmissionColor("Emission Color",Color)=(1.0,1.0,1.0,1.0)
		_Emission("Emission",Color)=(1.0,1.0,1.0,1.0)
		_Normal("Normal",Color)=(1.0,1.0,1.0,1.0)
	
	}
	SubShader{
		CGPROGRAM	
		#pragma surface surf Lambert

		struct Input {
			float2 uvMainTex;

		};
		
		fixed4 _myColour;
		fixed4 _Emission;
		fixed4 _Normal;
		//fixed4 _EmissionColor;
		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = _myColour.rgb;
			o.Emission = _Emission.rgb;
			o.Normal = _Normal.rgb;
			//o.Emission = _EmissionColor.rgb;
		}
		
		
		
		ENDCG
	}

		FallBack "Diffuse"
}