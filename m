Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A16C531C9
	for <ath11k@archiver.kernel.org>; Sat, 25 Jul 2026 02:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jE1kcn50NdHtg9rHOHQYVIhR5o62mSnqkk6OEOynRdQ=; b=4YTWtLhACP7DbTUrpR0OZInUXy
	4l/KP3VRJt8fUMwLcMwfCvXoxSypC93il3zy4gtP6XX4QDu/vL2/+kHQ6A96y765GspyJkZDzvn4A
	ZTf1CHpKaXLcMGF9+udaNJO6RoVpA3FW3V/US+xe1A2ICHWKh8y5mb4UsKCMg+7Db5SAxVHJoKNBy
	ytzYNy7JCy2KUqaUg8Qah2iGi+ql4aRyFO9MAEPV7VhiPczoSMsqeB3gSCIO05aQQtnMcayocpJXr
	F0P9+ICgvs6hnd7og9RDWA3qFSu3kmJiqOxxB4LVpp1NWlI5JLClOlTZ/fJHqf0D4oKLBAfThP9of
	j6Nz56Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnRtF-0000000HTeg-0tbA;
	Sat, 25 Jul 2026 02:13:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnRtD-0000000HTeH-1QOi
	for ath11k@lists.infradead.org;
	Sat, 25 Jul 2026 02:13:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66P28nrQ938311
	for <ath11k@lists.infradead.org>; Sat, 25 Jul 2026 02:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jE1kcn50NdHtg9rHOHQYVIhR5o62mSnqkk6OEOynRdQ=; b=gD5LoPJBajjzddWH
	O/x61VH99kfrYFCQTu30i1qZOxuri0ck4+BFAJwGiMFV2eHtygUdMcYLPiZfwyVi
	yEHqU4gbahDfU7Wgklffan9oOlPu8CxsrVC4a1cC+3S/QFy9kkLmb+BcZeD2aaGg
	Xd5kMKfY3CXmqIf3mamAQ/huDroEWHLzc31lhQvJ8LEoEIae3AdQuH8tXkrrqSaz
	J+pV6r84QayfR3mV4QL08RSW3TALz6QSYi3dMoeJhz6ioq4xAvn1BHMYSs7Fn0K2
	HvB0PGJwnxFWIbOJsNFBw5aI/8GQjBHy7vFT13IGMDvJRfIGM0RMle53t6jlF9EU
	G8GsKg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm3s809y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sat, 25 Jul 2026 02:13:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so2270972a91.0
        for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 19:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784945602; x=1785550402; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jE1kcn50NdHtg9rHOHQYVIhR5o62mSnqkk6OEOynRdQ=;
        b=K0sOLTCpT8DLxS9hOi8bc9dZgCRA72UFvjlEnyYLR976OizGFSw3TvZJ6WqiB4DPTt
         eWgq2X6KMac2zGcgJWOECgGbUiWK+TV0/vqJKwdtGHxnqFcNbYkwHsVZ7K2Q4dxc/Uvf
         BjR8dt24OrHZi743tPxI2rrdgD4rND6HaZKBfqXiGFW520EfpuLz6/rcw+8y571zErKF
         Yvai44amB61ImtRNqVVUJPW2wjxCSK9K7xcWN9djGS0A/djoOG1kGylMUe7fP+lAVeRX
         LYCviXVxdXKoDoWTmdeEIWpYg7IO7FrFgH7IGBIsNy+vD4QyaSzBZKirkA5apM1tQiKH
         irqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784945602; x=1785550402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE1kcn50NdHtg9rHOHQYVIhR5o62mSnqkk6OEOynRdQ=;
        b=iXC6x8CYzOKdMQUtLriExoZPOEP8mq/rNrk2Bp9cjaY3u7wSz8pJcrSQB0RDj8G/Ug
         sh9E9pf1VxbvhUaxgldUUw+uO/tjbODWDKH+tD2iPwL0Fe9d4ncjxNNTUCkN8jNtWlRB
         QI8p0QAsMIlRTLHZyEqw4R7kfyeeNPBzj4IaUA+dcuTBdy+oV9tE+I6D8itud/JQZUIb
         rKnyxOvMY21YX+L+NW5qDq1ag+NhdSAJyytp1RdIADKBTmtQANcxmXUsFQXvVMv+wtVd
         X2vQ+ZO0jADoyUQ3y1su3rSbMxSgSqvo3PQWJvzOd0EHovjMG33fwSM2hvo9vkaTAl0o
         IiJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzC5p8lEULvEuWbwULCCdRrxjkjCmFSSJSSEPhscdqjYFApwQ7uZTeH2fq+KG6/BrMzsU15WU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1fXQE+YHVkZqRCXdZscIqWIIOE/XtdWeeP5S21Lz637IVE7yS
	1nQLhWOYgytJo6FdV6H0uuc51Jxafn3sj6hgACgKXoGjWT+X5ZXq5ekhfjVfxH01HJrOozS6Bcr
	2bVkcL+eRBXHJATBhZ+GzGmj1Lsb8llcywoKnp1bt0y79IlDEH3vlao5/CykgLzja
