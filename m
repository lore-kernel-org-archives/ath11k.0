Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998AFC43458
	for <ath11k@archiver.kernel.org>; Mon, 13 Jul 2026 07:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSzNUSs2EjT2U8xgegIJDooqgLj5sbqIxrz14JPKQGs=; b=bTi+JqBQbSvG44lCI5yHjr17Xw
	qgPhu/f5m/v4xwba31lak2fVTg9ozDxwRWa4eeDsfxywmQI+zfzjg785IkEVf/YPaF2VJ5Wj6g919
	SbF+6rhVVLdd14znslMZkTFhftFRED/uhXZJFWsgTQjQJTASLwVTLhO6at2/XDyv3IlxJ53drNlpr
	cZFEGsZ82h0/L2I4+qonGqY4pI/8x+rl+42yEdQeKTs2s/D4SO3kTvSW/d0hwScQRJk5PlSmdUmL4
	cUjo+8d0xfOEpypCS07TVmTIYaHQeaM+t1WwImHKwKAsCShHnYdtRPvl5PqjRJL0bJ9BiZgKSVOvn
	ByYGTltQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAou-00000008Ldy-3URd;
	Mon, 13 Jul 2026 07:11:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAoq-00000008LdT-39Oj
	for ath11k@lists.infradead.org;
	Mon, 13 Jul 2026 07:11:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O3uJ732794
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 07:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RSzNUSs2EjT2U8xgegIJDooqgLj5sbqIxrz14JPKQGs=; b=ntEd9RvDjN4kA8N6
	uAJtro9+o3xPly58+WciEpsiI9Ejuy02CWQM2JMk3HggtrtB0hO3Y3mruFv+eo0f
	dQHrDbFhpqJfdxEd4ELhKIvXSFfRPqygT9T7HttOx8IHq9a4XQ6tBV/QG36yf/DN
	wZBxFsdiO1ElJBrmP7zCqfRfHDEnRTPRLBTFRPM4RLRzC8ycn6iowF3vg3OuEAQ/
	K3+Ro1624xLwQitw7Wg5qChjchCur1XLMJdvSQ8OdcClPW3VyQrwrCLkwA2xJlva
	+dljYapJF+3UULpLVvQBJAcK8Wp58Pg2lt1jvYrwSPxB3UdrkF/lBkUIht8aeu4c
	yJaSQQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn39awx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 07:11:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84870e7f498so3235898b3a.3
        for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 00:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783926665; x=1784531465; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSzNUSs2EjT2U8xgegIJDooqgLj5sbqIxrz14JPKQGs=;
        b=BwVOH5enq2FfQR1RiGJAqjgUMWzM0A5QCJyMG5u+7uma9che+vWP4BsTLtQzt9CNHw
         MaRhMIRnfNggra4JqbJ71UcyjbvsLkNZH5nS2L7ClzlJscvp2z7kS4++Lm76UVDodSTV
         gvRRLkOmAL8jwPcWK4ZVal9+f1xlmGV94u8/srs4gRF/NbG5F4uKurBZqn++PuZEmtHe
         O1QxwFrPM4FgnyHxpNonGAmNSeyy9H6fQRPdRFresPtNEIVLgDB7pPZqBlLrXS/f2Dvy
         fWK4NuDwOXz4TzBWUOzvYlmCYBOScaZqhJJ6rzToJTyC2WtJ4flZdTZMqlhHxtqnl/Fm
         Uzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926665; x=1784531465;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSzNUSs2EjT2U8xgegIJDooqgLj5sbqIxrz14JPKQGs=;
        b=WtAXzJSO15pZwNIZt6IjTO5EVpouuPlIJi0+x/8H9qzWlBVg90YFdWMTtY9onS6QoG
         BAzWT3K458Vkg35xhcaCDHMYN/B51Gco4XHhSWRmjf5B/mjmNjR4LsT2MVQCBdRBtyPg
         JgsSfGW38m0DYo5oXGjfgmIw24N1dIigPIUyhkm/eTEmKA19627DE6ZHw+BDaJn1myCR
         Y01iHXh9/NVl9A7+GIucH2n66a1khSuhktt9LnyvOFw2FxexS/mbj/rnquZ0FiPR3K2Q
         0/Uq2tyEaWIj4V9ITXMzxeQNusmIkEasEEOdG+rQ+aEt6OPQp+U/liUDTDfCvR+Uqzz0
         0BEA==
X-Forwarded-Encrypted: i=1; AHgh+RoJJwu+TyySRrvQ0jB38qE7jUb38Vaplkq4bw5s3tg/7LwVPoa2qyVinchXfYPrgm9LgMr6Zn8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwG2bua97562/wgPeydPvOpHYbn5AjdYPnQhrzPZsSvfPWL7jIo
	ueguYlqKGLlJIj4vlq13bCZvsBHVI43iRRS7zX6u7zn+tUnzvRAXtoEHACYuYvv78snXkFV638D
	B4Yx+WfV1H//+uOSmnJR6CRsX+4d5XZg/xjIRwNwTloYiDwblY8EpgSP79sf9lFRU
