﻿Shader "Holistic/Normal Wall"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        
    }
    SubShader
    {
        Tags { "Queue"="Geometry" }
        
        
        CGPROGRAM
        
        #pragma surface surf Lambert
        
        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };
        
        fixed4 _Color;
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            fixed4 c=tex2D(_MainTex,IN.uv_MainTex);
            o.Albedo=c.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
