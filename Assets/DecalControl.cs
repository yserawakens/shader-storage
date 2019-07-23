using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class DecalControl : MonoBehaviour
{
    private Material mat;
    private bool showDecal=false;
    
    
    // Start is called before the first frame update
    void Start()
    {
        mat = this.GetComponent<Renderer>().sharedMaterial;
    }


    private void OnMouseDown()
    {
        showDecal = !showDecal;
        if (showDecal)
        {
            mat.SetFloat("_ShowDecal",1);
        }
        else
        {
            mat.SetFloat("_ShowDecal",0);
        }

    }
}
