Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C54BC88E64
	for <ath11k@archiver.kernel.org>; Mon, 14 Sep 2026 02:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwTEFykKDk3QzgeZ5LSS5wi+KEW9wopRBXAry/K6+G0=; b=n2v2aV+esyfPicF/+3NcAHVmUD
	Lvs+ZmpMRu5t9zSbeOTs+Uk7skZulaKQNIskmaksfB0Uek3/ug58FzWL54WUSefYNDgG6ivOnWKdS
	FEUlfnbIaZXeOgr9XbE3ulw0b3BZbkP3T/1mHu1l2e95QyvCTPFbyxYJcyQDjkLNNaUTR1Od2c3Gj
	71rYCLj6Ozl0JK1mcU2MgLyuEW+M5Wk9aUq96PYtmxm/lbSmzzDpbj0uDKVfeMIwx4LIFxqiicCt8
	2rkOowI8mqJX/30w9KModezbPKMfGFEB1eBGkaXd1uzooNgz5NoKAsNL217QEs4m4+LQNAGuHmNdM
	9wHKMl/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5we5-00000002Byq-24zl;
	Mon, 14 Sep 2026 02:42:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5we2-00000002ByV-3E9F
	for ath11k@lists.infradead.org;
	Mon, 14 Sep 2026 02:42:12 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2eWok3348584
	for <ath11k@lists.infradead.org>; Mon, 14 Sep 2026 02:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TwTEFykKDk3QzgeZ5LSS5wi+KEW9wopRBXAry/K6+G0=; b=DTDisqrppAE0EcKj
	hLfarKOD4tnZ+LDR4R/EP2pGFEiR8CS3Mo3BcsBzGYksKWmTRgU0QhAgtUifxyvI
	Hv0qK0lSVrt5Cl2JwpbncZUCg7GONQE57SLxcHu3Uog+ESouDf515WrrTIcldqUy
	LOxUsHOn4Og2Yn4y7xLTzj5WaCYMlTcUql3BefQ3T2YkWSVWaInhLO39HhpzBo/5
	ptcIfhZzI2sdkK5jie1+JutRo7EFG8pHMQTt8IzfK54bXisFMmJxzZnpozn5w0Mz
	g63GYJUu4VaczRe6g0+tRh0XPzqkJX1SvASCIC9XiRo8fyo54i89FN/sXYdMViXK
	fgGm7Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dcpfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 14 Sep 2026 02:42:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso5661259a91.3
        for <ath11k@lists.infradead.org>; Sun, 13 Sep 2026 19:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789353728; x=1789958528; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TwTEFykKDk3QzgeZ5LSS5wi+KEW9wopRBXAry/K6+G0=;
        b=ank+nbJhWk7+uu/3WpiRsPPoCApWjvWkua9+W4Qh4lm8TrMbP12r9aB3Az8PNDLqFi
         XFKGUZr/AuCDNoOKdiN6ToLJbG+fKdf30ix4WBZUfJwb0kQxl44RPvUnW/m5kXVOOpm6
         aW2gdQbuMC30QoEVKbj2Ac4HH+1w3gl9NDvhoYO/bFiG6ln5MpFKJif58MkmwNGmPHAM
         e8cDP+y86RBzvuSyoE185oHeHdjBq3wJZDCPQnkftQbsFnX/tnIZvOPWOM0fUlphS9BN
         N+F3ywx3z9T9i6HuZOKvK/ndTTB5Ro8fSBgRRiJlP1EEzRtjxeagTxnbBGePg7dK0Ns0
         WO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789353728; x=1789958528;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwTEFykKDk3QzgeZ5LSS5wi+KEW9wopRBXAry/K6+G0=;
        b=OuuChnkrwamdu5/qUOwLz10dOpFy3dPf5HAc81gJDEL+oMuRcHLN60WEOXBsk2tat5
         cA5m808jZ1GH1sq/Xa1MJE4p8odIVD3W+SG+dS6haYPVPoQCJK+Mj+T2XuhPbp3mjGyj
         MWNrx7EgsxeJnyAXz730iumZ1h0Z8BaNzwlGDzv5nFl8gWuqppby3NUXJDb88fuUpoWw
         UGnSCxl0H1KSwN2k4FQvL8QCADVFLyW5FhCiRuYzbDSyQ8tmTZl9o7bbhngNyuuUfd9q
         ySnfMewfu1vlQutvWybuFVm550aFzSO72BPKNLQyAGCI0VLqPfxaQogO1ZozKBdSJw9Z
         zLVA==
X-Forwarded-Encrypted: i=1; AKwUvBw5zWRIm5EQk+XqNzQL46G4bzOr9CkBbSaR00gpO6yRh2qXbQi9NreftwPtuM96pYnYtAvOPfA=@lists.infradead.org
X-Gm-Message-State: AFuF++mI9ES9Nz8JSgeGjwDwQnGd/waKdeUibi7RTVMWrRhkBgHWAMut
	USibik8BmOVuLnUcQCClt2F3MNe6DWOu8Wu1l2IwUkrjr/HtYMa3hpmiOeiNVV6jZenH33KJTJ7
	/MGZpsYBaOn0tvCpS/DqFF/zhaGJl8Vdqg6dvGmXbT0Q9sntYNUewagFp4ZY3Pp8T
