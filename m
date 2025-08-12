Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C43C87FCB
	for <ath11k@archiver.kernel.org>; Tue, 12 Aug 2025 09:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Kr2pRIbKGhXrisn4aRMRXaQcZyrn4ULlwl6JekrU08=; b=HJdu2IafjESp7JRwEpftKQ1nr1
	Y1sXlQh7yhO0CJUKN6TXyEkBCWFLP/2wgBq8p6AH2flj3o6xAv+FLfbMpoqTvBurOb1ElpSSir3b5
	ep5qp40qGu5FV4ExIQEVuh3jrU2wz6UmrWCDY97FjWGf/RdZ7l5bSt+2GRFmqzTU4ZyRAqPEPK1uo
	dOU6c0B46FR+vL5OqfZ30dbRjLa6Bb5hwv0eLUNZuGgu1PcNRxP7HFZ2N1nJdUpzlZaUHku/RXbLb
	Ue0pyXU0gIqh+eh5OX2Ebic0gYkzx52YhduYhhqREgG7BB56zszbu09+XWooM2KGfXKZcORExR+M3
	dN0Ye0Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullWs-0000000APhO-3PR7;
	Tue, 12 Aug 2025 09:42:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulimj-0000000A3q9-02qO
	for ath11k@lists.infradead.org;
	Tue, 12 Aug 2025 06:47:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4Pv3B013093
	for <ath11k@lists.infradead.org>; Tue, 12 Aug 2025 06:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Kr2pRIbKGhXrisn4aRMRXaQcZyrn4ULlwl6JekrU08=; b=NPGYHzwLfItB4bry
	jnkwP5yvKt9JKyf61jsGQCdS98ow4ygKjvLkHNFhOucOcZX4/v4tXlC4Pufa9zA5
	fjaN2jbJA5RxiQnpIbBlck9dFhgr/H1hfylxC1WxlYe/yZ0JYpI3p3RboOXAdRFG
	H617ryZXGHCddcVXA6bE5Te1NgHSygVWxdFqYZ/CD88RWa5R2Zlqb2SQrdXFaVHr
	jyOo3C+hpzUJc7yJ3FyCkZW1Ja1m+2iyxo/7pwtN7vIaXFMeY1FPMLn0w2Jrfh7D
	wLaVliBkGPJUfr3huaHVUVOG6bttkTjx20tLndDxNlPfmzB2l6NxMG1XCqX7gDyI
	5EmN3g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmq81d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 12 Aug 2025 06:46:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2425364e0b2so59868945ad.1
        for <ath11k@lists.infradead.org>; Mon, 11 Aug 2025 23:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754981218; x=1755586018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Kr2pRIbKGhXrisn4aRMRXaQcZyrn4ULlwl6JekrU08=;
        b=tf/71cVaEPURPal3xnQg9SWwn3QHiM0U8agd6+OhT1edpsBTANe2i0RF/NZ/+pZMqp
         fytDifKBuMIR7QdIYd6hhy4cUdCxRo97ANV2LZdNF2MoQ9SBKLzIIn2aU61BwQFnCvIx
         AXm3lsNTzfnQnu4sI1MtNgNqMOxaHZj8kv+NAouNVUBLKsLIeHoJOcHiftn+4laIIzpa
         K5RFBDNglcvzPsfRxhchgwgxCAjAlvoYVyJFSUdPQ7GOJ1OS9pKRWKfd2jnzttPs6J0C
         vwh1uHws09tHejIJ5N0DOftJ/PecYwYzAc2Vv/OLSn22lCevkdinN8cjZul2CLk4NkUQ
         de8A==
X-Forwarded-Encrypted: i=1; AJvYcCVTRo7aWhU+P+zoX2Reg3DbUBEvnPwo+/JT0ilAeENi4pWuFKmFU92gdHfSz1a7zyYLCGALCwA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZfdEzbJXa1wlpu1Ik0Dh40OxhMohBgzGLauazRWLwAwkcdfJW
	EJPHeiI3oT8EIh32W0IKRfgCg1d9+HyFutqwpS8m0UFQDhflChOJwyS+NvsIa5K1KulQqDNl5aK
	tRyW3LxwHmkdE6FWBP5Wz5pZ1vXlr7tJYbnBCJ4cNqKalLJOsPqEubX/jEM8oiXFzlP0Sj85d
X-Gm-Gg: ASbGncsvqHezYsiN3wnAp14wTfOfCdQSsiWGciu+tFqvcMtUuIofrkoNPUVQTAYpjFC
	MzP+vv2bHsCKBdQUWW1yaKtcFfdWAf6Jr5LglPP8SKJpoanPR8/ktL+FCUbZrm3s5Zb14qqyNbK
	j5w9TH5wkefB7A2/1fwtpPWsShHiU1QC7YUNJHHt3iH9B9pSGbOGhEbZrEr9eNineyiwtHExstt
	zI4lNlob/PipCOBN8ifmkKVc1KgMqdmGOfivzjR551im29EE55g55A7KlIL49iILzQJ4ajbQxd7
	BuMOTsgD053iGNuyqu4p4Pt+aK0ox3lBnfndG/RT7Xlim4T9p19P/kxhDl/4CaFp+wbfKW273d4
	pEnE1zw==
