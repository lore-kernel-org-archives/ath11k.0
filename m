Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FDEC44532
	for <ath11k@archiver.kernel.org>; Tue, 21 Jul 2026 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7/X4UUUfSZvl2Qff0oPDPg+KAHaU6bVz80b1BTjpzU=; b=JNihXdrEdmH1mnbu9dzgZ3qd1o
	I9/4jAAhY203yAz8u3mns7PljTE5JC5lDI78Pks8FKEBl8VLx08ih0mcmipElLjn6MoaEUH/Z9j04
	vPifp8Vi720ki8JZuo2rneALsnTAmlB/t4QzawRjj2Lp16MBmVfUpSRVxxWNj/n9gCwiaDf8d1UtO
	Shz3gVGV44N2+yWu79jAJn2lgL/DXM5WShNbMlM2wPurluEXLaBe4CuMCFS7jUReuWyrFIdB5NTRi
	y9QOIr2zv/Yh9I6Ks4oGbqY+tf6bKoo5ZBOk3S6picWlq7vnENDmF1coFB+5qDmNKdx5c0/flKRrd
	qrGUd9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmB6n-00000009bil-1FZh;
	Tue, 21 Jul 2026 14:06:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmB6l-00000009biK-1xR2
	for ath11k@lists.infradead.org;
	Tue, 21 Jul 2026 14:06:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg4tH1687493
	for <ath11k@lists.infradead.org>; Tue, 21 Jul 2026 14:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s7/X4UUUfSZvl2Qff0oPDPg+KAHaU6bVz80b1BTjpzU=; b=Um3PKVo3mdzPjXRn
	Weqlz4OI2y2lbEPegZE2Afhp1OOjsJ9Xd83oPK0H6nft3LKLNJU4gsOtIoX4USBj
	q1cHuNFwLElVPhcxzhFUlvVeP/TeSzWTlkIPuESD9FyD2IyPdYgvwgoh3gHaEIvm
	NC3ccqzoArpVPHsm5A/IisrijYbps4keY3M/6UkQ5HWnvswGsZjUNQ1AlAKtnycm
	Cgo4wcWne9uolQMvxZOnZIO43o54BLHBKzbkYTqcRDRIDZK5Jp9REm+wl1Z1D/AM
	NAUPkUdF+oZxhP5lCEUObv1cK6rFHXFF6p/Nb8Lse2Et51XJ42jixLE50OCzv8Vh
	gBW5fw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c408ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 21 Jul 2026 14:06:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6dd278512so2235839a12.3
        for <ath11k@lists.infradead.org>; Tue, 21 Jul 2026 07:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784642766; x=1785247566; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7/X4UUUfSZvl2Qff0oPDPg+KAHaU6bVz80b1BTjpzU=;
        b=F3qfB//itmcg4rRAoY7sTtqaBDp735KdeTjLmJc3hkNAZIIrrNiz6Skh1/PwweaRG/
         nx/FynTUHW5hySaVMCkVMnShqdSF+Zhrb04LEWco/52j2LqMHeg/cbIM6j8E+v3xu4rN
         1ZpF6A96Eyf88gceuUegG0wzlvTl72AZzo7IQpGwNt/16OGgFdIYV6V5oYIV2B7nkS9u
         /3pNwPIRL3SD0jysQfS1FyT1v6gp/KODGQznlAYdjqSCFMAA+uazhcROUxIYCbH+dXOm
         IZmCbL7dxJ8UOF1QzitTii9e96Afu9mSnkWkZgOohcwDTsBwhLNEL9v1jNVh/3dziNQe
         fb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784642766; x=1785247566;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7/X4UUUfSZvl2Qff0oPDPg+KAHaU6bVz80b1BTjpzU=;
        b=MQoz3QWCizGdDDjdwalaZ75YZWNTapENI/h38b8KBW/0Fi7vgc4YA5gDvJfe4HAZpn
         uYc1di+tqPkuXynl8xWi5ZtyI55RcMD0hd5xDkO+vaoqSy1JXWJz1ZXFmG7/9Yp3pDIm
         TyaHWpzTv9uY2q9tVeFGpag3KMaH8HJE7NHJSlXKm4QRn4EusiVIhBWtrR5TkIURqewc
         UW/RHitN9fg6NbVgf71rV/NOwD2h6B/YbZPtjMCQ4zO5YIuh2N1ITeUhLcHQUv6YOaSI
         bunkg4MAkZSRKHaO63PawWEtrxS0F//5MtdsxNoIL5LGeYna61obRbwt/XD1vjDRDhLp
         aw0g==
