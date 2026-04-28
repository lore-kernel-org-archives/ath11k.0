Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD63FF8864
	for <ath11k@archiver.kernel.org>; Tue, 28 Apr 2026 02:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wVcCD4RrGGxb9mwsikZgQXgvSMM4iURlDffudqtC14=; b=N8ssqdFtlFawuE4EiQajSYCnyz
	ZKSCgq/DwNvrg7BLRx0Y6aps2MLoqMHPuSW8riqEiAchPkZ7F3lilP/laPTUNcL/kZjq45Ma5igLh
	FDc35PwiBLUkfxoGWkiEyzOW3WdwMmc6wQwVjWl81uylyWa/QtBeWUNYuyyNDtMIrqLdxqkJhHnWb
	NidFP5v7sV9Kq76FYocwi0M/FwVU6gZqv6W+aq4LRdHUJasGPajVx6dPipEzHIOu6o5xjfONFhL8i
	aCXo4mNmUH37pu634/9TcmN1pfWba6cmHvQclVaCo7TbiEcqmE/Xmqo0sASa+LUTiEvsi2ynlhFuM
	jYGRoDqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHXph-00000000QRy-3cJ6;
	Tue, 28 Apr 2026 02:05:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHXpe-00000000QRb-46vn
	for ath11k@lists.infradead.org;
	Tue, 28 Apr 2026 02:05:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S15Uer440726
	for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 02:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4wVcCD4RrGGxb9mwsikZgQXgvSMM4iURlDffudqtC14=; b=UsZytqrFzA0sqWAh
	lpUP7lFrvxx4cQiYL/5RiioKPm0Y2iE85nfJHVJESwSi+YSi/Bc3VeDY1xe3OsMK
	xq+3yZFSl5EpdQtU5/aVdUl0pKt+8s6IiMHG3uCQIkF15LbqtyfoKHSKMY+uLprS
	lKYov9CvcGlMwkptqlDkYDN6ypmBzw3SOtul0ncatRnKpxl1+R+TJTNhKTtP3oHc
	7c7GzYoADUE0j8paznsv5PVonLHe2rfcrLRSWCxThUFCVhiqU4S512KLruL6LWaQ
	4oBciUn9oZB7PMoVTIeGlSGDXWQeO1P73VEqZA4knjxVoN1ctM24rEWwh5kZ73Ne
	umypBg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac4257e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 02:05:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b7c2ee830aso71184655ad.3
        for <ath11k@lists.infradead.org>; Mon, 27 Apr 2026 19:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777341950; x=1777946750; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4wVcCD4RrGGxb9mwsikZgQXgvSMM4iURlDffudqtC14=;
        b=TaLimjvPVxUq4SVGB9bS6DmaTv1X2LN6AmVuIcE92Yr/VkU0CWLMeNJKkCJrVkBpF6
         NnWopvYTtxc2AaOHKDxr4ReWa8Oo5guvbmbXyCO7JhAFWIhJFbJq2t7K77Be06CMNpe5
         lUFxMcjfW3bfGuvjq3gXyXQV3LzYhpIP8IoymHVNRvURwAxAfONlqznwQL3FIsJmvjcr
         ypxUpouI5UD7C/67ReTYweKqpYjtTp+XP6j8ixntYSN0qfLrrd25GSSrzrsFNQO+36dp
         /nxqxb0TT0NjVifGfGj+d6o2ls0YK4zKzLv/mIFwIhOdk/ik6H/4eEQ12epyUGtAfYYb
         ktHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777341950; x=1777946750;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wVcCD4RrGGxb9mwsikZgQXgvSMM4iURlDffudqtC14=;
        b=GriA0Y48DihhkewoNzevnjbu3w2OlMIjxr+ew2bFeK6z3aYglMhCig+RJFNHQNdSU8
         9aNivb3Jck9c1xDwD7UmFKRsn2ZFRrKBlKs4QsX2E6wuIwfO2tKN/QOzYWzCcPsJVCd/
         Zv1WD0Osc34y0YY5ZJ5UCUpnlRS2Mdi76OEcTN3yhSm0WHNZDUsjgG8aEotgdAgGzR1f
         ijMdXq5EoOoTR27i8QawAb+Ib81Nbb+FNIC4APbuYuwXJsutdy/AeeTvundQRpufHFrg
         Z8YfQnzbK6dQ1iMgDoKi2dfBW3meEeyUzjVYbJiPlQt6QPpyzgVfZix8nZ+uagu9D7ul
         7EEA==
X-Gm-Message-State: AOJu0YwM2xtjr7QMTwoQQpXIH16U044S8PIvFxe4cztsgxRaoqLHHjDk
	ZU+DlhMs/DRkrUclKfoNrrWFqICUhUAFsL1GFP/nQQghjfydorepxEdgFmRiMb6av8JUwgVBbZO
	FBdbzjXmDSux/ejSue4avbwvqyYrqobNF/QDNc2IO9VWllSS4nw0s0Bg1q03Z5iVm
