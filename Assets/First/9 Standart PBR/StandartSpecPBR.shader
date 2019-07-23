﻿Shader "Holistic/StandartSpecPBR"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MetallicTex ("Metallic (R)", 2D) = "white" {}
        _SpecColor ("Specular", Color) = (1,1,1,1)
        
    }
    SubShader
    {
        Tags { "Queue"="Geometry" }
        
        CGPROGRAM
        
        
        #pragma surface surf StandardSpecular 


        struct Input
        {
            float2 uv_MetallicTex;
        };
        sampler2D _MetallicTex;
        
        fixed4 _Color;
        
        
        void surf (Input IN, inout SurfaceOutputStandardSpecular o)
        {
        
            o.Albedo = _Color.rgb;
            
            o.Smoothness = 1-tex2D(_MetallicTex,IN.uv_MetallicTex).r;
            //o.Smoothness = tex2D(_MetallicTex,IN.uv_MetallicTex).r;  tersi
            o.Specular = _SpecColor.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