X-Gm-Gg: AR+sD11R+qQ+DYWWFMC7/GdgvaxY/xDcBzMNVxjhSaSwuMnNuPO4ZghIbLq3rDSfzEE
	g/Y6lfq4sFA0IYw2oDB4FRUvuP8zQ4MpJQLwRV6S4pXaYjPVDhnSo2563yRXrTx87H85srcyG93
	3R21st4gvbmAZPSq8Fs28cW5LFZTywVNu7GzGLAZGNY3ZqZYMiTY2M83WFPU0OwbvnhXeTD+jld
	o4b4LjJx4iWKyX6UndozQdhl6c6WgF3nJSXjv9PQaeNMX+7ukIj82TVRA45SxhuGkSlvADt8Ly8
	yf6JdUbcOX0zRuiKH7GyDEuMvfBXe1L9yJLcFTlXvxiuDs1Etui9cIgc1cCO0+g5QxkEe2id1Aj
	uRcsq8ZjyAspH9HFts9K+ouTrNnnOBwxAGW1DSPk6PVW55uPbZFNZ8lI5uw==
X-Received: by 2002:a17:90b:584f:b0:38e:79f:76c6 with SMTP id 98e67ed59e1d1-38f29641ae1mr751209a91.24.1784945602009;
        Fri, 24 Jul 2026 19:13:22 -0700 (PDT)
X-Received: by 2002:a17:90b:584f:b0:38e:79f:76c6 with SMTP id 98e67ed59e1d1-38f29641ae1mr751195a91.24.1784945601609;
        Fri, 24 Jul 2026 19:13:21 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm27398246c88.7.2026.07.24.19.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 19:13:20 -0700 (PDT)
Message-ID: <b6903572-52cc-4c41-b9cf-5845e387c176@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 19:13:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] wifi: ath11k: fix resource leak on error in ext IRQ
 setup
To: ZhaoJinming <zhaojinming@uniontech.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260723013818.393470-1-zhaojinming@uniontech.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260723013818.393470-1-zhaojinming@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDAxNyBTYWx0ZWRfX3/5vk13SQ6Ue
 LiU8Ure2haZzodHxbuKaZTQE1o/3HVwr77Jsge1tGi37PPtoHVrzwme40UVSfwRN0h6A/kdcMbg
 g48dLoKziDKmAKM6xN2v4qJJ28rbBJitT1xG8RRAljrDueaAAvgPJZODEpzkiEsMQXQSV3hV0LZ
 zNkx27kxG3GejyDnxelnGGbavOvP7RrAUqsJ5ALRug2CUV9ckA6W1PddDkB7HfGPunmxZCcpKwj
 FqFUkjwAO42NuNasteuHWqq+XvRlb45KwSg9oK+De/IAmCL+jh/Ie5BtByusApBxygISGOIf4Y1
 5SC9hgdPBFrAboScC/8iG6ky1qC48PfzXGExT//Vg7qB8tG87wboIEXYt38ZW8Ys+AUSdeRulQ7
 LPmjH7tT4Lq6tS/sXqEJw8iBhnXUQjRY+bjGpUWmwQbsliic7sEchsOErk0+tRqVzW+0a5oheCq
 YcH3oZQSoaLuIT0OE+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDAxNyBTYWx0ZWRfX0ZYmtTeIX7tx
 c5yejV7xU/LqJHPhtyXsg5RafacMcY7q8qJ7mCNOzhTV2+NrYbhCa50r0SaShQKhWSR4nDNeWYb
 75i/2RzB+sOoJPGhuodksvYwJ61mIDo=
