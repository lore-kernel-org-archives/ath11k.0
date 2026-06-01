Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2F2CD6E4C
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 03:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+awC8dNZErlVuHkKOYw2cmsviDuE496nG60Cx4tWSy4=; b=Yl7Z4DitteiLJr0LyYLvrIcM4w
	nYApYCuv+DxSlM4etwNkuNyQ/29ML1rJWYyN40YFwBCBY3llTGBI495xBPgIPHz+0h1ebF/LLPaEu
	JNvjnhKLDmzlDeQ6XA/OEbvWLgJquH9Ml2qp4ll/49XwGOxCfdOSNj91sqjjQl9iApuZ2DTlCjnOf
	uXAW8PTojWK7nJS3hvXrN86eCtfGE+AeNAlke3qY5PXiI7Pv4bsS/yjinLq+OYzCU+DmkmBeelS/b
	/4JNwbVDlbMkI47Fde73L6jmDHqQBYOpaKGZMwAFGZxwmhPKfa0fO/8gmUj18Xd9qy4MDIsJtXOzS
	lCAIwNBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTteD-0000000A6Y6-1zf5;
	Mon, 01 Jun 2026 03:49:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTteA-0000000A6Xo-3Xb1
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 03:49:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6512EYmU4187116
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 03:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+awC8dNZErlVuHkKOYw2cmsviDuE496nG60Cx4tWSy4=; b=L9ZapzOffXmNV/3v
	PbvNZbqz0Hluc+m10saw/TpYmGzdF/1tFyVyUB5724rQ+kg7xJxXq3pdMkrmU6c1
	iRoBZqZRymQFpb5MqiMPbN7pJzCzYzsGz9nyQu85zawbkwKiOj2SbFY3Fu0xVVXF
	3oAkLJ1PyJn8NKCkRp0tA0RdAesdLFr0hTgs4fNjSZ2P2vhsr8WwFhoQn9jQxMN7
	gKaG/Hzc9Fi/EguuUX38ST8mlMN4GgTgv7r6md6zWZe6Dqkkjpmd1KSKSrxDOkWX
	I2KWZOl9KCdRMJuajcU5GNSYmXfdg3aAuqmBPx6ZXEul0kn1ClpQT9UHsitYyQiT
	8PLz8w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs66wa1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 03:49:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so2450569a91.1
        for <ath11k@lists.infradead.org>; Sun, 31 May 2026 20:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780285742; x=1780890542; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+awC8dNZErlVuHkKOYw2cmsviDuE496nG60Cx4tWSy4=;
        b=iaw3WQhSvoBchmYzlRUsUteC6c95wjvYdmd/S5jW2iKS21XrdxcKlELoJg4Y6Clexq
         Y+HrWIPxYKdL2O3IP8IF8l8OH91lXEQ6yPdxJkg7alSPOUtBMGo2AyjW7K0b9IMUkUPw
         wNWDf8jjd/j8oLUZOsuESIQO/XeTNaqNngDVfIGkfqQFkNlhaG80E1A2FyVACNUwRhP1
         BpFpRs4UOo0f6YutLOgr1PEs1NBQmPR4uNvKjsf6cx2iJ2E7LKptjhdENR3RcpI4pH2d
         4aNJF/FlntrmqTfeGTxkRnRZaXoNUSdnO5fBlzTJfHTk2gG9hdnQaAgWjrD6FAlc93Vf
         GI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780285742; x=1780890542;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+awC8dNZErlVuHkKOYw2cmsviDuE496nG60Cx4tWSy4=;
        b=QG0QLugm1lj2K3S4AAYFNYe84Fakt0OPvHnjiX11dr1nFiXgcn65iV/y63T8lx+vEq
         VUZfJRSQc6pXopRr5cFfDC0VXVOfIq8FmtAV//fDZr+Nbvo6aFYlcSWe9OafNjHb0xd1
         DU9rIO2BWP/KU2w/4WhIZ74UbetF1rJJiOEfLFFd5h20n0/DClyAHy8b14z1pl5Qqzp3
         XMiWDEkywln6locjckhGKvaLoTT4YOOcm8M0zURtoeCN8rGI9UWiwVBhNhi7PKoAwueb
         i3ofwVmXgj+kvASROUOq3tcvWHXgqBl19XVVZJ82RcKpwRA5CZ9L9jynRTH/N/fmfYKB
         +e8w==
X-Gm-Message-State: AOJu0YzgvHtNrCKoQQE4Vt395Ud3fPNS5+6jmP+TsKOpdO12jSm6K3vF
	dGtQUSdiJQg0bUSqN6FqZR/67EBXLEPt+LqJ35nDRIocnUmBurQ7x+qeEpoNSSpJmdkNzvMfzkq
	F3gQbWMJZ1EGnQfmTS5cXYF8RxQR8Ax8GfWqHaVWAaTJhImujXzYv2asxvJSirWRo
