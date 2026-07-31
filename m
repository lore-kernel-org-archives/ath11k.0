Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4230C5516F
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 23:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7tpd0S2YwULBAdlt+aVaG0rTF0GEY2FTOIPMSdKP60=; b=FNtsLvHiDJWUkQKcHDo3H38Rtk
	pARhBOUzHeHCm++Wu7oTSBqSDde1jkqkYQYjOmhT1JkGe9nCp1edN83iHLIH1q42XcRO5xIh+JHY6
	c2fKbzzlk6CrXfpzr0rN5I3Y7gKYoYhQCauUzZ39eObbcPi1LENDgBFcJtlPhjb7eWAx0QSV9lUnW
	APJwRU/hKgi2urCMgih9laADxhDA6pybly1WKaEDkkmnFsHjYzKgY3m/DsT34dilr4B8MafQSuR0Q
	aBbfA0nqsxBOpCMysxjGgfTGNa9iDDv2p+xaHNKwdxL46vamGsdsR/b+iJMHseQOj+05O6FI8ahEQ
	Eyb7FoZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpwJW-0000000Di2P-3Mmp;
	Fri, 31 Jul 2026 23:06:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpwJT-0000000Di1z-1hx8
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 23:06:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VM0XFp573662
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 23:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U7tpd0S2YwULBAdlt+aVaG0rTF0GEY2FTOIPMSdKP60=; b=kZKgMv1XSSOQ7puU
	XbSnkuVRS+Ih44Nrdk/1d0zPjix3f0k5HTSa3wl8P3IDafmm8djhKlqaqWcI8Upe
	BNZrLQeme0UmZAqhcf6xlH3+TJkw/3alfRyJIXiIVTguYT2CnRocBmd/Mop6P/m1
	gxEbW1UAUtESgNhhZ50atSytTUVR2ZBOFysbUnOrwK7inx5U5JDuUoISm11KDG14
	z7zOBkeXZpMx6dR25Zs1Cw/O8RZgtm5oOUniwBFRQbfZFknocGc5bHTfrCca8o5q
	lJKsrDcRP1v4zfGRQMRZ6EHyX4x3xX0OxryBbOkCbqejovMbZZ5gDohupcW2nKA4
	al4cRg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru0y2s7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 23:06:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so3701218a91.0
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 16:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785539204; x=1786144004; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7tpd0S2YwULBAdlt+aVaG0rTF0GEY2FTOIPMSdKP60=;
        b=UdQv4nt/bXuhxd6FOMSOP4W/OD9F33jgikEkLMV3AokRNUwJ05EaaegoofeR1ReRNC
         mvE6lRKS5dJKQCS/nYYHSKUjFE0+9tioHXg7dKH3uLT117pzGQVRBAdLl3pfnyYScmec
         d/PrxGXgSvAJ+r+yZEadC221pvdi/jL3NGqk0w6xD+WHwNk54KZKpb77wZtkrHpGHpMh
         RK+D2vgPV5SDZ5PBkWn3tvfVSZz/7uGJnq69COWI+RgraVO/EordoS/0ewC9A/oUoN6/
         GKQxRpV7uo86O2WZQsBtaRCmcD4giyco81TiyPKyqf8+ji5e4AALYwwID6F6ix1+2Zts
         SIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785539204; x=1786144004;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7tpd0S2YwULBAdlt+aVaG0rTF0GEY2FTOIPMSdKP60=;
        b=K/rc4kmLcHz3LtoO4bzjqDsOgbCojNVjBtkIHppML3U7/2LuqcaMePo26Ca/PYt96t
         oQf3KJ5fDKNwMSAJlLOTFcVk7PvRgyWqqVs6/uWtnExEKuWc8bTBlcpIS+DWiqioLqnq
         C5KcS5l6nGQ+9D2vKv6+vFhLYD8+blsL3j6Km5kLSeIJ7MNS2qIS6jsoTxdB3YBliARe
         lAVfP/rCPZvwuJEoSN7qWGaFv3lEKOMwLMBhJd77N45HibaTnwG7jT7W67H2ys9+8xSA
         9CTbNTntdpRiXjDRtGCbYTBXU9ZT1U6nESnTf/IN0w/pZvDmMRYP/89thYFLkbJC2now
         wpUg==
