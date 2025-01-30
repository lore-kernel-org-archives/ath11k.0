Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261E6C0218A
	for <ath11k@archiver.kernel.org>; Thu, 30 Jan 2025 23:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpMQVs4KcQMDKPMkb9LX0wpMvU/A30lXuqIs/wNVros=; b=4hBwSfWFgWKauK8zy3MxpXSLL5
	KAmhADW4QZ4Ltn6Ant7XdhqRvwXZu0gUpiSUYM24/F0jtyjNXhHozii+zB6sOH8CnT2C3frIMsVLI
	TL4X3Fq7PQ6MRp9ANQPArz1Ob8LPjXVZ3DoBANaymb9eK0877A2SgX8qGS3HjMjtECBqvUXMfAxUh
	KYoAFHtvR/V1WZl165hKV4yTvljoisYVPwbYeLSX/8c2nnKA07NiRwjjDHvHHShumrXao2eQPY6H6
	w/vc+EVdbHRav1clkGwq+YUqIHYnPlck1S0HBDIDhYl81Kxz5JfRMtgVQZbeaUQaAyXuBy2tzf/2w
	W/Sm3UWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tddyn-00000009mpA-2MU9;
	Thu, 30 Jan 2025 23:29:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tddyk-00000009mok-2xnS
	for ath11k@lists.infradead.org;
	Thu, 30 Jan 2025 23:29:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ21xu003972
	for <ath11k@lists.infradead.org>; Thu, 30 Jan 2025 23:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PpMQVs4KcQMDKPMkb9LX0wpMvU/A30lXuqIs/wNVros=; b=TtjzrEIuXSMk0FSE
	ofSegcADmrf72Ha69LYwmUs6+GCsQhLHFoHabDVkXMFHUWn+3/Uz7RNgxdbBwcNO
	rj2I2wCje/cczO/O895lbQutXUP6GBeISH3P+cOJWNYP1uPUmfayJKIykwQPZBZC
	c7kuA7TgB6N8ekkGGIsw8VvOPvrzITJxEpdOMQP0JsQzOx7w9aUHcjbXC52E1eBH
	n/TqciEsTNS+DdPOVASRmGbPJa6CG1+n/a/DIUl8VqnM4nzFPA5bVP3QLeySGDkX
	2HYP8RVhlQ0DqtFhTJifY6TT30jaGCDomplVZxI+FziOK3Z109BW63YX0AZNZlPL
	daXPFw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gf7m8fye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Jan 2025 23:29:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2163c2f32fdso40536945ad.2
        for <ath11k@lists.infradead.org>; Thu, 30 Jan 2025 15:29:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738279784; x=1738884584;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PpMQVs4KcQMDKPMkb9LX0wpMvU/A30lXuqIs/wNVros=;
        b=H6E1DmDTonmxResKLzWUUYB4XsLRsE2/GazW3bA781Uz1VljZPVVkBeLWCWFPV0zIz
         GJyCjP8l3pXD2t1M8RQASF+LFKZovKvxroUZYWL/fBtQwB/DdySBlmGj6y/kyWKebS9V
         48TIdRgZdn8gVRp2mt6t+OLvq03VsMPrQ/FihYxXJtYYlOX/E4bJX+WIn9HO5RsFjJUa
         yt1uo+KlZnWhNqxch+wHzZmyQbhJqK3/8vSALioUvD5QAHz4MH0fvwDY3Z+H8eSjz53B
         VedWiUFyvihFt+ryuh/N1EQMDapkhn1mqL/zlbirGql7tXcl0O2fox6rQ3xMBPY8Jl7O
         JuKA==
