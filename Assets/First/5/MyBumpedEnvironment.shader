Shader "Holistic/Bumped Environment aa"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Main Tex", 2D) = "white" {}
        _NormalMap ("Normal Map", 2D) = "Bump"{}
        _Brightness("Brightness",Range(0,5))=1
        _Derinlik("Derinlik",Range(0,5))=1
    }
    SubShader
    {
        

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert

        // Use shader model 3.0 target, to get nicer looking lighting
        

        sampler2D _MainTex;
        sampler2D _NormalMap;
        float _Brightness;
        float _Derinlik;
        
        float3 _Color;
        struct Input
        {
            float2 uv_Tex;
            float2 uv_Bump;
        };



        void surf (Input IN, inout SurfaceOutput o)
        {           
           o.Albedo = tex2D(_MainTex,IN.uv_Tex).rgb;
           o.Normal =UnpackNormal( tex2D(_NormalMap,IN.uv_Bump))*_Brightness;
           o.Normal*=float3(_Derinlik,_Derinlik,1);         
        }
        ENDCG
    }
    
    FallBack "Diffuse"
}
