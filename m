Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24334F94CD9
	for <ath11k@archiver.kernel.org>; Wed, 22 Apr 2026 07:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsMFhzh9B9P04QQ52S0OECWBliG0c1fRkWxIyLVs8XA=; b=vSkHGB4l4i8DpfRXc2kNnV12Um
	wHlpKL5Zjm3LHC53ANDK6bhWxxFQt1PHExX7AP02F4WCSl4Jsi1qZzWBRzWS7PIDQ6wXADP3Int9r
	74qQYZwUG1SF1qpoQCRw8nJnb2hZhnqUIghCrAKuElwxVz82mb2A6F9bdghpoKTLnzzv9YrOtb+Xp
	6oYaeR/SZr9b2tVqhLEoNdzY4uxhwkLnzEKFPPfelO4ZDn56nPAXvFuvXe5sxJhr9hFzXSnwWsVvh
	W4iiKhOM//qt0JnSTNgU14EJNuhMRIYFJWQv4TblgNkw7qloOagRhcxSxsUGigAoEHRwFIUqTislw
	50fyyeRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRva-00000009ikB-40TP;
	Wed, 22 Apr 2026 07:23:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRvX-00000009ijg-46LU
	for ath11k@lists.infradead.org;
	Wed, 22 Apr 2026 07:23:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5YjIa164470
	for <ath11k@lists.infradead.org>; Wed, 22 Apr 2026 07:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsMFhzh9B9P04QQ52S0OECWBliG0c1fRkWxIyLVs8XA=; b=pIltHJMdN3HD7r2R
	cLYp8qGwpb96c1WnPoNi1S+D7MIVT+WdXbU+U/p7zkDoIESf+uRidspEA9exmfCJ
	4D1YBXa3lQ5+fv//c338B7ox9SGDkTKoab1pnpEnXqiq9mA1n+BDvNLQBAHq20s6
	EbuzFclDYN4eWtb/ZwwC1CgD3Vzs1Ps92cD5OjaF8G8XMTh/XJfTwEr+XPt/r2lR
	qwz/9KmgtxofsTtfsiVk3qF22hT902z7vhff1555rLQaXSdU5WDxS+whx/7urkXE
	9S83QqIBBjGULOZkE7/88l8mm7FeG9wUnSHLECdC0lECX0XxIq0VrSSJajXbstmm
	j6dXkw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhj7ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 22 Apr 2026 07:23:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2ec17dc21so58260235ad.2
        for <ath11k@lists.infradead.org>; Wed, 22 Apr 2026 00:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776842529; x=1777447329; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsMFhzh9B9P04QQ52S0OECWBliG0c1fRkWxIyLVs8XA=;
        b=ZcFlTXq627VvQ2kcf2fkX8DNcw2b5A1C3TZlVthIGm8oRaiGs8sNceW0BTFfMlfssH
         nv+nJKlcBqce8yTmUGVFgBsifLBSBh8Yr/bhKnZ9jR5MTBmfIkRWCJBeiu/fIbcq6h+1
         0MBH6cl46dMmCRS1KjQ6Ic7HRVDcTOOokDFR0H+yhsF7E1D6c919yrJQLDFWMg67RLkM
         jj99H1tjnY3+9+FNoOqBgb3j+zDqQsAxv6+AInFMFJvueK35cIzZ4wsXD8LfkllnX2tr
         IP6v2GUpvCCCUze4T4u978QEoUrO9TCyzOTAnfLhN+eiSi/AkX2H8TQD98CjW8xfI6lt
         qffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776842529; x=1777447329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsMFhzh9B9P04QQ52S0OECWBliG0c1fRkWxIyLVs8XA=;
        b=IM3SBr8RiT6nXKO3F7t9rT+0AsN6sxq5lL2A4Ov8NBbUpM9RT6r8i9L6JYVqDpy8dd
         H7+zXGLkfyqnjE63VCw1qYobXwV6q1iJk58RWwr9cJxX0SQl3berA8Dgr38M6n/zTp+q
         G85gJL2X1NB1CrrMt+O/T+uhz8uY+If+0zkNh0He8Dj2KZ4nVPmd1tOl7Quf8o2QLs8M
         uS+311pcdz/YF3pIZNpPD4MA6FwpbgmD1br1yqVgt0uKI8zKQRb8wUOWe4hA0XFHWw7g
         vk0JCqbPwM67AST0Vp/DWJj2MtSqzXaK52Od4yTW7lwV5n4F56cpdEzYrrQn/8bR5MVD
         LKgw==
X-Forwarded-Encrypted: i=1; AFNElJ9gzYOVSVFMYayQssjLzhQetPWbXMhC+NAti0+NfJxxrpFfqZGOhP38P1wA/RQS3eMsxngWKLU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJwGzZAp6s91ZrO6XO77JX+PMfbAnIkvqQ1iSctD+cnCeH6cZ3
	F03YljcO4NDnCWBq+JI067UzyoNtaqF5VvJgiCOue9oVYcFr+aBxDdKk0KEvewxq5qqUVQFhYG/
	UF0unDIqDTD9JzS4nF1eBLBJ4sg2dv0xU2SK3rRSMou34Cjol4r0/RHqJQClvO9fQ
