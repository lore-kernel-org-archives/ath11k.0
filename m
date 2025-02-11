Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEAEC021A1
	for <ath11k@archiver.kernel.org>; Tue, 11 Feb 2025 07:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+jjW3WqoDWb9MDSfylbdf32Lvi1zB6j1m3AVmlkAhM=; b=fi4nI8yc3OwveeCT/mfH7Dn9ej
	QHZ62KiqmjB49ow9axyekNJ/sZDr6kzuQlB1MucLAJhrPzhURlf3ByyfEEd7/Gwy1taRb6NFWt2JU
	iUJkQokD1FGws7UmkiAOlGNbkfFlPBCPGoDvQu22hOH2dnyXeNnS0Sxn1Kjr4FR/YFnlQzM3Lty+T
	rINTxuSk+yVD7R4ubSrKun1yt8//HN0o8f/55u5aSmoW6SU8ubXT5bV6JG7y4Nj2xcWC4nY70QjAk
	AWBv6bvXDmFTFTRyelSJ1Uj9AYxGDYznsyCJxpwYMuan1JObXqo2fgTIx0TjofKUrzKo7WrNKKq7f
	wrvIacvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thka2-00000002of2-0Iti;
	Tue, 11 Feb 2025 07:21:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thka0-00000002oeS-0f3y
	for ath11k@lists.infradead.org;
	Tue, 11 Feb 2025 07:21:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B3x2c0008232
	for <ath11k@lists.infradead.org>; Tue, 11 Feb 2025 07:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+jjW3WqoDWb9MDSfylbdf32Lvi1zB6j1m3AVmlkAhM=; b=NCQwdfh1by8NZcFM
	X2SY0hLKTOjMF2YaiHzAKMC1SKdrDhyqm0CkfwlKt8d1P3frVHBBuJ9lalo4uyVn
	+3hE6VRRJCYcLN8aVWN/RYD/NEp4Iq9Vgei6OeTCpXPIKlf4SsCpOXLJhV1AG2O7
	1xyvrIyNcIwrOZhlnQVFaaPb21Z2OX5gCBlLS/Uq8e0jFEZnn7qPs0tl9OT57kmJ
	iRUJ2bTIJkp6YDSv/EERwtzjXAReijwA+H9329BSTf9Xb6y+jy9b6pZlqiM+G3RO
	q1x3pvNy0002JvuVInn9a6A77VsV1wqYpdx7SCUQPzfJ2dTWfIi0Mmt2CjYJE719
	bAZ9Ew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qy4d8d1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 11 Feb 2025 07:21:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f81a0d0a18so11229589a91.3
        for <ath11k@lists.infradead.org>; Mon, 10 Feb 2025 23:21:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739258471; x=1739863271;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+jjW3WqoDWb9MDSfylbdf32Lvi1zB6j1m3AVmlkAhM=;
        b=cWWW0GyL+GByZi9OZc8wo1USUEeDFE6W3OMAG7n9tpRqM2+FuLPIqbGLA2o65n5SOy
         PO7PjIhmuu6GVm7e3yT7YU5al82epKdtPzNtWM0OBWpX4pqca12gljl+snPysvK975IG
         rMSwruSR0MZy8dOjg18bK+LDi1gf8UV01CtGzOH8jHysGiX3shA9ogQez4UVYriDtEAN
         4w9yN+qH/TyMFOWbK8Ka7c3pCYTcy+3GPfp3hLc4mGgp+LGQgY1mYXqx0y5sIE2Stu9E
         3kWM24SLX2SFxXk2uMnBnyjup1uv44zSTnXw9wHQ0Pozbr1Vbly8b0sjIz/fUlbY20VV
         FCHA==
X-Forwarded-Encrypted: i=1; AJvYcCVCwAXo0S0DaIg6zQRYmXdcOEy/qgAd3gbA0x4kLtvhfxNUIIsIPSgZ/ZUNzlLbhxegCUV5IgM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGxN2WxKDYRdwzcsz1aZD6IJGcF+tDlym8+XmYTY7AOnFNdl2v
	kmTGHnYGTx+0DbeLqFKSOO3rjUKXMCBF3KSSJoHS5NoZUMFk/iw44rmSxLARmoNb0lxtiVegAwl
	gjZn83TEu7DxNbpSNxe4bq3uINb0TMcSEGLvSkXNerSUFraYo6k0pVhxwdzmw
