Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79986C54FDF
	for <ath11k@archiver.kernel.org>; Thu, 30 Jul 2026 09:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAnGl1yQ6HSH/lR+AcnuDHk24BuAb/i+djMLcJ2t8A8=; b=to5H+qtYbQ4aRhxO6KpT5ZrLnE
	NidaBtM+Rrb5C1Gq+IdCx+Gk5tJXAMIx+wPjF5h73n1MTK3wW3AeoxBH6U25ItYb1loGNEu7ws2fN
	Rn0XMdb/ZSz5ZV/XvpM56GAQpsa57gv0ZoDihmWI6QEMiWtUnIhNQ6NbxsPjpCqsnQJfPm1l24tjT
	2r87boadz2p7go+Kx/4h0AKC2P5xt/wnpRvM3jsDY84xcjB3OPKMWQt5h/ugNgbZHmmiea5EocJ0n
	fzlog/MKlQYeiUCIZqLN6FnPo8N+c3M2nb5U0x90Iyd/6I4WGYLrZqk/ru2t7En69j/AP0IDpLV/g
	5RtF4gGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpN9P-0000000A1Y4-33HL;
	Thu, 30 Jul 2026 09:34:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpN9N-0000000A1XZ-2FwO
	for ath11k@lists.infradead.org;
	Thu, 30 Jul 2026 09:34:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8xjWf490768
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 09:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zAnGl1yQ6HSH/lR+AcnuDHk24BuAb/i+djMLcJ2t8A8=; b=c+kORpkzdQZBC3Rc
	CnRGLdPAhNcqEx62UHmDI+kWH/x2x3PkcQxVO8Debvz9exY2E3Aipypn/B6ZWRZ1
	sJHEI1x9fQsSqLhKnxUHM/j431PzXM8qrbqwhHHTLDkW+Hz8dXM17Yl9VOVoYNiz
	UezGH6y6XA7suQm6xcXSdAYE4ewx/qw/2qY3lMTR47P185kSLVHLDOZz831nVh+L
	WrWmpJC6AuhKszeanc/L3A/sdlNCM8fCYVDNwKIWIj+/IoF9T4qcIw/brlkhpdhF
	td2yuciCcCZRhPce6nhzurcNjdlQnEFWip2JEqqThmne/1xrsEIYVGGpw0/JC2du
	0KPhqQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3kf05m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 09:33:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so36778245ad.3
        for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 02:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785404038; x=1786008838; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zAnGl1yQ6HSH/lR+AcnuDHk24BuAb/i+djMLcJ2t8A8=;
        b=HBh+Y2AebV5OF8ZrBJ2kKs12Cea+e0uhtjeuc4zueVtQy7GCl0EwC3cMDNgxNBn4KI
         cTOim0xEXjNgSoSAeUGDVWzzOP3IqPc5Fu6eckHgevLoMTr6e8g6ZpfxdQRU/HPX1OMV
         ymTewC733XGHM79U7gRBe0AWiCM1CVOm4RqVLa1QRc7PXIuqbPDqpsOlZZnOmw8XLj4J
         pEEu/B4eynleLxsA0Y8RxPU5v/KCBDoKit2u2PyheNtWkS6x183hqUiX3P7+rHKQx80x
         SfbhXHiIGmTTtLK2Zc4CnPbkJJVVaxcI+MMK3+X0H3FKHxjBCJ6FuIEng0YavN5MdOsC
         nN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404038; x=1786008838;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zAnGl1yQ6HSH/lR+AcnuDHk24BuAb/i+djMLcJ2t8A8=;
        b=BxWAOs3uhp87vf2F0IXu8Pyun/JhjOA2FeFsP9ZMxQlOByylHahZRmem5eXL3xtW29
         dU4wDrFFDPeAJLuoW0femrXGNMprINDCcXiDKRrCEb58us8fZdBtPtw7s3NY8vA0knm5
         M10GE+g11ruPlbG1iRk5Bg9ch7fYBTQfqQgT+7cw4IR5TESJ5ttzsurDbjnZL1Zl2vB0
         3mjQd9hzzOkxWGJXcYRaZVfr3PphPa/Qzdna+RVQBLEI90mhYpDZe998V0BN9YA3Hckv
         YgC1b+IQCIjWMoQkVT1DMWOZDrwOIxqprWK64Xk4PaTfIgB75tc5rMhckGDR37+rvBRW
         25CQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro11tziW6ZlOGRGPKC7hI8QTDab1Yue0D2uM4c0df8X4kCjHTM6rTGDQnKJzdOoYEgjpIlETps=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+ysdOzZIlslI4bS/nUIpzDCoar/wkzLTOZdSCir9mLOUmfWCP
	MdRktgyMr3O5wpAvThmH0WX96WQNlvi/NVECP/mmshCjLe1Jk71+X6+8f80WGUtUU5zKO8BIiIL
	NODz/2Fm0yV4O+SI70HdtDaZnljCTJFOxwTeChS5fNOoJSYC5CbVOxxKr/Vp/qpul