X-Gm-Gg: AYBFou3xNXDfM0RlFBxrunKOc4OQD1wb0g8R/qOO65cLoAvW9FuwvsTfEZFADBokXU9
	uT+/8Yv4/71Cspt/RfscX33YvAz8YLogWzEWyLTHRdDljrsujNYIJvqBYp8JI7OuuVQX0U3mzwr
	LeKUHFtPD7wwwqjSJamFIFCW8d6qPzciyCtm0qdMKVE0D7+qRBNJ1XLNEown9bqf+GHLJwWOWj5
	6wf/Ajj5Et3Te2SQjO5p0u5HoNU7V/bFxJleK5NCGpyr9hpf9i63yvOq2loWHkGZHDendHMHB6d
	tsuBzs3ReBu35Ybb1fgyxAFoNXuckj5/51RcIve4IF0b0d8et6e6XAsYIqlSnNP1SQhL786Hy0v
	sWqT3wJyBP01BZhyb8IAjDR9QWvsJPixMtuQs+9VJa9ojxAKVu1bnvMv1D9yzlSxp0spwJHZO
X-Received: by 2002:a17:90b:50cc:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39dec1c2074mr1721695a91.16.1789353728183;
        Sun, 13 Sep 2026 19:42:08 -0700 (PDT)
X-Received: by 2002:a17:90b:50cc:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39dec1c2074mr1721640a91.16.1789353727584;
        Sun, 13 Sep 2026 19:42:07 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95713602sm18056503a91.11.2026.09.13.19.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 19:42:07 -0700 (PDT)
Message-ID: <395c7f5b-2f74-43f6-851e-ee5e779b4693@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:42:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v3] wifi: ath11k: reset ar->num_stations on
 hardware start
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260812-num-station-v3-1-871d20e043f6@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260812-num-station-v3-1-871d20e043f6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfX1bLhApxdBqg0
 Jl6BPmbw8JwAH1K0AL5aVuDBVKn9nFF2wsmMZxHdCDXY+KqkjsfmMKTaXNc1nzp52BH5e/8l3hz
 lUpFvKkihPKQew9n+NW4FC8nejxwr5q7ZLd7dCMFHBcGMnIuxvijQ7A0b2YO7lH/gt7bVddpynv
 wgrzgn4yc/10iMnc4DJDtGEfhNZPaF+zBgBgHPBs9F9xTiCuKkzi/ydF/2PHKc9th6RSB/888gn
 XQiYnwEeobH7tBDnfw6OLFMOcJndqcx+jQ5hHdU+oZ5SlI92rgjlXykq+ZcOnsB+r9sh/eqpZSM
 iX6L2VfX9HNA7PAey+YIMQ/wAvtYH5AXdWKt3Dl4exM9f3gUZuDiarlVjKR4v1/sdZTmK4ANf1t
 MUizzk9Zjdhbohjg6WRY3d8eMFwW+4E8lvLdJJb9QJFYktWQTLdnf7ZO/CHvKiAJzI5vVoVZa6o
 8wPU1wgqyBq2ZzIqcDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfX9wxisjBd/kSK
 atPaEBnBvX89tYK1HffbBMU8b9oNseMekOr5JD6bN3KNXKg9MkFFORKvRQiTrUgVjwwTTB4Ltsb
 Te/WJNwlWrxlT8PASZnzHg9RDFHzEiY=
X-Proofpoint-GUID: yCU5ncJvY6aIEdF-Nfk5cQQ-tTEL8zvN
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa75f01 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XDoMHiau_i5UK2d4cvIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: yCU5ncJvY6aIEdF-Nfk5cQQ-tTEL8zvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_194210_930983_C812751D 
X-CRM114-Status: GOOD (  11.40  )
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



On 8/12/2026 10:58 PM, Nicolas Escande wrote:
> When (multiple) hw restart occurs, we end up in a situation where we
> cannot accept new stations / mesh peers. This seems to be the
> 'num_stations' in 'struct ath11k' that did not get reset properly in
> this case. In ath11k_mac_op_start(), it was indeed the only accounting var
> that did not get reset so let's clear it too.
> 
> This avoids problems like those:
> 
> 	[1248828.088023] WARNING: CPU: 0 PID: 12281 at net/mac80211/util.c:1682 ieee80211_reconfig_stations+0x98/0xc0
> 	[1248828.088115] Call trace:
> 	[1248828.088116]  ieee80211_reconfig_stations+0x98/0xc0 (P)
> 	[1248828.088119]  ieee80211_reconfig+0x774/0x1438
> 	[1248828.088123]  ieee80211_restart_work+0x10c/0x178
> 	[1248828.088127]  process_one_work+0x178/0x3c0
> 	[1248828.088130]  worker_thread+0x280/0x440
> 	[1248828.088133]  kthread+0xe0/0xf8
> 	[1248828.088137]  ret_from_fork+0x10/0x20
> 	[1248828.088141] ---[ end trace 0000000000000000 ]---
> 	[1248836.686604] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)
> 	[1248836.686609] ath11k_pci 0000:04:00.0: Failed to add station: xx:xx:xx:xx:xx:xx for VDEV: 1
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

