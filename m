Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809B8C44512
	for <ath11k@archiver.kernel.org>; Fri, 17 Jul 2026 02:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VV3mhsSZfLZF2ip/i2sUJrLvReBLbUH7mVtGvO8APxg=; b=todSRw9Wl33cb+9qK62xVqi6rf
	TwKv64pFvFQGBKEYwdegzkX6i3rnKSJRKGTRHV2RJVuoAE+8QlYBDg8ZvX/WmFv09zP8njPa/E3ZV
	YSpTUP7hduHyHPe7m6JfYmDeAxYJ1OlLzGXbP1zCk7sPnHQhIt9SfASfQ53gp0OztyOUpX2nFlGz+
	M2BmqWo5u6woRahQKUj79n7ywatubvNbdGQULiC0S9t23HL3F5P8U/Xi4rIFTpyxAp3va5ceQZysR
	0moUM/3AvcceDimV0O/V62NH+B+K3t7MI3Ngvk+HPNzsKZDLuYU1ieBl6v9c6lO1MslXTsWfunkrz
	3P9Qvzaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXtB-00000000w8L-05is;
	Fri, 17 Jul 2026 02:01:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXt8-00000000w7x-3A4K
	for ath11k@lists.infradead.org;
	Fri, 17 Jul 2026 02:01:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNIhCI4179199
	for <ath11k@lists.infradead.org>; Fri, 17 Jul 2026 02:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VV3mhsSZfLZF2ip/i2sUJrLvReBLbUH7mVtGvO8APxg=; b=E1MOqTeaEa3d2rbf
	WTqTYW6ejEI2xvZIEu+9Fz60OxT5haF2o7aH6fq36g/26bjHGGTytarPjIgVho1e
	sI4iGfbXXOzmyTEVKt8PuewF9RjGKU9/PwHVPTguGtzA9IKC0beHfChFis5MUfcI
	xwHKiHB1wCY+Fl37zjNzE2YuAGzAjUkvQ50Rl3U2dY3XJVDU/binU72D0A9BZcXf
	z07zqLN+1mNFOYtTL2ovjlO5o60B5wX+TWY8bw9Vxxm9uMyK7ByAdyw3h1nWqwFg
	/E1yEyKRl0hq1+WR8VCxS2deRwggtC+c8rWpCLgx1f5iIynChTs+bWBrzuL37S20
	t1rbeA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2t0s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 17 Jul 2026 02:01:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e095fd889so7869164a91.2
        for <ath11k@lists.infradead.org>; Thu, 16 Jul 2026 19:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784253677; x=1784858477; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VV3mhsSZfLZF2ip/i2sUJrLvReBLbUH7mVtGvO8APxg=;
        b=WiOI5a4n6PXNsMNRxgVlPz8PQyQNO6bubTiKrZMWAo3QP8/6LZJhtdZMsL8ZBZ36S1
         f2E345gmdkL+JqY+610WnWFDlU8pGRKg8zpxkYtxw471XYtdRiaG1ftAKfkRjjGQfCVY
         +FKznOrmx6AIj9KO4CAuKqPLqkBZnyhwdqtHoHw4UgrSiHWmXzVjTHyp41wp8lQ7esMt
         5/Xbo2bZ+vgb/4pfCUaufSq7A03EI7YRGBroZhKbeOUDtn1WFPgIr/4oqntxYdDLb7rr
         lf7o5SbXj0W9m9NyBGUMq3fluu4mRzp+Eng2lWInzhy3rX4eJz+cBEOGvZiL4ndm4p6P
         SCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784253677; x=1784858477;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VV3mhsSZfLZF2ip/i2sUJrLvReBLbUH7mVtGvO8APxg=;
        b=gfOmPoqRdyNbkxA3SWM1CRwxBZcLtmGpspGvUG4OGGXy6X9OqkZzFZoWaEv74XSHlB
         P2q/5/Bzy3YI9+8CzgwW3k8e4dxggoIcem9US+oWhcm1gQgOeGSO+53KlEmjjnz4lHgK
         rnSbdinB26/CCpC1CF6e1Y+fOF8sjA2RddTVz2cbKW6+aQTckyYHDkZhnY1hCngnaybS
         h1i8sLNy+58Aw653M2qpJ0tDNoZHdDITXt+ahnsMNKE7aTyg+4yWq3pXCn9KVyalmyPP
         3lHojUv8OuZ9Q8FRFcNmiQk/hDPMvwYRcg0aIQUGsC1ctJMLhf5kvjQdq1FBxqvvTGJF
         tHfA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4ehi0Olu+BJUUF8pzIlx9XNwWdWfgBZdMByfkPazl6E3IHvsp4dS6dUkRUBqBVYPBo5BfiX4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRFvdxW0k1MaMbZI0P+J4HAnZ1mzobW6FdMUpxdSY2lCQ6JEHS
	AykXIv+eAIkQElbCnzDYhbTD+AG/TkM3gynUMTNeAmnP43r0u+j+ZzQhYS8z8XIzU5UlIyTDQZe
	wqPHBYspESgjM8Sha3CAPuU2e3jK6FVRnegvj3zQv1WUTPngvDT/ANTRBrJ95WDLJ