X-Gm-Gg: AeBDievwCnVs5/gMEd5cl2DkDxhJlOnQPJislKayQl7QU3Fi2gh9gSXd0qbx50M/ekx
	vbuxZcDbHEEnF9cQHLiazrFPhu8o5l13ozqKF1X9oWh28ACAEzBxg8jcTbCFIWlI+3AO4py/Q88
	2umqRPmA/D1VjmTeDTwqL0GeVK3vpG/vJEkpcLB1fQhAl489Q24rJYKnBlMT/F/qeqy5cxZcd6Z
	Bm8bwVtDvhENaquL8BIF0l8o8Jw6zHXoA8jqPM0eq2f9fsgltF3h0m33TS5KFGoNJBYq0lnoLM8
	LuaEza8XEiYhRB8L7ytZ/yT9gLY0EJT20ZL37YHFFzDnbvON/4L4OTSq4vzHPnIyrxDjREUcwJB
	11YdbyAcEQUNkKx1SSI+xgTs+f/HhnjY0wjo7QbyrqGPZMT7+kxfQgtYfIBaB8h4hM2eCPtLF
X-Received: by 2002:a17:903:2c5:b0:2b2:4697:4370 with SMTP id d9443c01a7336-2b5f9e8cac7mr219783455ad.3.1776842528676;
        Wed, 22 Apr 2026 00:22:08 -0700 (PDT)
X-Received: by 2002:a17:903:2c5:b0:2b2:4697:4370 with SMTP id d9443c01a7336-2b5f9e8cac7mr219783075ad.3.1776842528163;
        Wed, 22 Apr 2026 00:22:08 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff409sm195396035ad.14.2026.04.22.00.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 00:22:07 -0700 (PDT)
Message-ID: <afa0f129-d8bc-454e-9e76-88cb097955f6@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:52:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ath11k: fix peer resolution on rx path when peer_id=0
To: Matthew Leach <matthew.leach@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20260417-ath11k-null-peerid-workaround-v3-1-d04302284486@collabora.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260417-ath11k-null-peerid-workaround-v3-1-d04302284486@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GScmPx-EuVyS55L1IutbSAWyWyQy3T1q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA2OCBTYWx0ZWRfXwmLMBSmifNKv
 0jBQWJb7Ed3+F7LrJqw/j+I2oVb6XKLZzE2PW2PQWJsmzuifLlTHRnEGOFI8fLhRCeFbCXJqGxQ
 LGynDq7eBvbas+vlbR14SGIJ+qCsw6LXqQ8+3WMwZS4t57LKZG/bxRt3Ux5LhwpsxE7+XYGUUC2
 YcX9LNaudAErk608aVJOpZainZseLCaa8IklmWcl34FbK5Pbj2D4tLJbrLy340lR+QrviXFHxsI
 hM3xzoCwQVZbRRMkPINQeeP1YrPUrufEpe1zNBQcMIOCC96MZ6pGPUdWtpFE53zSYU2QYtR71ts
 SSFBvSNjyn85Xej5AllUOjqyR00q/nmpAB06D1Rvq2msCMjuf7olwyaDvKwb30704HXuvT3h1hD
 KcTvVL++zGDOyvID3BuG7eNHMgQMWLY+dZc9NssADRoUXXQKMoCpHd9u6l4ZOn0fXNH+Bd2GA3J
 USIWUWqB/8O76I4IYYg==
X-Authority-Analysis: v=2.4 cv=WKJPmHsR c=1 sm=1 tr=0 ts=69e8775f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=i3rc2wEZqLSP7JN4NF4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: GScmPx-EuVyS55L1IutbSAWyWyQy3T1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_002316_146893_9B225745 
X-CRM114-Status: GOOD (  15.96  )
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

On 4/17/2026 4:37 PM, Matthew Leach wrote:
> It has been observed that on certain chipsets a peer can be assigned
> peer_id=0. For reception of non-aggregated MPDUs this is fine as
> ath11k_dp_rx_h_find_peer() has a fallback case where it locates the peer
> based upon the source MAC address. On an aggregated link, the mpdu_start
> header is only populated by hardware on the first sub-MSDU. This causes
> the peer resolution to be skipped for the subsequent MSDUs and the
> encryption type of these frames to be set to an incorrect value,
> resulting in these MSDUs being dropped by ieee80211.
> 
> ath11k_pci 0000:03:00.0: data rx skb 000000002f4b704d len 1534 peer xx:xx:xx:xx:xx:xx 0 ucast sn 3063 he160 rate_idx 9 vht_nss 2 freq 5240 band 1 flag 0x40d1a fcs-err 0 mic-err 0 amsdu-more 0 peer_id 0 first_msdu 1 last_msdu 0
> ath11k_pci 0000:03:00.0: data rx skb 0000000038acd580 len 1534 peer (null) 0 ucast sn 3063 he160 rate_idx 9 vht_nss 2 freq 5240 band 1 flag 0x40d00 fcs-err 0 mic-err 0 amsdu-more 0 peer_id 0 first_msdu 0 last_msdu 1
> 
> Remove the null peer_id checks in ath11k_dp_rx_h_find_peer() and
> ath11k_hal_rx_parse_mon_status_tlv(), allowing peers with an assigned ID
> of 0 to be resolved.
> 

Please add a Fixes: tag, since this addresses a real RX-path bug.
At least the dp_rx.c change seems to trace back to
2167fa606c0f ("ath11k: Add support for RX decapsulation offload").

Please also use the usual wireless subject prefix, e.g.
wifi: ath11k: fix peer resolution on rx path when peer_id=0

It would also be useful to add a Tested-on: tag if this was validated on
affected hardware, as suggested in the ath11k submission guidelines.




