Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A936ED2ED00
	for <ath11k@archiver.kernel.org>; Tue, 20 Jan 2026 02:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMjkrdm9ThDbm6nZ2qzsucANq/wC95yDAs4s1Sf8szw=; b=Kkp0r1MhCsjhhpeSB4Gn6oiWmC
	EMK/OOtF9fq3o1rwSmjkT5aCWbdAcH3SfAq8hiwY39WA5VDdJ7CgCT5iSlAmacWDTs5RrmmVjuRNh
	OQD/pV3xvVb7TaD7ecMkDrCQsCjh0haFGPpIqPkcnqd879dgKuyGtVgJocy6/IzjTjPzC5EWVqLxh
	H9f/OrObTp46qz5760flrbiy6koJRf1KHJ7t+AeR6aNltO8leiNophREBHRo/foSQ4JMDSjWQpOU9
	lCYH7Y40lbGG5UTLnBXHihB6X5g1YIFVWcDSuBfBzszNrwTH+OnB9D7HFTZDlHHeL0wfpQPNthYZi
	l+wWfUNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi1rd-000000036TY-2Oqu;
	Tue, 20 Jan 2026 02:53:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi1rb-000000036Sq-0PkQ
	for ath11k@lists.infradead.org;
	Tue, 20 Jan 2026 02:53:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K2WIKV1347163
	for <ath11k@lists.infradead.org>; Tue, 20 Jan 2026 02:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CMjkrdm9ThDbm6nZ2qzsucANq/wC95yDAs4s1Sf8szw=; b=CSCvIEpJ7+SLqy+M
	2p8V+x9OsJzVWnr2a0hZxkIdUz/Hg/Qs+/LPHpvEBwx3Clz2LA+WwKihcNEP0dl7
	idkjCePiVY3t4CBN/4nT1hji4pbJlNMwagDPPpi7LrvIwothR3LBL+PR5iBY4kma
	E08okrGxXAI1EUJ2Q/5Hnw1nmmGVzeBO1HkMJ7bUgtfkBgf3lCj0amamAHWK5p+w
	/9ZBgAJUS6Ml1rqJOgyc4rfR+e3vs+Xh7qaMMGWm89Xd9m4T0aRA+h2EFVUGVv3l
	IP5XxzFafYdQaDnXhva/mls/TRdr97BpsEDmfbdHc+plpjvyuW8dqBc4rVgE0xiX
	B6Z7Qw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsnpdhmsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 20 Jan 2026 02:53:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a351686c17so45721235ad.0
        for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 18:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768877581; x=1769482381; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CMjkrdm9ThDbm6nZ2qzsucANq/wC95yDAs4s1Sf8szw=;
        b=jEkFfqJt78D0p0P98BwnnlGLOOAjva+YmSz1eqTiRXvuUApyp1X0tZy58G2ZvFFQsU
         +WPPXRNLQYHRGFHNuOuq2ifrtZX4BEvYIrSWKmG4XNs59rejo/U81jbwZdFAgW+PFRLj
         j6zbmH3f+cebkjx8UWqFQcSOrCNq8CrK+vyMzlVCet/aG8eWzxT2tBpWKH9tDf44ui8p
         6oT1K+rDZ9I6Alx2wEI1Il3TCikbVKBSLZcGfVZgExjiatAdzRczLHQL4LOr6mzi9oND
         7jdwiboj/sDY6VfI6Nmql5aaviI+NTGU6Xc4ArHUVHs8FVzV2B42GF0Y3uvGebkYijq6
         0vtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768877581; x=1769482381;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMjkrdm9ThDbm6nZ2qzsucANq/wC95yDAs4s1Sf8szw=;
        b=fFLCM2pYXnbRQcQH8qjwjhwrcYfvmsUckYOtQe3cS70s+nLEwJjv4Bg0xFiQW0yOj3
         5iVcrSLf4icwjFebizvxOfLdFFzgmDv5MgShPMvtc7jTZMVcYfpNeUqNEdNuv58fdZZ8
         IhgOu6yeRdKZL08SNJju1nZBoz4n5vS3oDhwFtiK9uDP2OFX904Z4rDoKN+IgQ1uYsKr
         vY+EIfoklw1g4qMpSbJfUI/rHwe7p9uNUJdZhqoxZI1WTtVV7J0eI4Dyxjr6LALwOeCQ
         zenrPOd2oTAilL5pHLOsaeJz8Tv7/LKVxdYNdJRRzrFgt8YY7SH9b7IhrVL/BzMtVUec
         y4ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYWsseyDlMZnqR3iCEkobSLan7OM68EDJAQgo8Mt4/k2zSp7iuh1qJ0p7bVf/exthj+uFL4eU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLlCsJs5AAFGojs+SyC9wURGAMNZgpgQ5zgxjUBDClcSsGqyjE
	BPnh9hfzrDThbkA4jVbCu74GiBy0S5KWz5zNwOnjGsMyK0t26TQXvfDHOsn4wgZ5bpBvwgGhmzV
	RoIiJ2dI6AFf0+jjRAhD5pSnbhaJliHupZNvSGwp1GT364HiztO5UUiJVgKOouw8I
