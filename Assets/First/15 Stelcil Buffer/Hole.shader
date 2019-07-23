﻿Shader "Custom/NewSurfaceShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" 
    }
    SubShader
    {
        Tags { "Queue"="Geometry-1" }
        
        ColorMask 0
        ZWrite off
        
        Stencil{
            Ref 1
            Comp always
            Pass replace
            
        }
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
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