X-Gm-Gg: AR+sD10qI+9+PJZkZtl0JwxjVtISAectEpYqm5sy/g6eb9XAsFGu9GtjIKEBftlPEme
	3Wff0bNQXlRF03oUCtZnRfl/GgMCGLhKpBx7c2vNXF3q7WMeAITx3Sa49ciAsJXZs8HAd79u+uJ
	swW8r5bwddQlTHOs21Xvlxp1ailyS2fXn7Qnxtcv5R1yP2sNArSfUjSSSivHitMTnjzW/Cea1lg
	jM6LnJPEN0hcobAqAe7KRidSjd/532lcdd8CQ7fAqqiE39di+YULBtUN8u5QIGq5wWBq69IWMlk
	KUMlSj2vwtZByL3jBq3BWg3w97BFZgdvtnvw/89L5EyWPXuAvNu6e0QZxbsdZT5JXZtOk9C7+2C
	K7tFgHLR4EfEoARNwy3gXloflVGAy52NiCL9Evxyt
X-Received: by 2002:a17:90b:4d8e:b0:387:df8f:1406 with SMTP id 98e67ed59e1d1-38f9c04002emr1506892a91.39.1785404038491;
        Thu, 30 Jul 2026 02:33:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4d8e:b0:387:df8f:1406 with SMTP id 98e67ed59e1d1-38f9c04002emr1506877a91.39.1785404038044;
        Thu, 30 Jul 2026 02:33:58 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265010esm19576966c88.6.2026.07.30.02.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 02:33:57 -0700 (PDT)
Message-ID: <e36a964f-de77-41d1-8730-9a5e796dcd47@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 15:03:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] wifi: ath11k: fix resource leak on error in ext IRQ
 setup
To: ZhaoJinming <zhaojinming@uniontech.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260729020005.219253-1-zhaojinming@uniontech.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260729020005.219253-1-zhaojinming@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3MCBTYWx0ZWRfX/gHlMkUrIWCk
 gNWStVippqH+PB0pkgA9XKC+FgjdZ9LjQwblS4Hl0/RR035ZCofHNBHMS+8NmAmzXYWad7lyrCb
 G/iwE4Tf9gD2Z/Cu9vNGbWEsbLLJ2CkTynnhLhWTjr8iL+RYtQdP25uogmvA9eRuxDWlNVNR4Yy
 9iOysmoAMSj24cDjEYxqgfHf0hCxFFZ847jX6ek7jiZa8XAl9+Pl3J5r2nlJP30pD29l/nyDCnd
 ez8/57TvbXxXCI3pkxoz1LpwmeXgo+LZ1IahrSNZ9eub2w9EA7sXlaHe9YWHBvOpXD8qOuqgBDC
 189lMk3SC4k4XdOlK3o13fcDWk5SwPbuiOHn6+XM5vmgYsMjzJYZ81NgwmYybeh1OhVDnhCZ2RJ
 1nVTkMEIuk8ZcqIEohh2p01tCTKZXlj7X6ur59VqlpBNjpZ2MVxAwF8kTcG7isoBnKncT/uimoN
 gR6hUpZp5LOa5XaJILg==
X-Authority-Analysis: v=2.4 cv=O7UJeh9W c=1 sm=1 tr=0 ts=6a6b1a87 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=iHwBjlyiAAAA:8 a=EUspDBNiAAAA:8 a=t70t56v2sCmPkK01i0IA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=uNSKXYNwxGiU6LD0JREI:22
X-Proofpoint-ORIG-GUID: NoiPFDooUoHiaynrLG-j4j3H6RJfjxtP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3MCBTYWx0ZWRfXyF098Z5HBLnG
 90ONH+FQOketBKmC8mN/uqXhaHfKvWpCk+XxycneTJZcnHENUdPRnbi+D+xXTozpuhVVo/xXnjy
 w2j6YsM7cLYg7L5lEQjtvUEkxIifaNo=
X-Proofpoint-GUID: NoiPFDooUoHiaynrLG-j4j3H6RJfjxtP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_023401_702160_BF393777 
X-CRM114-Status: GOOD (  15.10  )
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

On 7/29/2026 7:30 AM, ZhaoJinming wrote:
> In ath11k_ahb_config_irq(), when a CE request_irq() fails, the function
> returns the error immediately without freeing the CE IRQs that were
> successfully registered in previous loop iterations. The probe error
> path does not call ath11k_ahb_free_irq() either, so the previously
> registered CE IRQ handlers remain attached to the interrupt lines and
> are never released.
> 
> In ath11k_ahb_config_ext_irq(), when an external request_irq() fails,
> the error is only logged and the loop continues. The function then
> returns 0 indicating success, leaving the device in a partially
> configured state where some external IRQs are not registered. This
> causes enable_irq()/disable_irq()/free_irq() to be called on
> unregistered IRQs during runtime and remove/shutdown, triggering
> WARN_ON(!desc->action), and missing interrupt handlers lead to data
> loss.
> 
> Additionally, if alloc_netdev_dummy() fails for a later IRQ group, the
> function returns -ENOMEM without freeing the ext IRQs and napi_ndev
> that were successfully set up for earlier groups.
> 
> Fix all three issues: propagate the error up to the caller and unwind
> all successfully registered IRQs and allocated resources on failure.
> Also move ab->irq_num[irq_idx] assignment after request_irq() succeeds
> in the ext IRQ path to match the CE IRQ path and avoid storing a stale
> IRQ number on failure.
> 
> Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