X-Gm-Gg: AZuq6aK3ThuErbrWaSHZq6k7wD0LbIWFbgXhLuC150qKEK2AYP816G6VRwUohPyFPLG
	aBgTkI/Ex3VynZiodYKBf0rCRQmQGsi/r+RGFMGf1lk5sIRp2V0Am8u6DmeO6T5Rnmcu+YDWEBq
	GUG9IJ3UMGrJDgb5RDZaXnHiHUP0EziTXtRoAFukpxJRner8Ymi3TZPtKn2HTkm1zz35RSAWXNb
	XPBUrcsOynhPpAVffPfcNpKCdYIexnFvJHDyOI+tJ5/UkaiP885rW/Ly9djcGy4elbE0QLDVPeM
	HfF0FLPqyaEzuKqHDW3epll69K7Wg721u2Ux0HeOCeNe5181OWsjq6xwbdNQ4QAgYgIvrOAlaK+
	usrIi7WugSMJhicGIofSb4pOi7WQ1CC7v2sAscfABcDCV3eIkP0RAhzyxJTin/AINsOvfitxtq8
	pNxPIomxM=
X-Received: by 2002:a17:903:9ce:b0:2a0:b438:fc15 with SMTP id d9443c01a7336-2a717519d9fmr123842835ad.11.1768877580763;
        Mon, 19 Jan 2026 18:53:00 -0800 (PST)
X-Received: by 2002:a17:903:9ce:b0:2a0:b438:fc15 with SMTP id d9443c01a7336-2a717519d9fmr123842655ad.11.1768877580255;
        Mon, 19 Jan 2026 18:53:00 -0800 (PST)
Received: from [10.133.33.150] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd19asm107690225ad.59.2026.01.19.18.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 18:52:59 -0800 (PST)
Message-ID: <55fad8d1-ab4f-48b8-8712-24664a6bab2c@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 10:52:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix memory leaks in beacon template setup
To: Zilin Guan <zilin@seu.edu.cn>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
References: <20260119160535.1874628-1-zilin@seu.edu.cn>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260119160535.1874628-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NtncssdJ c=1 sm=1 tr=0 ts=696eee0d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Nk4IflzP70UQ0qszZz0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: XYLKJMHP_lzAVfImiX_226FG43_j8Ku7
X-Proofpoint-ORIG-GUID: XYLKJMHP_lzAVfImiX_226FG43_j8Ku7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDAyMyBTYWx0ZWRfX52KfFdKMBeR4
 7DlAV/UbgQxjhyLtChEUaIDo2nJhejNY+R+fJTmrlow6TLo5TAvZKK8l6QySNJdF2tuuA8AG0ZL
 uqdGaZ31u4zYpUMOD/103Kj/7Jr2mi0uU3erHZfPdwkAz/CaaobkSjsZXSQz9XVV0fsdgu4Y9fz
 p9ofwA6d1UrL1QkObFfKHIu9nVIDkb4pjE9O59Mpo3r46NcRPjyvh3Ob7jJnphk7AfnOFCDP0aL
 DZK1SUa3eXDHw5zni25vyORWH/eZdEDI7Ip83v+tFkknm3FVjdyB08LUbfF2e/+VcJ4sJy5OLu9
 uGXLR1FVbxaUxMbNo+mvxtroIK+OGxL1O8buo+2rriC28Io2aRoJ+o3Hihu/R2V0wIW9oX7OwJ1
 wD1Ljcq7yVJFuJ2zU16qB+QeiCGDalnaVWbz7yPqKBkXmb/BbwDLQ2n1Nd4AqNfnuuirIiSm4t5
 NbEKF/LBu5S35PNa5ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_185303_266891_3132BBED 
