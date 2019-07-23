﻿Shader "Holistic/StencilWindow"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _SRef("Stendil Ref",Float)=1
        [Enum(UnityEngine.Rendering.CompareFunction)]  _SComp("Stencil Comp",Float)=8
        [Enum(UnityEngine.Rendering.StencilOp)]  _SOp("Stencil Op",Float)=2
    }
    SubShader
    {
        Tags { "Queue"="Geometry-1" }
        
        ZWrite off
        ColorMask 0
        
        Stencil{
            Ref[_SRef]
            Comp[_SComp]
            Pass[_SOp]
            
        }

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert
        sampler2D _MainTex;
        sampler2D _myDiffuse;
        struct Input
        {
            float2 uv_myDiffuse;
        };
        
        fixed4 _Color;
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo=tex2D(_myDiffuse,IN.uv_myDiffuse);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