X-Gm-Gg: AfdE7cmWwbZUPNPurjG4y+Qoc8e4KUGQsu3Tr4HtemJGqozdXCotzEkbGHVM/wG2tT2
	m6RObOV5eQO34/LSdZpmMvBzKujO+qeXR7/9BSalhMkKegcfSg85HYKga5xnW0vb1bBjLCmQ5R3
	10H8yawyb1s50NoWo3VfD5a9MeFnTq+zAfT/dZV8S11P0iNIRpkf4OvfieSxLM74TOI1jlHzGKL
	/9z4zHL2wliJ0bGUoEacHr1teJKvwiM7z71ehJ4gDkxV3/4lLUXH2tMSiLa4aaFiLlnUlHejBPV
	w/COwdHxwHaFh5PTy0AJF0bLSVWiQGY4LsDv3rJxkHkVvtWwVBRBW3sEnBlDVmqpc3CPeZ4mIdN
	6rCT4KOdfNA4ytKFHbemKyWDm6iFRa3XhfurIchgylcNyyg1Cox5SSPd+k6EuFU2FzgB3SkWk
X-Received: by 2002:a17:90b:41:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38e4b54614cmr557507a91.23.1784253676688;
        Thu, 16 Jul 2026 19:01:16 -0700 (PDT)
X-Received: by 2002:a17:90b:41:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38e4b54614cmr557457a91.23.1784253676203;
        Thu, 16 Jul 2026 19:01:16 -0700 (PDT)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b0e9c5fsm197848a91.10.2026.07.16.19.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 19:01:15 -0700 (PDT)
Message-ID: <dd40779e-a844-46d6-8189-ed9021fc9c1f@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:01:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath11k: Avoid buffer overread in
 ath11k_wmi_tlv_op_rx()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260716-ath11k_wmi_tlv_op_rx-overread-v1-1-0b972b3f1368@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260716-ath11k_wmi_tlv_op_rx-overread-v1-1-0b972b3f1368@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zYhqRhsGe54SjoZ-kU1gF_Wud1IUCv7-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAxNSBTYWx0ZWRfX4XSL5/PvjLi6
 /gEcY+YuORBjrCt12Cc5G+E5bfO5yKILtIk04I0CL96gZ8BkNpggxsjBoO/ynPTTKBQvT90PI6U
 cXmcGSDy04VFYvDkrzWShwB1yRYcX5o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAxNSBTYWx0ZWRfX8IRYAx+FLaP5
 UeoM5OShHpvNOjaVgEJWF053o3U6xSLDmr5f1MuVu9QaaQbFD/GUzrqHE2YDmaq7RWYaIyw64hX
 avZBERsOkr/GSASL0ATA3Vdn6uzVvpc8sI1G+Du2e2r7IojS1sQ/S2wZUQXRM2BPD143P580m9Q
 Fk9IwGnInmvR/DI3BtX6Hoa6FmlNI7oljwWfcUjFhlh3BtbTgaeZbBu9NtYA3HIeBCh3olMTR2c
 oYVWJVemtkW5HWFyqfX+bn1CDaQ0/SMLpg6BNTs4a1NIDL7eSRm6ARvBOJCYeutAchmi5FDHquQ
 iFujlGl9/3DgJOLjHmrfHG8XByXYdZvSA/r4CHicYeCgZFoaBL2Ju1yus/TElLzDXrXEsasH7gQ
 SDPmTH7clE++XXLQqMifTO5b233Wq1/6qebmo0dz5tfFvTTIEGl7gKRIC1EbjlimByXxXa0Sc0t
 /jtAub5KU7Mo4YRwjOw==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a598ced cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Lj7BFKMBFr4BX5uBSNYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: zYhqRhsGe54SjoZ-kU1gF_Wud1IUCv7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_190118_919080_F8773AD0 
X-CRM114-Status: GOOD (  11.38  )
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



On 7/17/2026 4:01 AM, Jeff Johnson wrote:
> Currently, in ath11k_wmi_tlv_op_rx(), the firmware buffer is read
> without first verifying that the buffer has enough data to hold a
> header. This could result in a buffer overread.
> 
> Add an upfront length check before dereferencing skb->data as a
> wmi_cmd_hdr. The check is placed before the trace_ath11k_wmi_event()
> call to preserve the existing trace semantics (tracing the full raw
> WMI event including the header), unlike the analogous ath12k fix which
> could use skb_pull_data() directly.
> 
> Compile tested only.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

