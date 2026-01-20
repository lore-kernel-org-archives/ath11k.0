Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C055D2ECF7
	for <ath11k@archiver.kernel.org>; Tue, 20 Jan 2026 07:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gd7D/YUZzVo2knwthSbnndhf1Qb341qujHUYrRBqbTw=; b=4hfED8MB0/qq/FeF+pq4fs+t94
	Er+NJr0MpiUjzbAZ5tkcv0rhUdfUqePxF7gTF1LGblVi7VI22gD8UYX14385/zH+Qye26YHfznTK8
	v27tX1QU0MDTYVnLiz6/o5S62wH8xb0CX3D8v9oZ1DE5DIbDpkYU4Ks/hMr0a5qQc8hJos22FALe4
	aIqpTyGgUskhTx+lPx20Ygm7fTqS+6hddqhhbViR1EYAMNH3XMfyLy4MQ1iw01Uu8UYsdnlI2WFd0
	+3/j2kVz4Dk40rak4LdudrNIClKayGTofE1qg1ikJr6B+y/tHZcaxedVmwRP3+dPcILou2vNyENws
	kfzIvTIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi61H-00000003L0p-1hyl;
	Tue, 20 Jan 2026 07:19:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi61E-00000003L0O-46Y1
	for ath11k@lists.infradead.org;
	Tue, 20 Jan 2026 07:19:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K61ZaV3772487
	for <ath11k@lists.infradead.org>; Tue, 20 Jan 2026 07:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gd7D/YUZzVo2knwthSbnndhf1Qb341qujHUYrRBqbTw=; b=jxuO37CiV/zMaSZ0
	Dbhx+SlKE1KgIcWMQijlbPhYDWLxtYUbl5q/+OM2Nch6M+W9EZiEHRMmy3WeMBGT
	xJpnRuTunGrZwI/N3PLvOr9GxdnQoaIp5+OlTiH/OEWamu+PJy67Y2nVovH+9woA
	yN2XllfRLNfUewWa6m+B5nf1EK7o+uV/xgWDgsXOkn2e8lgnm9A2P1McXTdPE1wL
	sKCx3fUZEIoN/wmzM1fCu4dw4vmQivexHCetmmC7Zx3u7wRQjih1SfTYb3aumwXK
	3HS0i1pAdHCfk+GbA91x27BHhWy0yZlMJxbN7OnNwNRKfwG4PidLUnZ2YnhWuKBh
	a7HZaA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt42wr7wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 20 Jan 2026 07:19:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0f0c7a06eso47560785ad.2
        for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 23:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768893556; x=1769498356; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gd7D/YUZzVo2knwthSbnndhf1Qb341qujHUYrRBqbTw=;
        b=GOXilYw7pi0S/3WGjYcjJrLXIHvR2thVpH2YLRMbX85FQ6UphhLlVIlrWvKjPnhH95
         ib/KciQqjI7ntKqR1frHu4Dy7flQbjyqOfV8Rx54g+hkv8qaqvHBtdn4L8eV/xKzMhTZ
         pf8Ivgfc21RO27cDIo323M8XlDtPHUUboSbfQ98wJvQIig86/mywO3iimIJ4DP2mVxls
         CIAR44GuzzHOMTq/9JO/G19EnBvDBNZ3BzAo13RiJnDtvA2mLUf83bnUIhr4YZRSsGUw
         lI6Z5Ca4/CAVlpO7QLBaekw/TdybPc5jSeWxGOsX94KzUO+CzTgyXOeT3CXtFA5HF0pa
         efdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768893556; x=1769498356;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gd7D/YUZzVo2knwthSbnndhf1Qb341qujHUYrRBqbTw=;
        b=hmI6stj8sBQ8xef33clzrwZoAWPDPoBGKL3ndYsVOLjGv22+JaSIeBiGgbuOWJtV2a
         8tsKGyU2yf0gq83tp+z2Dj59STycDOBhiqrg8LMWDDUhJlQFtFFP1/rub5VvIsfwQVIb
         Ri4OWmTONNHomk7/LsR4jG+9JYPyaBGhxbiLDb1O1uQY0/VN3Ao10KKcYXKstGOi3I8L
         MudqBRCR/fKOXraHKthSFxCz9je9sq/xK+2akukd+4UeiUkZ3D99HmMzdDsfoW3KD85s
         Su2Jm5SuF1Sbr9sHV72GNtsMU7tNlcSUZeO0ozU6eGv96Eh3pRdptRg5EU2TuTK8nuVB
         G9Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUHHLm6nGbzsxSFGhq9tN6JQJd6ItgqaKiOyYa8YTkVzIsjkkQWXhCxg6MNekd99Cz7lOhs+qg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxL8JzdGk7trZWlJZxmu1sP9QmHMPO7y9XqdTdED/hflAXfnFDn
	wnBoBse4v8DqmEptJVOmtNyMZYea5oYyp8+0e93t7btKzpySsqv5QL+5/roz6m76KgdGAajI4eS
	pYFBoV+YW9mMueIQ27/jHKYg1O2GoB1WOUa50Fb8QDQxmUbAPCBAgekDa7fB8B2Zx