X-Gm-Gg: AeBDietBUHV2bvN3NR3sJgTlOH/fnUekjzovjNDwaN43vmKYm4KJdqVLY/XU+3ZXBT+
	XbWJOr0grKDyr+UhLVTqDEnh/WOxycnK/9xfuUkraQUJaRDV/oiDqYM+JMDdwsltScvLQkPaF2u
	FaGCyjb5LaGoUGpfCAD/31EaseM4onr38iU3X65EDr/3ct0O6tSFaCdnbgvPPPiTAfqT4HPJ7Wr
	RzI4aD5hXRqSLLoASF/hHmY8DLM349UNePTccwxS9Z/CCt1KEsnqSpNy1NiYmTMg7UG8rvZWrUZ
	7NKGrPbSdV8NgTy+4tpWL+A+uDoBGwrzFpINkEl39kOlf0AvHQO8l+4YQ3Mb2oIIas1ihdWRXZv
	TtSkk0mPeGIjs1JG0iRnHBKrLXyAPk9bxR+peADNn83tIRFvGXzd0rX8TSNV5n0xrjuNBlD3XS0
	3KSroK2Q9yb4SGGt7uoa6B6Y3KCYCfOg==
X-Received: by 2002:a17:903:2acc:b0:2b2:4cd2:e162 with SMTP id d9443c01a7336-2b97c48d869mr9555845ad.34.1777341949770;
        Mon, 27 Apr 2026 19:05:49 -0700 (PDT)
X-Received: by 2002:a17:903:2acc:b0:2b2:4cd2:e162 with SMTP id d9443c01a7336-2b97c48d869mr9555605ad.34.1777341949264;
        Mon, 27 Apr 2026 19:05:49 -0700 (PDT)
Received: from [10.133.33.153] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aa93329sm8048505ad.20.2026.04.27.19.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 19:05:48 -0700 (PDT)
Message-ID: <6826ce13-ed2f-42a2-8b46-1357b4a9b4ee@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 10:05:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath11k: cancel SSR work items during PCI
 shutdown
To: Wei Zhang <wei.zhang@oss.qualcomm.com>, jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260404043050.3433754-1-wei.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260404043050.3433754-1-wei.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4RA_moFb9lJp-BYNWn5xEzq__Fcu7TnI
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f015fe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=G9A0gv2bhTP1aVYgofQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 4RA_moFb9lJp-BYNWn5xEzq__Fcu7TnI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAxOCBTYWx0ZWRfXwyVX5RoVeshw
 FnrCXF8zXQPZRrtIRGCJWSntWKPRrbB8Mvft10Sou+EBTAY1Jz0JZBf+daL4MCaWq6pSBxdsMF2
 7Lb+tU+xFyL/yxmX6pyphYi3zRe4atnNhydXmwth68fi7gcaCdLWf7Fol+8i5yi1IOWjTxDxbtc
 0fCiFWjd1z+Rzav9IKnWFlS5pSxV/c9Xs/WmwLIjuVEQ2Zkx30i2mJgj1EyJ76bOIgV2Ipcn3A8
 OteCrYTiA1zitsBES0WxIPKmKzFggFSqhMc9ZjLd3R3XHWFe2El4O7ia8Kmc3msmOvym1sMMUMT
 fTVGlDBkTEpROVbe7j6dd7FsmeozNYy66n/8SVw73ldr8atGNJrqz84Kigzn8fdTKJk1DENku8+
 d/g62DmJOdhZTp4ZV6gav7a4UJijvZ9wIOtHA8JNUz/IaOn59yGCh0lx0MXW/+IS55gmZhsf6NK
 LuKnkkEZjR6kSIe0O1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_190551_032463_9CE5DB7B 
X-CRM114-Status: GOOD (  14.56  )
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



On 4/4/2026 12:30 PM, Wei Zhang wrote:
> A reboot can crash the kernel if it overlaps with WLAN firmware crash
> recovery (SSR). The crash is a NULL pointer dereference in the MHI teardown
> path while freeing DMA-backed MHI contexts.
> 
> Simplified trace:
>   dma_free_attrs
>   mhi_deinit_dev_ctxt [mhi]
>   ath11k_pci_power_down [ath11k_pci]
>   ath11k_pci_shutdown [ath11k_pci]
>   device_shutdown
>   kernel_restart
> 
> On the host side, SSR is driven by the MHI RDDM callback, which queues
> reset_work to perform device recovery. reset_work power-cycles the device
> by calling ath11k_hif_power_down() followed by ath11k_hif_power_up(). The
> power-down phase deinitializes MHI and frees DMA resources.
> 
> Shutdown/reboot runs fully asynchronously with this RDDM-driven SSR
> recovery flow. As a result, the shutdown path
> (ath11k_pci_shutdown() -> ath11k_pci_power_down()) can race with the SSR
> recovery sequence.
> 
> Fix this by canceling SSR-related work items during PCI shutdown, marking
> the device as unregistering, and serializing the RDDM callback path that
> checks and queues reset_work. This ensures that no new SSR recovery work
> can be queued once teardown has started, and that any in-flight recovery
> work is fully synchronized before device power-down, preventing MHI
> teardown and DMA resource freeing from running more than once.
> 
> Note: This issue only affects PCI/MHI-based devices. AHB-based ath11k
> devices do not queue reset_work in normal SSR flows.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04866.5-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Fixes: 13da397f884d ("ath11k: add support for device recovery for QCA6390/WCN6855")
> Fixes: 5edbb148bc57 ("wifi: ath11k: Add firmware coredump collection support")
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


