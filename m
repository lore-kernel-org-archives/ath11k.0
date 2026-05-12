Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614FFCD37BE
	for <ath11k@archiver.kernel.org>; Tue, 12 May 2026 03:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LcGKsBWnDz5XCQZOm9zW7vWC0qVrq2TSrnS/NYguLM=; b=3MEzKbY22V1jke+x3wTSJRvVTH
	1ymyMPWM1T1tpMuIUJ/tplYq5ZU+vLedKLB4N5XdBpY5KlcQSCYjYOTPUlBFVRcdp0uEk2sZJhmAp
	mOfBgp083McOF84xEgaLiHw/fPpDH8/xEnpBLwIZiDbwFA6QaHqmrqwPVlYKafC1GsKlA7sWm01hO
	uU82zzLXdaIAhnucDgzCR7R5tLxqP+atgJo0aO/HQSwKrF03raCYAnPD2+B9Up+b0xiju1qlaSgpe
	VLT/igLf9GN9jKv9m7cXTMFqZANaNZFlA9Rf7KGIW3GlBjZBrWw3e2XuDT1JBXh1jnUX6d4cE0kR1
	EHfrSuEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMe3M-0000000FOlU-1FjX;
	Tue, 12 May 2026 03:45:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMe3I-0000000FOkp-29yo
	for ath11k@lists.infradead.org;
	Tue, 12 May 2026 03:45:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6s4a2804232
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 03:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8LcGKsBWnDz5XCQZOm9zW7vWC0qVrq2TSrnS/NYguLM=; b=ipK20JMmepJ/AolU
	OBSuWlCmffWQnpDRlDjswoYK2laHLwLUpL9Zq1RQJxrthc5ZUJ5q/5i0HZO4OXtr
	YeEZAR9hMdBGZKW3qTkPS9GIRolSYuQxVKtEalo68xaiGEmnn+BDyrQSS3PRT+bP
	wIh+fQLDKwWL/rE28PGddtvHTqgLXvvHo0R+diXlYf4D8OcJYDQNlVc08dAYZ57v
	n0it/f8FN0ke+IXFsPAh7skdwUxGBuj9p3qw+8UMCA1metYwX8Q3wK0xukAfAaWv
	D/oGK3yUInOzFJVf+dt0ps21GwTUKqlZPHl5rU34X4f++n/J24pvYmdBOzlLqm10
	J3VhnQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv39b1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 03:44:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc6899bfb1so35763725ad.2
        for <ath11k@lists.infradead.org>; Mon, 11 May 2026 20:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778557498; x=1779162298; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8LcGKsBWnDz5XCQZOm9zW7vWC0qVrq2TSrnS/NYguLM=;
        b=D/sr1fySjAmGW1V6rhHZqM3OMpF6ujFK0F+V2qMslBBzL/43ZVWgu1cnTMJqSs51Y0
         AD0JVZHBZM7W6ty959XXVysN7mbKG9yJ79A1VH0s6W/oZawt6WTNp6yn6i45Gmr6Gmjp
         +erbk7Q+ahkrPB1RAhyu+mnB9/8xutx7mG8IAcm7jMXuujEr5ru47av0P7osrR3acbTc
         IaEAOLhInfuTIOqk0pDTb7PgEpUitVV0A9/VPTTxpp4HAVqsLl/OpQsYNZZbsDFC/dCX
         p742+ssnn6d1LhslCb/halFHRK6AMbN9H3/zy/R316DrLjpJowz10qUQcDveBm8d6lGD
         y8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778557498; x=1779162298;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8LcGKsBWnDz5XCQZOm9zW7vWC0qVrq2TSrnS/NYguLM=;
        b=VVxzEnaKiGDmRMpG5jbiRvLUmmjsqrNp673c788lgfVe0TinOCynkDcQOQyi3xLZCp
         qPuPhawBU3qBgNB4kEb4djddfNI1UPQFmw/LHXxp8iur/PEolOz9wWFuRlyO+bnJ2WDu
         TsLYmqez2Fqx4Dxc2w130yWgFW6Hn5AT7zbg61qrsWCaBZYCRfz/w1N5gF29f5aW/DpV
         mafCzX4qecA4TpXToTZY/EQVpb48u4041xY/ATR2mKkKmqF+gNqdzIEQKS0RNSMtuRYD
         /TaTj0telbLy8DtyIGhfy8lbvuzt3e2WOI6HwcsoHumx6teBNoOmGXYF85v+AqSvtBkV
         rb8g==
