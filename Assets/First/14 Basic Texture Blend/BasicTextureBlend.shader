﻿Shader "Holistic/BasicTextureBlend"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _DecalTex ("Decal Texture" ,2D) = "white" {}
        [Toggle] _ShowDecal("Show Decal",Float)=0
    }
    SubShader
    {
        Tags{"Queue"="Geometry"}
    
        CGPROGRAM
        #pragma surface surf Lambert
        
        sampler2D _MainTex;
        sampler2D _DecalTex;
        
        float4 _Color;
        float _ShowDecal;
        
        
        
        struct Input{
            float2 uv_MainTex;
        };
        
        void surf(Input IN,inout SurfaceOutput o){
            fixed4 a=tex2D(_MainTex,IN.uv_MainTex);
            fixed4 b=tex2D(_DecalTex,IN.uv_MainTex)*_ShowDecal;
            //o.Albedo=a.rgb + b.rgb;
            //o.Albedo=b.r >0.9 ?  b.rgb : a.rgb;
            o.Albedo=b.r >0.9 ?  _Color : a.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