X-CRM114-Status: GOOD (  23.92  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 1/20/2026 12:05 AM, Zilin Guan wrote:
> The functions ath11k_mac_setup_bcn_tmpl_ema() and
> ath11k_mac_setup_bcn_tmpl_mbssid() allocate memory for beacon templates
> but fail to free it when parameter setup returns an error.
> 
> Since beacon templates must be released during normal execution, they
> must also be released in the error handling paths to prevent memory
> leaks.
> 
> Fix this by adding the missing deallocation calls in the respective
> error paths.
> 
> Compile tested only. Issue found using a prototype static analysis tool
> and code review.
> 
> Fixes: 3a415daa3e8b ("wifi: ath11k: add P2P IE in beacon template")
> Fixes: 335a92765d30 ("wifi: ath11k: MBSSID beacon support")
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 4dfd08b58416..005cc81a3244 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -1561,8 +1561,10 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif,
>  	}
>  
>  	if (tx_arvif == arvif) {
> -		if (ath11k_mac_set_vif_params(tx_arvif, beacons->bcn[0].skb))
> +		if (ath11k_mac_set_vif_params(tx_arvif, beacons->bcn[0].skb)) {
> +			ieee80211_beacon_free_ema_list(beacons);
>  			return -EINVAL;
> +		}
>  	} else {
>  		arvif->wpaie_present = tx_arvif->wpaie_present;
>  	}
> @@ -1623,9 +1625,9 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif,
>  
>  	if (tx_arvif == arvif) {
>  		if (ath11k_mac_set_vif_params(tx_arvif, bcn))
> -			return -EINVAL;
> +			goto err;
>  	} else if (!ath11k_mac_set_nontx_vif_params(tx_arvif, arvif, bcn)) {
> -		return -EINVAL;
> +		goto err;
>  	}
>  
>  	ret = ath11k_wmi_bcn_tmpl(ar, arvif->vdev_id, &offs, bcn, 0);
> @@ -1636,6 +1638,10 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif,
>  			    ret);
>  
>  	return ret;
> +
> +err:
> +	kfree_skb(bcn);
> +	return -EINVAL;
>  }
>  

below would be better?

@@ -1622,19 +1622,21 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif,
        }

        if (tx_arvif == arvif) {
-               if (ath11k_mac_set_vif_params(tx_arvif, bcn))
-                       return -EINVAL;
+               if (ath11k_mac_set_vif_params(tx_arvif, bcn)) {
+                       ret = -EINVAL;
+                       goto free;
+               }
        } else if (!ath11k_mac_set_nontx_vif_params(tx_arvif, arvif, bcn)) {
-               return -EINVAL;
+               ret = -EINVAL;
+               goto free;
        }

        ret = ath11k_wmi_bcn_tmpl(ar, arvif->vdev_id, &offs, bcn, 0);
-       kfree_skb(bcn);
-
        if (ret)
                ath11k_warn(ab, "failed to submit beacon template command: %d\n",
                            ret);
-
+free:
+       kfree_skb(bcn);
        return ret;
 }

>  static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)