X-Forwarded-Encrypted: i=1; AFNElJ9ol+cj8qUXZztYD49/PIX2cd5hYP6R/XE69Kfh511fa1wLoRe2CB6U/fS1UCaT+rEc2R77hoI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuJl2MZESap8tTkNZnKxlqxA2OueiJviBnrvxBDbJubR5nHqH5
	wPnp5qcFEhzGB1N9oaVsJtZF7wJ/DaFWSeJXhPZLdqvJ3QzjYO+ThaA9EZFEVTMoDEGzbZ+/T2y
	89KEMC9m4+/wxsvtfhD6CZT2FPbfBnYiJ+scu4Fg0J4XXM9I4cwGuzely0k4lE2Ry
X-Gm-Gg: Acq92OGYBCE6r0kggjPYxVKfjQLzfgvYpdsdkKC49aCLgwU5WkpkEvZIGuYjMjIPicQ
	Sn6UxtBpZuugJFkIm0uaaOYFeiTTyzC2usqHRPC1nto8XGt7sdSu0kaEptRfLi85ROdlTYyNy5G
	uM1mKM3fsohMKHXfRzNqjSG2UP8p5wKyYYfVWNLMaeTFkN4BxN1rYUpRRIPSrzwaasEq1phQx9R
	DgQ6zEEPZD5FaxAiFgbnyCyYqBZwkW+BTJ0j4k+hJ2CjvKkxuaFCAMLCMSgh+nQZbELRbvKH+Ew
	NMT0vLQkoVWwHAn5V3c6mV0BPct+QAOVpXR+nzORcg9Lxa3NsOp5iUzFAHvmB8KhuSWpltfwsky
	IrshmhlvJLjyCUrsIrn27V2FJ2GlNBkmvx6DDziYYPJwm72pbSvgf7ufO0ZqbliyzbMAentcGkY
	CGEHVqq/0eJeS/36qiCg8=
X-Received: by 2002:a17:903:3c6d:b0:2bc:b80f:6782 with SMTP id d9443c01a7336-2bd0110f01dmr15833535ad.11.1778557498101;
        Mon, 11 May 2026 20:44:58 -0700 (PDT)
X-Received: by 2002:a17:903:3c6d:b0:2bc:b80f:6782 with SMTP id d9443c01a7336-2bd0110f01dmr15833115ad.11.1778557497569;
        Mon, 11 May 2026 20:44:57 -0700 (PDT)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e847d0sm114977145ad.62.2026.05.11.20.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 20:44:57 -0700 (PDT)
Message-ID: <ffc197a7-b9bf-440b-9a0e-1753034d8334@oss.qualcomm.com>
Date: Tue, 12 May 2026 11:44:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: ath11k: fix peer resolution on rx path when
 peer_id=0