X-Proofpoint-ORIG-GUID: 6zM0vIzQZVs1jC2jEkitap8kCbxIGnE2
X-Proofpoint-GUID: 6zM0vIzQZVs1jC2jEkitap8kCbxIGnE2
X-Authority-Analysis: v=2.4 cv=KanidwYD c=1 sm=1 tr=0 ts=6a641bc2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=puE-CX9gChH9hliuQHEA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607250017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_191323_392984_2A306278 
X-CRM114-Status: GOOD (  16.59  )
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

On 7/22/2026 6:38 PM, ZhaoJinming wrote:
> @@ -585,9 +598,7 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
>  				}
>  			}
>  		}
> -		irq_grp->num_irq = num_irq;
> -
> -		for (j = 0; j < irq_grp->num_irq; j++) {
> +		for (j = 0; j < num_irq; j++) {
>  			int irq_idx = irq_grp->irqs[j];
>  
>  			irq = platform_get_irq_byname(ab->pdev,
> @@ -600,11 +611,23 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)

my review agent noted in inconsistency between this logic and the CE IRQ logic

just above here, after the platform_get_irq_byname() in the prior chunk, is
the assignment:
			ab->irq_num[irq_idx] = irq;

that assignment takes place before the request_irq() function is called and
error checked

in the CE IRQ logic (see below) the assignment doesn't take place until after
the request_irq() function is called and error checked. so consider relocating
that assignment to after the if block below
>  			if (ret) {
>  				ath11k_err(ab, "failed request_irq for %d\n",
>  					   irq);
> +				irq_grp->num_irq = j;
> +				ath11k_ahb_free_ext_irq_grp(ab, irq_grp);
> +				goto err_request_irq;
>  			}

so assign here?

>  		}
> +
> +		irq_grp->num_irq = num_irq;
>  	}
>  
>  	return 0;
> +
> +err_request_irq:
> +	for (i--; i >= 0; i--) {
> +		irq_grp = &ab->ext_irq_grp[i];
> +		ath11k_ahb_free_ext_irq_grp(ab, irq_grp);
> +	}
> +	return ret;
>  }
>  
>  static int ath11k_ahb_config_irq(struct ath11k_base *ab)
> @@ -629,16 +652,24 @@ static int ath11k_ahb_config_irq(struct ath11k_base *ab)
>  		ret = request_irq(irq, ath11k_ahb_ce_interrupt_handler,
>  				  IRQF_TRIGGER_RISING, irq_name[irq_idx],
>  				  ce_pipe);
> -		if (ret)
> +		if (ret) {
> +			ath11k_err(ab, "failed request_irq for %d\n", irq);
> +			ath11k_ahb_free_ce_irqs(ab, i);
>  			return ret;
> +		}
>  
>  		ab->irq_num[irq_idx] = irq;

note here the assignment takes place only when request_irq() is successful

>  	}
>  
>  	/* Configure external interrupts */
>  	ret = ath11k_ahb_config_ext_irq(ab);
> +	if (ret) {
> +		ath11k_err(ab, "failed to configure ext irq: %d\n", ret);
> +		ath11k_ahb_free_ce_irqs(ab, ab->hw_params.ce_count);
> +		return ret;
> +	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int ath11k_ahb_map_service_to_pipe(struct ath11k_base *ab, u16 service_id,