X-Gm-Gg: AZuq6aJaXL4n7RNo9scGh0/otMWkQ04kaQnRfPEXKzbXMo9kb3yifKRK3w+fMHVW888
	6pVYDcWkxDOPq/vjTO0eQgKnRwE656tg2vyybrkX8p6e22KMKUgvdTZzXQIpSWEifz0SOUwOA6/
	pW5ST3wc6BQeckBHXvmfilbrhd6j4sq41UOAsbN1iWQpEztXGF7Ult3waLNOlC+QwSsL8IwLLp4
	dgSlCI71vNLfqvH/7CNB7sNrJcRFzYSahCBf/a6PdAJ26Y5vEbRhpAfHdptPn2BxfnswCI71GBa
	wgYvu2qQCetML5XR+GfPa586SRFQsRxwwvrERma2UhCFIBaS7lFzY1fD8tyb5lCwx7yBkCON4Lh
	5czyyBXFGAhX8PrL6YPRYEx6fRp15tfxxYswDD3uNJVNIqapjQtYECkAa+oBv+k/1IqDfSD1oWV
	SRWdMvXwQ=
X-Received: by 2002:a17:902:c40c:b0:2a1:35df:2513 with SMTP id d9443c01a7336-2a717533c8dmr132039395ad.17.1768893555643;
        Mon, 19 Jan 2026 23:19:15 -0800 (PST)
X-Received: by 2002:a17:902:c40c:b0:2a1:35df:2513 with SMTP id d9443c01a7336-2a717533c8dmr132039265ad.17.1768893555137;
        Mon, 19 Jan 2026 23:19:15 -0800 (PST)
Received: from [10.133.33.150] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce6a9sm116209015ad.34.2026.01.19.23.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 23:19:14 -0800 (PST)
Message-ID: <40ccd4fc-33c8-41b5-b68e-4e590a5a6ec5@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 15:19:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: fix memory leaks in beacon template
 setup
To: Zilin Guan <zilin@seu.edu.cn>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
References: <20260120063731.2383695-1-zilin@seu.edu.cn>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260120063731.2383695-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0MFVIVACuc3WiIHaa1hgVgRyST2o82MU
X-Authority-Analysis: v=2.4 cv=eJMeTXp1 c=1 sm=1 tr=0 ts=696f2c74 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cJDDEaPil63sA2faZhwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 0MFVIVACuc3WiIHaa1hgVgRyST2o82MU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA1OSBTYWx0ZWRfXyS3OZdtEAiJL
 9b3RN++F7WHpiUweFniW923rt1/10olW1b5i988kA6c+kS/AJjp6iug0ZvUu6C6d6LVGywd9o0Z
 Uxo08b26nHsuFA8qZKEGLGkBcneXgoyKoaBcTrUCpshfrolnqMGCuw8nrnXikxzJ6mq+61DLkcT
 b9dz86y703l1ahSsgKVqP+RJYjhdH0OqK4aVIHFaypbHQ5BWvsercBN+8cHH5NRWrjB+y5Ase0a
 wljvJzsXhUIc4yyaRZXe4TaPUjQi3C23QMTezqpTSytGhDbhbH4+JsGrgfhiov7GEX7aaw8acc3
 GZGnE/Ai1SBR4B2vkDY0U8F8svXSrzkm+c81RXeUCNNBxnQKdzRslQqMnSShl7zHZ9JJvjRpIWv
 8IN9olNkotyYvj47HGwmoEhuIjklHfQNnZfS6N9EYFUf1IDhaMgT9IJ+p5ZP7GGHQe7bK/OEifE
 K/oaT9/GUyAprlcmfug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_231917_024376_1818EE7A 
X-CRM114-Status: GOOD (  24.11  )
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



On 1/20/2026 2:37 PM, Zilin Guan wrote:
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
> Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> ---
> Changes in v2:
> - Use unified exit paths for cleanup.
> 
>  drivers/net/wireless/ath/ath11k/mac.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 4dfd08b58416..42edcc5e9e49 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -1561,8 +1561,10 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif,
>  	}
>  
>  	if (tx_arvif == arvif) {
> -		if (ath11k_mac_set_vif_params(tx_arvif, beacons->bcn[0].skb))
> -			return -EINVAL;
> +		if (ath11k_mac_set_vif_params(tx_arvif, beacons->bcn[0].skb)) {
> +			ret = -EINVAL;
> +			goto free;
> +		}
>  	} else {
>  		arvif->wpaie_present = tx_arvif->wpaie_present;
>  	}
> @@ -1589,11 +1591,11 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif,
>  		}
>  	}
>  
> -	ieee80211_beacon_free_ema_list(beacons);
> -
>  	if (tx_arvif != arvif && !nontx_vif_params_set)
> -		return -EINVAL; /* Profile not found in the beacons */
> +		ret = -EINVAL; /* Profile not found in the beacons */
>  
> +free:
> +	ieee80211_beacon_free_ema_list(beacons);
>  	return ret;
>  }
>  
> @@ -1622,19 +1624,22 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif,
>  	}
>  
>  	if (tx_arvif == arvif) {
> -		if (ath11k_mac_set_vif_params(tx_arvif, bcn))
> -			return -EINVAL;
> +		if (ath11k_mac_set_vif_params(tx_arvif, bcn)) {
> +			ret = -EINVAL;
> +			goto free;
> +		}
>  	} else if (!ath11k_mac_set_nontx_vif_params(tx_arvif, arvif, bcn)) {
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto free;
>  	}
>  
>  	ret = ath11k_wmi_bcn_tmpl(ar, arvif->vdev_id, &offs, bcn, 0);
> -	kfree_skb(bcn);
> -
>  	if (ret)
>  		ath11k_warn(ab, "failed to submit beacon template command: %d\n",
>  			    ret);
>  
> +free:
> +	kfree_skb(bcn);
>  	return ret;
>  }
>  

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

