﻿Shader "Holistic/BasicBlinn"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _SpecColor("SpecColor",Color)=(1,1,1,1)
        _Spec("Specular  'Area'",Range(0,1))=0.5
        _Gloss("Gloss     'strength'",Range(0,1))=0.5
    }
    SubShader
    {
        Tags{
            "Queue"="Geometry"
        }
    
        CGPROGRAM
        
        
        #pragma surface surf BlinnPhong


        struct Input
        {
            float2 uv_MainTex;
        };
        float4 _Color;
        half _Spec;
        fixed _Gloss;
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo=_Color.rgb;
            o.Specular=_Spec;
            o.Gloss=_Gloss;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
