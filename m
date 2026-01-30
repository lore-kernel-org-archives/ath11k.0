Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051C3D49C9B
	for <ath11k@archiver.kernel.org>; Fri, 30 Jan 2026 10:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajrqp3chO4YHwqPxAs4wl7Ae8mZrzZqPM2SAtc3oJGI=; b=tdrVSdg9YcaCCXbG1olIY8f07u
	0A/PrlgqZcMJ2ODq6FM7k2xDUBuXSoIt+6+ahLrJfJqw/T6oKPB3krU40Ic7Lk4RVuHcCDCPnYSP0
	V7AYlOgwG17xMmcIld1jJqkqLchIB76Fg2/o8W3tU0eo/VEgK7jEFZ2zfw9t2NxOHqPGPQ++SSbcl
	wARrLgHlGaqsyYMyLcSCv7TDMKvvriPHLrZTBJQCmGWsdm3wmkHuszSzBjUZVVoXCARv4GYH6k1rm
	ikHKNg9S1ugYwNxrpL4ByxxugENcOzMwZQc1oTbL1+grN7byqDwQAdYNK01jASeJd2njoeG60TyXP
	Ldxo0WLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllnc-00000001KV5-3wTP;
	Fri, 30 Jan 2026 10:32:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllna-00000001KUL-0hWm
	for ath11k@lists.infradead.org;
	Fri, 30 Jan 2026 10:32:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3VfoV891604
	for <ath11k@lists.infradead.org>; Fri, 30 Jan 2026 10:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajrqp3chO4YHwqPxAs4wl7Ae8mZrzZqPM2SAtc3oJGI=; b=eC9NAg280b4uiYqj
	OLZRbdCg4/12nYDVA0wjoZwXyL6aMQ7GwFf+gjEISscSkGo6i4Z8KCSxqQ9N0d72
	QISL5CFLJFZ3O7bnoSlp/X7aQHzahc6B2F3Wc8TXUhQXFRkqEACapwhVwothBtBy
	KctKf8+gy/A3sLeszVuIKpEcrcXtWtmj0jjW2aje0594g3j5kuEJgoLJVtaNV7yR
	zCGgQGca5flMZDLurgBrEI/Llvd2Uzk99/sK9JJRG63A2uAj5iycL7coq36GFOnl
	pu5GQaivAKMdlAsF8UJjKvFUF8nIy2XRC3G5Eu+MYPCgSF74S2gSEZeQ+rflAGg7
	RI0M0w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gs7st8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 30 Jan 2026 10:32:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c636238ec57so1344380a12.1
        for <ath11k@lists.infradead.org>; Fri, 30 Jan 2026 02:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769769141; x=1770373941; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ajrqp3chO4YHwqPxAs4wl7Ae8mZrzZqPM2SAtc3oJGI=;
        b=WZuaEBmpq8Hb42Wuar4eBGjep7awh3nWDATndGFGKqd0HEB5PUas24uwuQLqVqrwcv
         xemBqVFNhtZAl/LFbWW+l9cKbx64vzs0iIr2blccdFENDa88uoWSV9BDoYy31h2QkWcZ
         BdJsnym9Vu9JvF7maCGo++wspTOwM1DAw/+7StVR7u1QNFFHmPhCRRBFS1WPF+lIXtB9
         JEFCh58Op7WQ01XeS370ZUPb7L/R8V66ccgFW9gmMMH5wCkfZlq+ZkGOqWj3OOuFdF5r
         ZsoFSjiZiPTfR7rgiZHXWQrsxV8njMVK5NgzCW/0d7IL4JQKu2yfYYEalkhdgKQS0Ia/
         bk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769769141; x=1770373941;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajrqp3chO4YHwqPxAs4wl7Ae8mZrzZqPM2SAtc3oJGI=;
        b=DUw4fV1KUK7GVWbiEI/oq/Ph5NA0enQkcOqEnTnzLCfal+8ik/4c+Uqgehf7XMMplV
         7CDcw0IyKWMpbLtAk7nWVYOstd9kcu9mUOvDNW10vbJc6CPjp+IFWEfqaVnHzLmLPVu8
         Te0q3OsIgYLcNPzfQq5qB9IT/qhKASDMaybohCo5RJmC2siPcZwuSCwCtzaAZW3nvM8d
         JimkKhXFyA0FuRSorACdROoYUvvv/7JOkAk7SmJ8kH0dNowiIavU2IZmOLOOsMVWVDxB
         oyXduHRt0Q3wzEKKpwkR7SBTSSsBY+EgsgtPkgDdwf5KIb34UvXHAxPTT+qER/OeiqZb
         fIaQ==
X-Gm-Message-State: AOJu0YyYs/i+wbkga+gWax4soRqcQTCyyEpZMfVI5ETzuRvVAV4kSr0X
	e8aLGzChH1P1l/UTcFYt9Z8pRt+y4EKDV3rV7bJjgZ5d2Atpgi8qY8VhVYRf9y/9UGuJPr4X4p/
	4jWKqm3o/XfROO0uSFQzf5z/2Ecv7CdaO2imvhaWBdClSLGK7O91kPufq8riJMaVO