X-Gm-Gg: ASbGncsa3qALv2vXe6pwtFnCsBjJjFcXnfEwXh/znqPo0qKHDWI9Q0Dt2cFpZUDssKz
	YuPlaiZ0RMvmkm89Wvpv93xm4IWtbzvPXlvPi522JeOGa4bhlxJXkOHj3nov97Rq8rNyqw1pSJT
	WMrcFfTIu5f5drsIucD5cv8uHzN49fD4iQ+/FBcT9TzLAgyLwWeef/g/bQxC6ATF80rNoEZ+STQ
	CGrWQenEu9QoNIr7MPkgKma64WHlYRZPUn+uyFOdpQN/eJjMFsuSQAp0ReF/YFylOzLpRpDp66N
	Fe7r1pklPjlooHBs04/sdJD6WexeVX5+t4A00uQUL6AtFGK3L+nw
X-Received: by 2002:a05:6a00:1d93:b0:730:8386:6078 with SMTP id d2e1a72fcca58-7308386710emr14738059b3a.0.1739258470774;
        Mon, 10 Feb 2025 23:21:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH617Du0ucAbP7NRGAkG9YEimea9eu9q+jpDKLAuf7hxUGMxob3doHRVhKpa8lI/PoD5UJZhQ==
X-Received: by 2002:a05:6a00:1d93:b0:730:8386:6078 with SMTP id d2e1a72fcca58-7308386710emr14738016b3a.0.1739258470280;
        Mon, 10 Feb 2025 23:21:10 -0800 (PST)
Received: from [192.168.225.142] ([157.48.123.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048e20c32sm8993694b3a.170.2025.02.10.23.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 23:21:09 -0800 (PST)
Message-ID: <7927663a-5ea2-6fda-cea9-eb19ed8661ee@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 12:51:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/2] wifi: ath11k: add srng->lock for ath11k_hal_srng_*
 in monitor mode
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20241219110531.2096-1-quic_kangyang@quicinc.com>
 <20241219110531.2096-3-quic_kangyang@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20241219110531.2096-3-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9zFHE23T9Yk42D7jfV7Hk3tJz1nuOYNd
X-Proofpoint-GUID: 9zFHE23T9Yk42D7jfV7Hk3tJz1nuOYNd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_03,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 mlxlogscore=903 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_232112_211304_07D32608 
X-CRM114-Status: GOOD (  11.66  )
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



On 12/19/2024 4:35 PM, Kang Yang wrote:
> ath11k_hal_srng_* should be used with srng->lock to protect srng data.
> 
> For ath11k_dp_rx_mon_dest_process() and ath11k_dp_full_mon_process_rx(),
> they use ath11k_hal_srng_* for many times but never call srng->lock.
> 
> So when running (full) monitor mode, warning will occur:
> RIP: 0010:ath11k_hal_srng_dst_peek+0x18/0x30 [ath11k]
> Call Trace:
>   ? ath11k_hal_srng_dst_peek+0x18/0x30 [ath11k]
>   ath11k_dp_rx_process_mon_status+0xc45/0x1190 [ath11k]
>   ? idr_alloc_u32+0x97/0xd0
>   ath11k_dp_rx_process_mon_rings+0x32a/0x550 [ath11k]
>   ath11k_dp_service_srng+0x289/0x5a0 [ath11k]
>   ath11k_pcic_ext_grp_napi_poll+0x30/0xd0 [ath11k]
>   __napi_poll+0x30/0x1f0
>   net_rx_action+0x198/0x320
>   __do_softirq+0xdd/0x319
> 
> So add srng->lock for them to avoid such warnings.
> 
> Inorder to fetch the srng->lock, should change srng's definition from
> 'void' to 'struct hal_srng'. And initialize them elsewhere to prevent
> one line of code from being too long. This is consistent with other ring
> process functions, such as ath11k_dp_process_rx().
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

