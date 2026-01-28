Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47202D3F090
	for <ath11k@archiver.kernel.org>; Wed, 28 Jan 2026 16:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQGe/X5qhgopdlhTGL3zNTsLAfHq3ot7gtt/3+73Mrc=; b=VKg8FsHkSwENIBwtuS1lhVoj71
	sen1xkAm+rjkGeVwjhOYqjh0Iz2Ar8Z27RMNuyuos0F6ONZ+ssc8AQd1vIY8+CNo4en8XYYDTQEN3
	fGFd0xDJS5YGmVYwog71Yv/YR7fbn4f1iUCJxNvS/oubCmNeEa4fhAmSaT1Z5CQTSjFz2eb3BZdDZ
	66vSBPjvWs5V3XVB34d1eVc+wpSumxgCSYhMyyRwOhB3iA86rVxCK7Yg0JxeZN5wUSK/HCD9eNlE6
	l84lDK/pt+y4E4xUhtCmF42iwyDrtxdZ6j1zglg9GlYF+OnThQJpKwU5+wPMzRciURaLQCDedCUTq
	UKxUY+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8R4-0000000GOs1-1Eno;
	Wed, 28 Jan 2026 16:30:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8R1-0000000GOrC-1iBE
	for ath11k@lists.infradead.org;
	Wed, 28 Jan 2026 16:30:28 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFKaQL320318
	for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 16:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PQGe/X5qhgopdlhTGL3zNTsLAfHq3ot7gtt/3+73Mrc=; b=XDBjR8j8O2/EAtsV
	zWHfkUKTP1xIMVN4fWe5kedH/SuE+uLE+3mYAEsBOKCIKZmW4zbLK0jBJfLZd/qH
	/bcMs57pL38DCodeaBQrxXyBSq4M2OTgh90nlzZYkDknq7LfbbaChPCUv87ysTRM
	6THPM8zBi/CH6f9aVdcZOdHZ551dNElGKT+GdBrrxuiqRAv/ZhlVQ8cn+BBGN2BH
	Fd34EfAgaHPjmhmwBK3buM140M7Z8mDOK8dmopKei/vDGOgm2Xv9woJ5h9Z3IRdD
	9gcH61Nr2iRKkRWtDHOJLfpgSvM5yDRUy2dC67tXmvIDw9sTJ3chAwMyNO3H/d/I
	v1qd6Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjun6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 16:30:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b738854780so60909eec.0
        for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 08:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769617825; x=1770222625; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PQGe/X5qhgopdlhTGL3zNTsLAfHq3ot7gtt/3+73Mrc=;
        b=EiD2bNCJ0c1L88O4mX0OmVbgwS1sr54h0WZykc3ImUwjwkngCcmXvqduGfU1PFH/qL
         kBRFmp+ngNNjagEMPk2Dr0lH4dIXCmTAYJrTpbE3A2ROCE6pMMKtZuDKGI+ABfWfrP5y
         A/rfi22gfiKp+cRv0+omacr7RQoV6fHoLMXmk9E+JsbxlQTjuqyR9B8iBfnzIsgFBJnH
         ZjnljhmDfx9lMm6OCghfavR43XhDZ1Rj+jjcRbKP0+FrRke1g4CgVw3/4yepUljy91DL
         C20JvG+ZOf7kwTm4j81fK0mfWxtO/LYImrW4JYaVuDDC1nIDDPwvOaQFRlkHFRK384fE
         sjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769617825; x=1770222625;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQGe/X5qhgopdlhTGL3zNTsLAfHq3ot7gtt/3+73Mrc=;
        b=RPTbcbl5HK1xeh7PMbl+KqX9le27phmaGAwzyy8IZQkpWb3PQA9IbmDCD0ueg4r5P8
         76DVpUaW6LadT0fl3cNmSs8Ug+2k72kNvBV1VbnUViNhhmw3FzrK6NTSZt/Rj+Zb9uEH
         /Zwc7DwFVHmb6umTiqGjgIWokwH8np2h76qnDHAzbQ9KH8o3QuZX0p1UZKghbjhoNQds
         Y/qwCtqhyn/Ki4Xaxk5HQq5CneJevUcSSGDAlie6t/46XYZ+sWMegJwMjIFymX/cephZ
         SvHZjI6QqztQdstlvsLNW8E8pNl/XqYmyK+0Qu6M+I9b+IWLG3twE0rv9a6MIsu+S8kM
         gGBg==
X-Forwarded-Encrypted: i=1; AJvYcCUvQoJIyfbjOTouGCVGcIfyfXWTljRpdhIMka3US4md+CJvGAqyUDNsOrbVtXIcORHJC/bv48o=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXHAxSvfsOQSqCuS+nswTt6I1K/68NOBH1k9TgDGqdTCTi/ZO+
	OZlQHnXAlS/PuMyxxewyLnTqCDpKGjj4aSnLGMR7VY4AsZwz3GbcTy9KaJIV1rYIBSCdGKfZR9D
	B65E07FzIx7mJLzWEWbrWQ4zfxIDwOrmrPhHxN4r5DvQqmFiRA+D2aMpnnit5scZV