X-Gm-Message-State: AOJu0YzPJewHMnqccGmQamje9pmBsP4bI4Mrvait074IJEb8qCCrtvhD
	IJyCSIUwPLz/rc6BWlpur3+06mTVlmA1htOikFAt99J39OznJQPP1BFFRxDZLwa/UbEn3+RUONP
	tNWWHHI6FI6DaSgbOc9R7dqxZRAUc3WuDtLqRfN+w9ahh1BY5UPT0Lo+5DoS44YUpSpPSrtkv
X-Gm-Gg: AR+sD13vMwbzY/gfwW1pw7nyeCzMO6m8Bj4iHezGnr4u251ueUU7ZV0LZ9knVc0i8Oc
	uERiBrUqeKpkAbPhftqqh2l+BOrHBSoG+jmAxJU3eqLVjyA7H5NKRzSokNZIbGKoopGj4EtlxHC
	aZQbCaYdj3tQBoKWZX5kyuvLq2cb2SlJWHwRpE85YhCr4x8SM8s8wgKDCPP6/seJw/Qg1kMTZLn
	9aPYO/kxAGM0D75f9rZOY0ML17pD2JHxll4sDfN0hmzMC/KbPWo+dL3vyPrKtdMnK4trytlYWSS
	pZtwsG7vU0SUwXBhWU+UisHKl0B0vTUpns+5g5Xv0hL91Gt/35Yqg2SzKaLuWKNPQKy7GGtuxjS
	8/ZcV9vHdJllTzkV3wUy4OaPBLZ7EDOD7MfBG1fix2NrS+swAJG5Hkah2SxM=
X-Received: by 2002:a17:90b:1c86:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-38fbc4249efmr1421277a91.10.1785539203847;
        Fri, 31 Jul 2026 16:06:43 -0700 (PDT)
X-Received: by 2002:a17:90b:1c86:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-38fbc4249efmr1421253a91.10.1785539203358;
        Fri, 31 Jul 2026 16:06:43 -0700 (PDT)
Received: from [192.168.1.9] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e44bcsm9419228c88.12.2026.07.31.16.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 16:06:42 -0700 (PDT)
Message-ID: <f105a3df-6769-4a61-ba37-a6b874a918b6@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:06:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH ath-current 3/3] wifi: ath11k: unregister PM
 notifier on QMI init failure path
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730030948.147892-1-miaoqing.pan@oss.qualcomm.com>
 <20260730030948.147892-4-miaoqing.pan@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260730030948.147892-4-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE3MyBTYWx0ZWRfX9iCwU2thaQk0
 N3Pl4tzpGl3A5n2ccwBtmgA2Ns+02CxRccbKQwqNMTb2kYTIeo+KAXfj+f34BsSyAooTn2XBjmC
 4a0EJ8ZoFMN4gyQQJjfreEdPs1TsR3U=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a6d2a84 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8LiCHbkhAqqawgbigPAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE3MyBTYWx0ZWRfXyXHycQwEMjbb
 awDZFL80+xrMcKcCsSSPYSdOSkp51L/2Ghkq9THIF/08w2Z3aYKq4/lOOCaC2iY80n7hWFICXqo
 Z8+dbAf+CAfo+L7OHpLEX+MaWEJvaxFSC4VWc3OOGL/kwiUAGDUJaM1uNR4DJu650lsYwnu1sXQ
 7e82DmcDGPmYxAWCXX9aXmSpYwGsNDlo/Yt0BW7anINp8kdA8fxEHfisLyoN9d9vcCQmke/UY+f
 x9tKVybi3hFsBFpz8TAug+v6m17NqJcqP4O494nmxXAWjY+f/Uf7ONsujWuwYdMQOcNIvKHBn0B
 Ta4Ptmi2J1YScc2PUZ1UqaytLt8AuJhHkZXOimIYmVOZEEaVPTxYmQ0dSbwTNocTqYNWVghuhGn
 ft0jTq9lfdoF/G2uYiLjtp9bj+pOgRbDU+bpdYGmd2slrXg2BSRsNnKajUO2wt3EzETRyjC7HiE
 pjq5yiUOpKo5Aj0az5Q==