X-Forwarded-Encrypted: i=1; AHgh+Rr69NgHfOjdEdOF2tY8geROSK+IJS0m/PkXD0crkofXjQ66shgE9OYAaTV2D9KczuBooTXFihQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwpkQvJr7hhrL8BB9eNvoZTQgy/3o7kckeR3uudSOhygr+QirKt
	HKqvwJ9boxMB8g78ghQQN+rXWp/MjgQ7vIswVBOsga9MrQrF+1F65vM8nwZwrUhMf9Gq7fgIdxy
	lg0U5J0HMCH4EMgxbRbttgYBmKThL77SLMR7xMjO/F2OHtMKIyc7LehZoYcRCaxn0
X-Gm-Gg: AfdE7ckPzdTPsLNBfcUNXC4TgTsvBS7Kvle+gxY8EeEseeKP7HWixkA2Qbm13b6Uc+b
	wcihdLwViGkK50cPiQMVWQBaFowBU8vCIR2VE3xpRpoMDXwDMJSl65i0xLUmXhRgxaXuZdcLUxL
	h0u23OcCidFrPoIf7TCcILSWYMux1lXajjUbc2RzAqCYJk6PFv5GYCVVlez2QdKpGhx2EVwBU78
	AjNhJSLLPXCUlxVCoZSDnB2LANOjIVJE+nu49yiGsbKabdL8xrnUwPkw+V/QUKlHG01TVRsCqAZ
	1URjOQ7jRHqEpFKPcy96Qy9WLBU9zk5GlXP1wniq4620HWvC3kaqLYoQgTnqHUj4JwgWl8zIUVP
	JQqJldhjfyIWn/ZwbRwqdf49kq10YgmKou7hVbz0t3AkkIUCWBidnpgLcCTac
X-Received: by 2002:a05:6a21:8cca:b0:3c2:dcdd:a85a with SMTP id adf61e73a8af0-3c3ad7a324bmr21705845637.13.1784642760729;
        Tue, 21 Jul 2026 07:06:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:8cca:b0:3c2:dcdd:a85a with SMTP id adf61e73a8af0-3c3ad7a324bmr21705772637.13.1784642760162;
        Tue, 21 Jul 2026 07:06:00 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20bf96sm46640518eec.28.2026.07.21.07.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:05:59 -0700 (PDT)
Message-ID: <a85bf89e-5a4d-40f7-9797-66f078427f96@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:05:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: ath11k: fix resource leak on error in ext IRQ
 setup
To: ZhaoJinming <zhaojinming@uniontech.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <181b5ee0-f002-4f5e-93ff-49b6aa0a6e61@oss.qualcomm.com>
 <20260721072128.142668-1-zhaojinming@uniontech.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721072128.142668-1-zhaojinming@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5f7cce cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c5RWqA75Khxowu9MsocA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: aKY1GGq7OLcS_1n75IJrVrqvKLdy3_vx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0OSBTYWx0ZWRfX8WY+3sn45g9S
 iyTH7nm9XOIMF2z6hmYjW36eLFE4sL5OLgRd5lMnMLBL7bsLu+c4tpMpo/Fg55RtiUvslrZWqN2
 Eep0pcoVB7VDhVXOr3NANhO3pvwWquH7/pxxMuwkLBWcCs1hrng8hodfO+45GYQ0mV3x0H8369D
 KjK04AoZhJ0OVAdTrJN87YmljtQRgeQl5bgKFq/o/UbvF8+PFpraIuee3FMYyDBJJlxPzcc2U4N
 lduCW9bqhwdg/mdcbwmkkxPZYyNNFsQAR4bGhkgt3Hf3T0m3a5YgBYTl8foRkEGWYhpJkFybKdT
 ZhS+mFSmLzoB49Zvl4+Xjp367aBdCO0t57vC4ttH6R3ACGN3irStxK44W8STDrUYgiA67ds4pgk
 0NIhSj+jFCoPlcStyK5SQ5GIiDyWcZ1anHlPVpohuK1lzMl1sMYTZIRS1infthuCx3gptxbOfVs
 p5kuaNNTub2MGbi38rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0OSBTYWx0ZWRfXwHIbjUSJeS7J
 /0utt8mAet5IMY/8hOXNa5ryGEYwfxC9UMnSt1A4f7AXz75AHsk4Lxf8coOxySbGqvXKysUEV+N
 5YQ3y8My+DJuvIkvO3ZbtbFXGSzFL0w=
X-Proofpoint-GUID: aKY1GGq7OLcS_1n75IJrVrqvKLdy3_vx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_070607_512628_AA084601 
X-CRM114-Status: UNSURE (   6.62  )
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

In the future please post new versions of patches as a separate thread.

/jeff