X-Forwarded-Encrypted: i=1; AJvYcCWB4bNcJHc+dGACObYMxs60wULNzCwEAvtmE640a3/NR8zWmS/QSXHpUE0jthMKW6cTEu3/Zow=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ/9JiOb2tu6kServ50naS0DNqvp/tpXkmsOqVjbHEDMw+6hmp
	Vnb2gBGFzESoNBmwELgs4f7dw9tMFuODzvQvrW3Q/4wmyyoi4UkrLX042A2iNlc24f1RG5zr5Kb
	Yehsg1FayxKcE6XIjz0bNSr4F3GOsSEuJKY7sNkVH5mjVohg3rTLsFDwl4RAa
X-Gm-Gg: ASbGnct4HHg5+vlHa25pTYaVYt7qgpThYTe+mt/azgsjoVazPD6tbUPgoT/7USaelcq
	IKDEgElequg+vTuFsRl4TwlC9QyLeByh2kL/i/48i9IDovLB3npxKha2bM4fadFvleV4VwQxiXX
	YXiUb2XF/gn3wy4JC1fCdNbX2VEKJjggpaIuUEUbNdx6f8hYYcB/aH8qtOdiBAYs2kt/fQzWtLg
	CrhLqsBB+E29fCBXicH90OBr6bMAtE7mMebcumS18A4YtjXwusSvZoNEZgmz0stwI91o8JBLVvv
	LbS8jpSF0fsyqLd/vnExxnWMG2tovYDvdNZvU9PX/0SgiRXUok7Nd51Kzql10/gw4D4sBy2M+g=
	=
X-Received: by 2002:a17:902:d48f:b0:216:6be9:fd57 with SMTP id d9443c01a7336-21dd7d78943mr128304185ad.21.1738279783886;
        Thu, 30 Jan 2025 15:29:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFakuHqBiun6rQh7UKOFU1AcEATPAo4CvsaEViXwktWRFUvJgFZX9Y5IQeesn4fbUvLNxsxw==
X-Received: by 2002:a17:902:d48f:b0:216:6be9:fd57 with SMTP id d9443c01a7336-21dd7d78943mr128303935ad.21.1738279783508;
        Thu, 30 Jan 2025 15:29:43 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3308e32sm19268995ad.207.2025.01.30.15.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 15:29:43 -0800 (PST)
Message-ID: <90c00af8-b6bf-40a2-8f6c-89b5666095bd@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 15:29:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix wrong overriding for VHT Beamformee STS
 Capability
To: "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250124075953.2282354-1-quic_yuzha@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250124075953.2282354-1-quic_yuzha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JRXck9HRKc6MnrUgngXiwS6rB_1ijESl
X-Proofpoint-ORIG-GUID: JRXck9HRKc6MnrUgngXiwS6rB_1ijESl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_10,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxlogscore=821 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501300182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_152946_875998_5A2F6F75 
X-CRM114-Status: GOOD (  15.20  )
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

On 1/23/2025 11:59 PM, Yu Zhang(Yuriy) wrote:
> Current code in ath11k_mac_set_txbf_conf overrides nsts, which is
> incorrect as it confuses nss and nsts. nss is Number of Spatial
> Streams，nsts is Number of Space-Time Streams.
> 
> As mentioned in Fixes: 55b5ee3357d7, the nss used when acting as a
> beamformee in VHT mode should be reported by the firmware and should not
> be greater than the number of receiving antennas - 1. The num_rx_chains
> related nss rather than nsts.
> 
> If STBC is enabled, nsts is greater than nss. About nss are mapped to
> nsts, refer to IEEE Std 802.11-2020: 19.3.11.9.2 Space-time block coding
> (STBC), Table 19-18—Constellation mapper output to spatial mapper input
> for STBC.
> 
> Remove wrong overriding for nsts of VHT Beamformee STS Capability,
> acting DL MU-MIMO in VHT mode is working properly.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04479-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Fixes: 55b5ee3357d7 ("wifi: ath11k: fix number of VHT beamformee spatial streams")
> Signed-off-by: Yu Zhang(Yuriy) <quic_yuzha@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 5 -----

* drivers/net/wireless/ath/ath11k/mac.c copyright missing 2025

I'll fix this in the pending branch if there are no other issues