X-Gm-Gg: AfdE7ckMq+6B6oaUeOmA9xHcB8tMJUaq3nfV5yw72IzSy53XXgn5eHIbgNOAuccfM64
	ag3XFynPmyqVCwEVgdodY3rLQm9T/+vKsJxD1eIXOIHIyn3lRR5a1l16RCoSrwrjUYjGvhq4mit
	swP5XEd5MNXRb7SdcjoCBRHEDI2OLApaUl0BDTMqnQq/RuHDo1zUHWyopDHMcNOGdBoFVukYbau
	DoDVMOyNH5Boph6sxr7PXqMbpHQMCuQCBH7HrG24pwXn1cWNN781V5sPb/QN1aTm7JOPcZsAFpp
	Ssc821OO1klTyhYissRKjJDW7A1ZTfVPEzF2WnPVnLLMNWwLCHW0kHI3ahL924cE2IzlvBN2Lit
	5WDc2GPX/O27bJ0FWBlJ+SFIopwdhmK3usfWEt3k27AnKONnm5I4=
X-Received: by 2002:a05:6a21:6e0c:b0:38d:fad1:cf2a with SMTP id adf61e73a8af0-3c11062f6f4mr8616668637.13.1783926665015;
        Mon, 13 Jul 2026 00:11:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e0c:b0:38d:fad1:cf2a with SMTP id adf61e73a8af0-3c11062f6f4mr8616647637.13.1783926664519;
        Mon, 13 Jul 2026 00:11:04 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c865asm72740326c88.11.2026.07.13.00.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:11:04 -0700 (PDT)
Message-ID: <c6dee88c-9c0e-47fe-8c73-c462a7613451@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:41:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath11k: cap out-of-range rx MCS instead of
 leaving bogus rate
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260701-ath11k-invalid-he-mcs-v1-1-7d963080c079@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260701-ath11k-invalid-he-mcs-v1-1-7d963080c079@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3MiBTYWx0ZWRfX70dhc9GHiWe8
 CjYwAx9Tf5pjvGM4vlZ1ztIS1CyY5AS0wPOHfIOMmm7UjLp5p1VDWmctQEZK2f9UCn030yuPmhi
 1mY1B35muObQ6UEeHq1nsF6JC7AN9jwMc+X8AJgSIx/d+R7WiEDMEk4rTnVOoGdZvS0G375tujY
 FXQHNYlw/CDhv5KAJ//UhcjFtkKhiPlHNPaQR4X33rH4k98HabdXEd1wAdjqm9WoT3W57R9fMAe
 TI51b4UHOdAGCzhwBygJ6S85EBEGhwq/+2ltDdii7VF1o/cOosKXmbmFWTKVD/gHvIuuwTX7LLo
 /mefTe90GD1fy/FVkiYjTBf0sRmuxuFntOvdtbh3+oTHBdT0I2tbODipLVE8NV+E2ck6iwb0Bzv
 jcVRsYzKur8K51dzdNkj9SZw2PbcSCHb0MoLOdSHlxpJ26/wrnFjldZBEBLu7aj18mjl0gciMd8
 ZsZjsNOTLy+zE+G51lA==
X-Proofpoint-ORIG-GUID: 65Md-Zhai0twUHtCKhcyE2A03T2_hUXp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3MiBTYWx0ZWRfX1uJdtes2gBaq
 YoQDxgmPQOhM9nQZuWrDmejCE18x3xH8lScC0stzW98yP97yRvCAKqTldUdXU5hNaFjuoo/Qlxl
 NLeGbdmetKHzrE5o3FrEdQdFB4ovoaM=
X-Proofpoint-GUID: 65Md-Zhai0twUHtCKhcyE2A03T2_hUXp
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a548f8e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WYK7N4G5aUrBRle6tyUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_001114_330509_23CC6A4A 
X-CRM114-Status: GOOD (  15.59  )
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

On 7/1/2026 7:19 AM, Baochen Qiang wrote:
> ath11k can receive HT/VHT/HE frames whose reported MCS is above the
> maximum that can be expressed in the corresponding mac80211 rate space
> (e.g. an HE frame reported with MCS 12, while HE tops out at MCS 11).
> 
> The frame itself is valid and decodes correctly, but for such a frame
> ath11k_dp_rx_h_rate() leaves rx_status->rate_idx set to the out-of-range
> value and never assigns rx_status->encoding, so it stays RX_ENC_LEGACY
> from the ath11k_dp_rx_h_ppdu() initialization. Once that frame reaches
> mac80211 it trips the rate sanity check and the frame is dropped with a
> splat:
> 
>    ath11k_pci 0000:03:00.0: Received with invalid mcs in HE mode 12
>    WARNING: CPU: 0 PID: 0 at net/mac80211/rx.c:5433 ieee80211_rx_list+0xb0a/0xe90 [mac80211]
> 
> Dropping the frame would discard otherwise valid data, so instead cap the
> reported MCS to the maximum the rate space can express and deliver the
> frame. Set rx_status->encoding before the range check and assign rate_idx
> from the capped value, so a frame with an out-of-range MCS no longer
> leaves partial or bogus rate metadata behind. Also downgrade the logging
> level since they are not treated as invalid frames now. The only loss is
> that such a frame is reported as the capped MCS in the rx rate statistics.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