X-Gm-Gg: AZuq6aKOun+ezzwrZeDJ3+Lrflshq1OV/fLCK3YAO4oeVITTPu/OkvebH0U7QX9JjxC
	TTFgmS9cq80tHn/FiMAwW8eWvHOU8ypwqF16vjEt6DaaL/OtGLTsdrfGoDBDFBuGTZQO1KhKz8B
	PNtVzHfRBxTwxcr04G4Ry4cdCJqiBIw+HbKnhPLdJRFpqnpFnOtQ8ihxuqVXQFjt0K88urAPJ7e
	1piB/AxQLFV3vixbV/tJyrEXSbPiCz3OiweOLfbaOFQQOzqPWHTwv1VlBMJCw0b/WK8ZeWzjZHo
	IQBBdwpJnK0c1D9/SSshBMKo4wY1nCMBMo6PiOR9/AiCxTPDKOIPyWkNYDGLL5t52gcE8yqH+nc
	Fco+NWNr6ZS4SuyhGysVNN4AWaXP73JSEAW11ps68iG6RkdnWb4w9Z26HQF2a9AlZlumxXQ==
X-Received: by 2002:a05:7301:688c:b0:2b7:24ad:5c54 with SMTP id 5a478bee46e88-2b78d8d4028mr4295839eec.9.1769617825088;
        Wed, 28 Jan 2026 08:30:25 -0800 (PST)
X-Received: by 2002:a05:7301:688c:b0:2b7:24ad:5c54 with SMTP id 5a478bee46e88-2b78d8d4028mr4295818eec.9.1769617824506;
        Wed, 28 Jan 2026 08:30:24 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af88dasm3548084eec.32.2026.01.28.08.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 08:30:24 -0800 (PST)
Message-ID: <6cc72c12-6f50-4e91-9b7a-bde8633009c4@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 08:30:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: fix memory leaks in beacon template
 setup
To: Zilin Guan <zilin@seu.edu.cn>, jjohnson@kernel.org
Cc: baochen.qiang@oss.qualcomm.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        jianhao.xu@seu.edu.cn
References: <20260120063731.2383695-1-zilin@seu.edu.cn>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260120063731.2383695-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzNiBTYWx0ZWRfXz17BO2m3xn/d
 BGrz1MGTZ+EyYcZArKH459PIHmtpLwA+nB9Z2CF0zDDLkSr3gV7i5hSN35+HQHR+VibNcElCpoQ
 Nkdo62w0qYLqb/gqXmKq2RqsJQEM5WPD6oIaiRD3HnMdw+AgElqamdWqR0GHAN4J8wRZ0Vr7Sr5
 S3YuVcOkcRCgdgovMVJIAKHJ8G3Z3xLIVkpG1GYvApXuxrbbUpD1hC1eCDU4lGpiWqBqP2/k16n
 tY46MOYMFjBt9sKl6VfQdVeSVFpd9WMqU4122RDUwDkIMVU7fYsrDUwPGiz3QOWPs9BUQ+t1qKV
 H7f2EHPi68uGNbNSXNqsKXuWeeXhxVAwGj+CqMJRY+sIBXzI89YLBOZwvkY9qMwqKcPgS3hi/wv
 8RLd25hKJzJh+9kx78TkqcTaivIbCE9ljSzPCtZZC824qdIfjuoC7GLut4wECy14UWkA+hB1F5x
 777MUKQh1Pq0DydNcbQ==
X-Proofpoint-ORIG-GUID: sAp2zWM8sn79VOMNdwCG6sK-dbzZC13x
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=697a39a2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Nk4IflzP70UQ0qszZz0A:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: sAp2zWM8sn79VOMNdwCG6sK-dbzZC13x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_083027_580064_4514D6AD 
X-CRM114-Status: GOOD (  25.91  )
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

On 1/19/2026 10:37 PM, Zilin Guan wrote:
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

while looking to apply this patch I noticed the following logic earlier in the
function:

 	beacons = ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
 							 tx_arvif->vif, 0);
 	if (!beacons || !beacons->cnt) {
 		ath11k_warn(arvif->ar->ab,
 			    "failed to get ema beacon templates from mac80211\n");
 		return -EPERM;
 	}

I did not look at ieee80211_beacon_get_template_ema_list()
But if it is possible that this can return a valid beacons pointer with
beacons->cnt == 0, then won't this also leak the beacons allocation?

Given that ieee80211_beacon_free_ema_list(beacons) can handle a NULL
beacons pointer, perhaps this should also goto free?

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