X-Gm-Gg: AZuq6aK4Z2oBXOCvfjTKOhzVsKToQUbQDc5ijWKEJVk5oARUBH9/OZ4BXwtruH6oA6R
	tVqs8N6Ex/jo/46Vs4Pl1JM71QqEiHTGINtmvJ5bRws9a5GFlWK/y6kGH/xCL+1SLjzUYfsXX+Q
	ZKIdAoSf+VDGw/iWEzr7uKp6jHqMnetB991ROHh8UoyMZ4NtlcVS0RRyLQ75jV0cXkLovDSCCdP
	ddIks2ysEDmCriFzS/Xtijt/HefuoYx9v3gcDIIzprX1SP7HL3JoL8tLnPF2lfHsikwFG7uvKcW
	L0nkyxI33qulwV3kdzKpRjWdq2N1wfUz149qiWlx9QsE1b4dYyj+fJWovYR7/a4KTC1GcaqaI+3
	PRzIxa7dd3hE3VxSh8EXrULtZchryb/771YuiMvCezDLy3WeOue1qriIgaMbNcUnFMB4XkbKpQ5
	SbBLU47w==
X-Received: by 2002:a05:6a21:138c:b0:38d:f56f:cdde with SMTP id adf61e73a8af0-392e0000443mr2454031637.8.1769769140787;
        Fri, 30 Jan 2026 02:32:20 -0800 (PST)
X-Received: by 2002:a05:6a21:138c:b0:38d:f56f:cdde with SMTP id adf61e73a8af0-392e0000443mr2454001637.8.1769769140304;
        Fri, 30 Jan 2026 02:32:20 -0800 (PST)
Received: from [10.133.33.47] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f2cb0a7sm7740722a91.2.2026.01.30.02.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 02:32:19 -0800 (PST)
Message-ID: <a4ffdfc7-5eee-4c00-9ad2-00f3088f0d42@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 18:32:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: fix memory leaks in beacon template
 setup
To: Zilin Guan <zilin@seu.edu.cn>, jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org, jianhao.xu@seu.edu.cn, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260130084451.110768-1-zilin@seu.edu.cn>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260130084451.110768-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NCBTYWx0ZWRfX+I1hjlwkh3B3
 ELJn1i2k+16yJ7eeGGEXVU5OEW4jsezhrMZc5gW5TsOiW7U8U/ssReuudj4ohRl+8mooaG9w5a2
 nwM1rx3D4P+bsqi9x86fy/aD62JHt0Er0DvibWubF0wxxjmv3EEbtxinX5WUtA7Zti64SE0Fbwn
 ljg2RkoB5PWOyLhu8TSUDIFGzPs9fnBcymf0btKkQ3437BM7scpUnq7cjy05JvBpgTQnayojX+7
 4ZPBNMQnHbT9+XQWjBQO4bpHz8Ie3mI+Zp8GDfe3pg5WCbcmA04wHYN9Sqjjne1IaAr5+g3m9Ku
 Ru2jKac+Xnd9wukcCtvCI9aS0DGJxbfZMlzuGUZ4wRNiAqQ3AcIlL/7b8RMHk0+nhUA4iQWKjgf
 8O+oAjobEdhmsc/hKpMOphr1xfZ/hIbst7UMnIvWo5azPEQ9hJjXVBifD+g8VMCZpTZ1I8qeqEy
 h66ZrwGSh9/d2Hok7Ng==
X-Proofpoint-ORIG-GUID: pHzeq_wBeNrX6N3ybfgKSE_rRUW9MEg7
X-Proofpoint-GUID: pHzeq_wBeNrX6N3ybfgKSE_rRUW9MEg7
X-Authority-Analysis: v=2.4 cv=UPLQ3Sfy c=1 sm=1 tr=0 ts=697c88b5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Nk4IflzP70UQ0qszZz0A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_023222_214939_5AFC479E 
X-CRM114-Status: GOOD (  25.23  )
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



On 1/30/2026 4:44 PM, Zilin Guan wrote:
> The functions ath11k_mac_setup_bcn_tmpl_ema() and
> ath11k_mac_setup_bcn_tmpl_mbssid() allocate memory for beacon templates
> but fail to free it when parameter setup returns an error.
> 
> Since beacon templates must be released during normal execution, they
> must also be released in the error handling paths to prevent memory
> leaks.
> 
> Fix this by using unified exit paths with proper cleanup in the respective
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
> Changes in v3:
> - Add goto path for the beacons->cnt check for strict logical consistency.
> 
> Changes in v2:
> - Use unified exit paths for cleanup.
> 
>  drivers/net/wireless/ath/ath11k/mac.c | 28 ++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 4dfd08b58416..e872f416ea97 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -1557,12 +1557,15 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif,
>  	if (!beacons || !beacons->cnt) {
>  		ath11k_warn(arvif->ar->ab,
>  			    "failed to get ema beacon templates from mac80211\n");
> -		return -EPERM;
> +		ret = -EPERM;
> +		goto free;
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
> @@ -1589,11 +1592,11 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif,
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
> @@ -1622,19 +1625,22 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif,
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