X-Received: by 2002:a17:903:3c44:b0:240:2145:e51f with SMTP id d9443c01a7336-242fc29a2dfmr35904185ad.3.1754981217748;
        Mon, 11 Aug 2025 23:46:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGoTQo+EKaQpL1n0rOHNJ+qtlD3oFfHBOOnn1tIXAkifFBzULEIuQNJxlp+h46v3O7DQONYg==
X-Received: by 2002:a17:903:3c44:b0:240:2145:e51f with SMTP id d9443c01a7336-242fc29a2dfmr35903905ad.3.1754981217280;
        Mon, 11 Aug 2025 23:46:57 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63ee49ebsm32588248a91.19.2025.08.11.23.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 23:46:56 -0700 (PDT)
Message-ID: <ca805b87-c733-9397-c21d-36e4094d3b30@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 12:16:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-current v4] wifi: ath11k: fix group data packet drops
 during rekey
Content-Language: en-US
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Steffen Moser <lists@steffen-moser.de>
References: <20250810170018.1124014-1-rameshkumar.sundaram@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250810170018.1124014-1-rameshkumar.sundaram@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=689ae363 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=TyE3K8orULLnhOBPg4wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: f7bvAkGABSRa0cX06QupBLyew7Vm5n9b
X-Proofpoint-ORIG-GUID: f7bvAkGABSRa0cX06QupBLyew7Vm5n9b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX+nfyUOXAFegW
 Z7pO1aab1NE8GT8aUlTRygLH8NC2DeL0Q2X31YHW7Ahz2vwgnT4ONRO/2nnddXTBBjvo064K0ig
 EzvHeap/xIDIN3wSNPPQsWr35cOUDViTUczDKeQGN2WCxj1ak3RrBopfuFxHWWXfFMNVubYgc0l
 US09l6zDPEMtWPvpH1PZ4iO1l9/rIMJrJ3yDSr628LJGdVf0YGIJi5ycEYI7haNL/VADKhyvZrY
 xcvDr3FraZ+Zsj9GRugcUGicN06/vxaRcJ06wnbKa0wvFwDOzjS39nvKcz0nLAipr58xy3WPCSA
 AtpK0dYaS9nG+ijp35nm9JmiouH4guYslc9mleyC5P2rpQ7sroHF1Q7zN6CPSg8J5lxsErtFW4X
 2iToOETZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_234701_172137_D01CA5D5 
X-CRM114-Status: GOOD (  21.37  )
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



On 8/10/2025 10:30 PM, Rameshkumar Sundaram wrote:
> During GTK rekey, mac80211 issues a clear key (if the old key exists)
> followed by an install key operation in the same context. This causes
> ath11k to send two WMI commands in quick succession: one to clear the
> old key and another to install the new key in the same slot.
> 
> Under certain conditions—especially under high load or time sensitive
> scenarios, firmware may process these commands asynchronously in a way
> that firmware assumes the key is cleared whereas hardware has a valid key.
> This inconsistency between hardware and firmware leads to group addressed
> packet drops. Only setting the same key again can restore a valid key in
> firmware and allow packets to be transmitted.
> 
> This issue remained latent because the host's clear key commands were
> not effective in firmware until commit 436a4e886598 ("ath11k: clear the
> keys properly via DISABLE_KEY"). That commit enabled the host to
> explicitly clear group keys, which inadvertently exposed the race.
> 
> To mitigate this, restrict group key clearing across all modes (AP, STA,
> MESH). During rekey, the new key can simply be set on top of the previous
> one, avoiding the need for a clear followed by a set.
> 
> However, in AP mode specifically, permit group key clearing when no
> stations are associated. This exception supports transitions from secure
> modes (e.g., WPA2/WPA3) to open mode, during which all associated peers
> are removed and the group key is cleared as part of the transition.
> 
> Add a per-BSS station counter to track the presence of stations during
> set key operations. Also add a reset_group_keys flag to track the key
> re-installation state and avoid repeated installation of the same key
> when the number of connected stations transitions to non-zero within a
> rekey period.
> 
> Additionally, for AP and Mesh modes, when the first station associates,
> reinstall the same group key that was last set. This ensures that the
> firmware recovers from any race that may have occurred during a previous
> key clear when no stations were associated.
> 
> This change ensures that key clearing is permitted only when no clients
> are connected, avoiding packet loss while enabling dynamic security mode
> transitions.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Reported-by: Steffen Moser <lists@steffen-moser.de>
> Closes: https://lore.kernel.org/linux-wireless/c6366409-9928-4dd7-bf7b-ba7fcf20eabf@steffen-moser.de
> Fixes: 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