To: Praneesh P <praneesh.p@oss.qualcomm.com>,
        Matthew Leach <matthew.leach@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20260424-ath11k-null-peerid-workaround-v4-1-252b224d3cf6@collabora.com>
 <530a9e0b-ae5e-48ae-a2c8-73152e2dd6df@oss.qualcomm.com>
 <e248e911-d317-41ee-a590-1385c39ee2e1@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e248e911-d317-41ee-a590-1385c39ee2e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzMSBTYWx0ZWRfXxAlPOaBqXL1G
 Oqfjsqco5mgsPaeC62Lt+BTi+8xl9ZMyOr7MRfGUd8TGQTiIlxHEHfPaaaz/nIKQ7vYU+pq3lK3
 v2YdH9XwC3sn0P7GqXzr8i+xujsDUyMmlGa5DSZBLYrO7ld4JbsZ4TbtIxAz7n3uv1K+N5arhhs
 PclxW/xFswN7HMKIrD+9XjWeJN8/yZqVOLiP//4rgI1cxiRwmjVd9++RmxxoaW9uvB8qCCt7LVg
 rAS673AsfJczg6r1WSj5IueU8d7ANnBzz8FSKZ6xYD3C2lKp2w6pvGPXIUKuke7Ae4jJMABJ/Zs
 9n3xOi8jsF7P38I5maJq0ZdqiAyZtmxTGBwJ4moi6daaLWYYCO4khyq8HHqvibFHt1xsB3YQR4/
 sZK9y+JMM0n3mResZ+yLKPkVk19gGs/OBAbGFDqEJIPTCk/P5Qn2uPKyRGypNm8OTsa43i7tko5
 UCMncNwE6mjzgyM0rEQ==
X-Authority-Analysis: v=2.4 cv=Kvp9H2WN c=1 sm=1 tr=0 ts=6a02a23b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Vmrqkdg0PNoj9Cys2bsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: YbZsMEnmmciU1xmIEJloLfEVgn4hXtrt
X-Proofpoint-GUID: YbZsMEnmmciU1xmIEJloLfEVgn4hXtrt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_204500_682216_3B96E7AA 
X-CRM114-Status: GOOD (  13.42  )
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



On 4/29/2026 6:47 PM, Praneesh P wrote:
> 
> On 4/29/2026 1:06 PM, Baochen Qiang wrote:
>>
>> On 4/24/2026 5:50 PM, Matthew Leach wrote:
>>> It has been observed that on certain chipsets a peer can be assigned
>>> peer_id=0. For reception of non-aggregated MPDUs this is fine as
>>> ath11k_dp_rx_h_find_peer() has a fallback case where it locates the peer
>>> based upon the source MAC address. On an aggregated link, the mpdu_start
>>> header is only populated by hardware on the first sub-MSDU. This causes
>>> the peer resolution to be skipped for the subsequent MSDUs and the
>>> encryption type of these frames to be set to an incorrect value,
>>> resulting in these MSDUs being dropped by ieee80211.
>>>
>>> ath11k_pci 0000:03:00.0: data rx skb 000000002f4b704d len 1534 peer xx:xx:xx:xx:xx:xx 0
>>> ucast sn 3063 he160 rate_idx 9 vht_nss 2 freq 5240 band 1 flag 0x40d1a fcs-err 0 mic-
>>> err 0 amsdu-more 0 peer_id 0 first_msdu 1 last_msdu 0
>>> ath11k_pci 0000:03:00.0: data rx skb 0000000038acd580 len 1534 peer (null) 0 ucast sn
>>> 3063 he160 rate_idx 9 vht_nss 2 freq 5240 band 1 flag 0x40d00 fcs-err 0 mic-err 0
>>> amsdu-more 0 peer_id 0 first_msdu 0 last_msdu 1
>>>
>>> Remove the null peer_id checks in ath11k_dp_rx_h_find_peer() and
>>> ath11k_hal_rx_parse_mon_status_tlv(), allowing peers with an assigned ID
>>> of 0 to be resolved.
>>>
>>> Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
>>> Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.9
>> Tested-on: is not an official tag but is ath driver specific, so generally it is put above
>> all official tags:
>>
>> Tested-on: ...
>> <blank line>
>> Fixes: ...
>> s-o-b: ...
>>
>> But since this is trivial I think Jeff can make the change when he merges it, so no need
>> to respin just for it.
> For QCN9074, IPQ8074, IPQ5018 and IPQ6018, Peer_id 0 is not a expected value. Like ath12k,
> it is better to handle it through hw_params.

ath12k takes the same way as used in this patch:

https://lore.kernel.org/all/20260512025732.1297849-1-hangtian.zhu@oss.qualcomm.com/

