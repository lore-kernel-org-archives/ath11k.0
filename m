Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C59CA9ED1
	for <ath11k@archiver.kernel.org>; Mon, 12 Oct 2026 15:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAdX75WRt1z0l9J+6glmJ42BYc183LpaLtY137AuQhY=; b=eJJeCVuQwtzGwa+91FvsqV6YDE
	aAFTEiSxMS1J92tNLnmu+f1tjo6l0vR2Vb9khYwdTiFkcKrDHLFgDQvdWBzL6WQGkH+gD9kKyVPHj
	ZavyZ0X+JAmTs/JrKi7RFbrraJ6xGk487LWRIQajDbUmNWQFRXHqJpXf1KS17jncdfOPu4Iq/s08X
	wygVcM2nWds1l8MoBVxWZWFLNNkubipYJ7/E2rUF+8pfthhxEnB+MXk3PQrWzVmZNpk857vH1PeZb
	TM84PXcQyn/GMiY31CgswQPfW4nylyh6p44cz4YfSZHwJjIRN3qCfTxNNh2bGz10kk3HCbidmnYAL
	UZNlbiGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIOk-0000000AtuE-3tlB;
	Mon, 12 Oct 2026 15:57:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIOi-0000000Atse-1LFP
	for ath11k@lists.infradead.org;
	Mon, 12 Oct 2026 15:57:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFpknB2761185
	for <ath11k@lists.infradead.org>; Mon, 12 Oct 2026 15:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xAdX75WRt1z0l9J+6glmJ42BYc183LpaLtY137AuQhY=; b=k61Izvj09J1i+SqK
	8HOyPyrhPWM5o48Xpp6VeHi1PN1kYW5jrd0j+Jkikj6pN32BBLCcAaT28WenGhpv
	x0xr9UvGcaQesmhxzHOo9bD+hWqAjJqOAjoPJFkN+E1XvfPw0AjopP2Lih5l1O+m
	o+g76c78MrXjaQq7X4K7ap6iIL21bjJ7nZtDLfIx8LF4XU6e/UVAw5uhuwNHLRM2
	8ISjJNCceqoWLDqgZr22Vio9NZuJG+CLfKSRDG7Si4ENxvye0oHL5c8vCvVUshC4
	N60mgs+dUv7Nesz4+tZBOE8oE/FYAmCLjjBPktR/52wEEqGCYNo73tDU2r4/n4Fz
	JDrxnA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h92jjr0uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 12 Oct 2026 15:57:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so5788489eec.1
        for <ath11k@lists.infradead.org>; Mon, 12 Oct 2026 08:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820626; x=1792425426; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAdX75WRt1z0l9J+6glmJ42BYc183LpaLtY137AuQhY=;
        b=DDNpmw6gZF9xXVUGG+CoaeHsvEyEtMQ+V9cRaT3zYM7SPMyaOaNCWfBDshp48REvi8
         Px679jsVDxtqDPCdIDOzWAPHgy8y30qQjss+8A0bC5F4Rx59jecfO9c54Igk/b1hVrpK
         pGNzp3u319wEPQcC+WAkpQHCNnczPOTLjJ6zdxRz+cPxiE0cpwGPCY374jWXx78P6yxl
         32IizfqkiyRVmAeK2WGWHFihrLq1uVBSnUKksSek/qsJ3kmQrApijBHDGQnans7sHb/Y
         7nI1YPFm9gE0RnsZS3jQ/mXMVlmtjveQ5FmtvhqFuDO3QZoeR9Saf0qqcK/Cb23d4ftJ
         Z+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820626; x=1792425426;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xAdX75WRt1z0l9J+6glmJ42BYc183LpaLtY137AuQhY=;
        b=N0Jn/wx4mdQQrB6B8ck7vMDHNkLRzyg0nPhjDKCqFQqX6ILnwSPJBZsfGg7vB88aqU
         R2MPilq+ht39AJ8Anfc+AYvsjctqA7t9Hf+hKNWGfkMVpK+xi3DusTYGWDVu++73bVum
         I7LuJnjSoYWV1bcXjvDEqYHcshdugM+pB62EHpL7UsKZ1jCErVVbbAldkRNSRo/tZJfd
         B/u5vesT9T4ehCHfeORHykmZQ/jk4jwxO6JAbcWG6X2JQSfXjyjJGFNbEaVuRiMSG/mi
         uUx41YcgRkttOyhpvh7nIRIA33UkuBJ7ZN2lHNxtjI6UNWa1v820X1XMHTiwLwBiuedm
         QJfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxn6t4baPRNzaJAtuBte6hB1f5SMYf9rw1icrNXgrpnZ3Dv6t0FAu6GqXJ5pfNV04+BpsCss5I=@lists.infradead.org
X-Gm-Message-State: AFq9FYKRbfrau9POMFpbrDSSNOAPoFXD4oskpzjwCI3pln29OVm7Rr+1
	TBUZxBC/FI9UpRZ0nqUYWMQRD8mnj8ap2fq7jWuTXWDL3QlmMV77Btms+2D7+XAwjHfzGZje+Ki
	ullE1YW5lBqSfAflez6HODV9QRH9YnNer+MHE+5yxdGXG4bTavPSzcs/qhYDUKYql