X-Gm-Gg: Acq92OHGZ2qXeAAei4m4vJZRAYp0XojwsP8aHYex4cRVJ5sAIVxhbsz7NY01H082Ikw
	mrq2V56yS0Ukwe0RICGbDgdUK2G0Oc88aK5uCw/7fnpS747ji8qQSOfFSS6RFwQooaxx0pOyHYH
	90+XJuobm5Fsi7FRTr1FnIUSh4XFDkA5eQ4BG2BLOkf/HVXoqkWTYlKYNRi5XTOeptN+4UH139N
	YMT9LznjdNlyPOYzvi3GBeFfqbJKG8ysE9vcstipucSEfIK6aCYPrAZHVhfURaEw9rKX7EOC1+b
	dijFRo0/M/FOkT6SXnbERUpYpdgbeyuKAEWnI5ZWQgopIs5GM/94LcL7w8mGIFxhXFcmP65i0+J
	TgRpZ3EnMTpHWtL1DCBBlN0zlUFXirnvXn5oxP5H2yLUvot9/xIuUPxTfOc15be56AJvauxo5lJ
	f3Nl/AhnJN7Wa6xSZSwvtvenSevN5F
X-Received: by 2002:a17:90b:2cc6:b0:369:e9a2:6b with SMTP id 98e67ed59e1d1-36beb5d69d4mr6507488a91.13.1780285741551;
        Sun, 31 May 2026 20:49:01 -0700 (PDT)
X-Received: by 2002:a17:90b:2cc6:b0:369:e9a2:6b with SMTP id 98e67ed59e1d1-36beb5d69d4mr6507479a91.13.1780285741114;
        Sun, 31 May 2026 20:49:01 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbd667fa4sm6337397a91.0.2026.05.31.20.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 20:49:00 -0700 (PDT)
Message-ID: <91270ea6-68a9-4e64-8f6c-d088f94085e8@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 11:48:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath11k: raise max vdevs to 4 on hardware
 with P2P and dual-station support
To: Wei Zhang <wei.zhang@oss.qualcomm.com>, jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260525020711.2590815-1-wei.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260525020711.2590815-1-wei.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAzNSBTYWx0ZWRfX8B9Jkku73uf+
 ByZADT5VWUFZ18cw6EFBZu+3Vgu/ARzUDnqTHg04YKbODrdsSUdslkftvM9zd2melbVuj2WB9+o
 NY4/NsryEh1fx+RmYS0LyT9XzAdwgaVFJhH+G98wdgcl61cWn5TqTzhAtRishIaybsHu+iGKIzO
 QAZV+0r83iSEAlLa6Uqbv8YGBKcWUTZmqzi4Ta6Fj5yGknupZW89NOaOATzIVI/XWTf9iMzALx+
 tySMbOXslxeruYAbri6lwr1ByP/PXvAmhjqnMaQBiCBC3NNiZPoURBz9KLi9sdoq4EFE6/p30ew
 twC+OVMEHnjDp7+g7XdRCN/t4kue524OGGscGlOutOuYjYHdbh7gDp9z307taIueydxCMcXn6Rd
 BsND56M/6t9wAOm+G7R2igBU1VGhIZqrZVd05/k86uCWirjvt7Exhbas+5xHu0XAD/i62b6jEzM
 SuRD4LcWrgdi84WOlSQ==
X-Authority-Analysis: v=2.4 cv=X8di7mTe c=1 sm=1 tr=0 ts=6a1d012e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DLlhXEFHjEEqyZQXiqAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: GL30LiKitSGHv01YGTkRgNU4EJlHX4Qs
X-Proofpoint-GUID: GL30LiKitSGHv01YGTkRgNU4EJlHX4Qs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_204902_888768_D969404F 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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



On 5/25/2026 10:07 AM, Wei Zhang wrote:
> When P2P support is enabled, wpa_supplicant creates a p2p-device
> interface by default, which implicitly consumes one vdev. On systems
> managed by NetworkManager, this interface cannot be reliably disabled,
> leaving only two usable interfaces for user configurations.
> 
> Increase num_vdevs to four for QCA6390 hw2.0, WCN6855 hw2.0/hw2.1,
> QCA2066 hw2.1, and QCA6698AQ hw2.1 to account for the implicit
> p2p-device and enable common concurrency scenarios such as AP + AP + STA.
> 
> This change increases interface concurrency in the two-channel scenario
> by raising the maximum vdev limit, while keeping other combination rules
> unchanged.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.9
> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