X-Proofpoint-ORIG-GUID: Bua2iHbu04CRtCZJW24ZG6AlRZfhA_gU
X-Proofpoint-GUID: Bua2iHbu04CRtCZJW24ZG6AlRZfhA_gU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_160647_495301_CBEBB3A6 
X-CRM114-Status: GOOD (  27.53  )
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

On 7/29/2026 8:09 PM, Miaoqing Pan wrote:
> ath11k_core_init() registers a PM notifier before the QMI server
> becomes available. If the QMI server never arrives, the device remove()
> path can take the early-exit path introduced for QMI initialization
> failures, skipping ath11k_core_deinit().

This patch felt wrong to me, so I spent some time with my buddy Claude.

I asked Claude: in the last patch the commit text says "If the QMI server
never arrives, the device remove() path can take the early-exit path
introduced for QMI initialization failures". where is this device remove()
path code? I'm trying to understand why there needs to be a call to
ath11k_core_pm_notifier_unregister() in ath11k_ahb_remove() as well as in
ath11k_core_deinit(). since ath11k_core_pm_notifier_register() is only called
from one place it is logical that ath11k_core_pm_notifier_unregister() should
also be called in one place that is symmetrical. the proposed patch breaks the
init/deinit symmetry.

Claude said:
The symmetry argument is well-founded. Here's the actual structure:

ath11k_core_init() registers the notifier. ath11k_core_deinit() is its
symmetric counterpart and unregisters it. That is the intended 1:1 pairing.

The problem is that both ath11k_ahb_remove() and ath11k_pci_remove() have an
early-exit path for QMI_FAIL that bypasses ath11k_core_deinit() — but still
need to undo what ath11k_core_init() did. So they replicate the unregister
call directly. This is an existing pattern: pci.c:1188 already had
ath11k_core_pm_notifier_unregister() in its QMI_FAIL early-exit before this
patch series.

Patch 3 simply extends that same pattern to ahb.c's early-exit path, which was
missing it.

The symmetry break isn't introduced by this patch — it was already present for
PCI. The fix for the symmetry issue would be to restructure so the early-exit
paths all go through ath11k_core_deinit() (or a new partial-deinit function),
but that's a larger refactor. This patch's approach matches the existing
convention in the tree.

The commit message claim about "the early-exit path introduced for QMI
initialization failures" refers to the QMI_FAIL branch at ahb.c:1301 — the
goto qmi_fail block that skips ath11k_core_deinit().

Thank you, Claude.

So I guess this patch is OK since it is replicating the PCI pattern, but is
there any way to have ath11k_core_deinit() called in those early exit paths so
that we can keep the init/deinit symmetry? It just seems wrong that if
ath11k_core_init() did not return an error that we would have deinit logic
that would skip calling ath11k_core_deinit()

> 
> As a result, the PM notifier remains registered after the ath11k base
> object has been freed. A subsequent suspend or resume event may invoke
> the stale notifier and trigger a use-after-free.
> 
> Fix this by explicitly unregistering the PM notifier in the QMI failure
> cleanup path before releasing ath11k resources.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1
> 
> Fixes: 32d93b51bc7e ("wifi: ath11k: choose default PM policy for hibernation")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index 7f5f5c8d7c56..bdb8c99f10fa 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -1272,6 +1272,7 @@ static void ath11k_ahb_remove(struct platform_device *pdev)
>  		ath11k_ahb_power_down(ab, false);
>  		ath11k_debugfs_soc_destroy(ab);
>  		ath11k_qmi_deinit_service(ab);
> +		ath11k_core_pm_notifier_unregister(ab);
>  		goto qmi_fail;
>  	}
>  