X-Gm-Gg: AYBFou2GHPLLigd3N7GCxnY2SBKPUVcXOPs7MP8VixNSsdARr29g6E88qjP5sT0qa4K
	sKE6CwNv6sQcKWAwo1zxQzll/OjukTkMTC/0j8eVKRaKDM5zEM/fUVrqzl5B2jozZSSFcj2rsRw
	MX23Q0LY8Mx9473DKKFpE/XvJpelDOZ4Tpn/bmuE4krJofhuVPAAnGGLAJClbmQCkoSgcnwQCuG
	6T7Wyzz1ryW2Pjv8yrtCphuPqt41+NDhVPM/vTZcYdrDoJHw6KIcCi73ujTg4UhWf7NbZD1qstG
	tMku83gyYCPfZifaXJRe20Sku3IlyT5sf6A/bjAgGwUR8Bl6mgW68Cp/C+j2qT6rNL9yjxf+ZUq
	vGKQcqHt5B8Ry2N9MfRVjjfaXPwHqmjn6o7qV5t1TWk8=
X-Received: by 2002:a05:7301:4546:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-3537e033fd4mr12292588eec.9.1791820626099;
        Mon, 12 Oct 2026 08:57:06 -0700 (PDT)
X-Received: by 2002:a05:7301:4546:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-3537e033fd4mr12292555eec.9.1791820625436;
        Mon, 12 Oct 2026 08:57:05 -0700 (PDT)
Received: from [192.168.11.106] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm39386183eec.18.2026.10.12.08.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:57:05 -0700 (PDT)
Message-ID: <193ecf72-5e41-4106-9cd7-8ba287642148@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 21:26:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Kalle Valo <kvalo@qca.qualcomm.com>,
        Michal Kazior
 <michal.kazior@tieto.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Bhagavathi Perumal S <bperumal@codeaurora.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20261003092104.520135-1-yaojiale02@163.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003092104.520135-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: O7z_frg-3Je1PVkO23uwlRuV_ClSbip7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX+8YQFOd8Ag6o
 rZX2ZqnB/LV61rZ1Oulr87TXCN6aPhBvoJEsHfYEpp2HUQKblqntS4NEbOVSLEBUxHXHx8KGqam
 NZ72AWDWI3x2j7QtZWiGY2ldYTG3+Xs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfXw/Dk/LBIz7K+
 oLjDmIQPwnIPtMipGo5ErvIGU3yd3ai9c1aw9Nj/FRCkaEDNdY9AcOsUvnfA+xt7mSG1x0K5DEf
 CZ4dKu7bsRey2A5gTL/bKyGymTnQwrtJL9SZLDnDKaTPyzuYVsm26ymQw5Gg/UirGP+c/JdUiZM
 yy0ISqRcz6DCGUXxzsnVehyQorrHINSVjDrbrTbp6SQ0mrmy12NeK4icctH82zAt04SqSDIWJrQ
 QMWGksKtK9AioQzaYHDkr5zA8SEFUSNTvLuI8a4AynBBRhB3JNuLfvIGdjrqRe3lmNK5jnFZsDf
 DjuqE6MYXy1ExgFzfdEsHqYEr1FUqDLnC6rwq8z0z3VH5BRnpMewjHPQthyD7s70gT4N2KI43Uu
 CYTIf++ygedDww6GyBuSkf33D1lQLD6c26eNtMMAEoEtS/9bR5cMGQwJvPesU6qfnewAE4f3Fel
 1YnFu5mNZeXfTDsBU6Q==
X-Authority-Analysis: v=2.4 cv=GfKCDgXL c=1 sm=1 tr=0 ts=6acd0353 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2dOy96dDxX5ttOVY4VAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: O7z_frg-3Je1PVkO23uwlRuV_ClSbip7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_085708_486312_5FEBDF7C 
X-CRM114-Status: GOOD (  13.48  )
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

On 10/3/2026 2:50 PM, Jiale Yao wrote:
> The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
> the current entry. idr_for_each() retains radix-tree iterator state across
> the callback, so that removal can invalidate the walk.
> 
> Use idr_for_each_entry() in each cleanup path. It performs a fresh
> idr_get_next() lookup for every iteration, allowing the current entry to
> be removed safely before its skb is released. Keeping the existing locked
> removal helpers also ensures that a concurrent TX completion cannot find
> an IDR entry which points to an already freed skb.
> 
> Changes in v2:
> - Rework the ath11k and ath12k pending management TX cleanup patches to
>    remove each IDR entry before freeing its skb, as pointed out by
>    Rameshkumar and Jeff.
> - Use idr_for_each_entry() for the pending cleanup callers instead of
>    leaving freed skb pointers in the IDR until idr_destroy().
> 
> Jiale Yao (5):
>    wifi: ath10k: avoid IDR mutation during TX cleanup
>    wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
>    wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
>    wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
>    wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
> 
>   drivers/net/wireless/ath/ath10k/htt_tx.c |  7 ++++-
>   drivers/net/wireless/ath/ath11k/core.c   |  3 +--
>   drivers/net/wireless/ath/ath11k/mac.c    | 33 ++++++++++++------------
>   drivers/net/wireless/ath/ath11k/mac.h    |  2 +-
>   drivers/net/wireless/ath/ath12k/core.c   |  3 +--
>   drivers/net/wireless/ath/ath12k/mac.c    | 33 ++++++++++++------------
>   drivers/net/wireless/ath/ath12k/mac.h    |  2 +-
>   7 files changed, 44 insertions(+), 39 deletions(-)
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

