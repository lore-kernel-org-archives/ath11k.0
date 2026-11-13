Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7276606B375
	for <ath11k@archiver.kernel.org>; Fri, 13 Nov 2026 18:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UFqPeDrq;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C+cBIRvS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ey+1Il4T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bdPwvW1k6EwZBKyeXaX5G0pPP/JDCE9kBeczaNyCHcs=; b=UFqPeDrqVNhBtl
	aQXqRDnPZD23nC+O+HmbTglhB7QTMDhG3wiJTcmAGaFJXunaiMKuBiaitC7vS3j7kRydrxJYtxbJC
	Kfk8QCV4HZ341anfYZ1gnm6rRrHVTkQRLc7mpLeJhGMbBeP3INvM2fDQNsEDzyo0WohvDl9xRoef6
	UoU3+vBmKbVpEckxwcYSkAJ1YlauiNnrCR6jcW9ue9uK/BaY73v95IM/w0fp0ex0M3ufbcP2aIL9S
	zBuJizRQOxh815Z+7+84oXFMCtsAneR28Ld709+jF9LyLm8qMe77hC6WXqRVXp3qa3e90HR50baIO
	K7Q936lee9Sf5dXHWVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwQy-0000000E2cA-0M36;
	Fri, 13 Nov 2026 18:55:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwQl-0000000E2Xg-2d16
	for ath11k@lists.infradead.org;
	Fri, 13 Nov 2026 18:55:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQp3A074615
	for <ath11k@lists.infradead.org>; Fri, 13 Nov 2026 18:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bdPwvW1k6EwZBKyeXaX5G0pPP/JDCE9kBeczaNyCHcs=; b=C+cBIRvSaqDUF3L4
	ReZv7t9bjfGKXoNLE7GVOKof3PhMZfKpDZeV5rcihTts1ZwGaWvLCUHIzGZOEmFs
	b18YgMlyzdJ7pCrMscmqer9313Kg1RozSqdaLJ4Qj0e7BmyJ+TZSBWh/TORi/YFI
	UjtGakuvm4GWxp7aUBMZIWroIb2atPMmpAIzyWbN2P769tGzfUZSKaF1i+pnLsLl
	IQmt79HNWULC4yGXZB4eWSupvNBufWY4DmmvhwpLdeYV4kkDPodUwEbbhiNGZdp/
	9Lr8SWUm1Uxe8MntKszFWGjiuLv0NdiaEdhFjz4Ugr02lDL3KxEhHJNTBxIVSgfQ
	VFpGTA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mu4c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 13 Nov 2026 18:55:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so1941605eec.1
        for <ath11k@lists.infradead.org>; Fri, 13 Nov 2026 10:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596122; x=1795200922; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdPwvW1k6EwZBKyeXaX5G0pPP/JDCE9kBeczaNyCHcs=;
        b=Ey+1Il4TVM0ClhEXwPvqoSz70SMeWHN3mpnxaCUTmKHrX5t+zl74rJEoOU0L1eiv9C
         LWagOMBKClw517KZUI7P1ZD8u0fZuZ6CuOYRsZo2QWzXEHTgJ5DCqKrF9TJkAmbB+V8L
         ShwMAu2yrpXspUUPRjJ/J42p7BEOj+l1WFBfDmwVg3TQN9qWqBJ585E6IbFmnTOE7eK0
         8ohiMmUKNVdkk6utkhGT3bRdhGcdRtjlTm43oIbT6aMahK62eGuwRheT8SI4gGiGSWzp
         t8NdHC2qYTPtcivm8ta6/Fi2MNK9MFygZtKFWhlDXKG1cXm+ASOozautm8YVAyyvuEGX
         vOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596122; x=1795200922;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bdPwvW1k6EwZBKyeXaX5G0pPP/JDCE9kBeczaNyCHcs=;
        b=plN90Cux5k5Kv76BS+eoJIqgwHJ/T7JUKNnFrMnY0xH0TacD6emRyx75jvev7Q3oUZ
         D9Px7CssRdNrhi1vO5/AAHdW9AAxuNFo7MlmG5iK8JtBTQblIEZ0qEYLDv1HuO6RQefA
         9ikOakteSdhWF15sgh0G308NHUzYZqXZmnFK07DjjkHL13CRDL+3GohhzQAOoN+at/KT
         xGyn3I4lYCkqE2iDtGtUN/tI1U63Z/1rTXPu2soggEyf0yzDjqkHovq28UAc+bbi43Ft
         eLsMO10O4ONlhIrkfX7kbWRFeVnF2hmTxvGYN7n3NIczWUStn8lOPfPwMEw2aSlaSUWC
         Bk8g==
X-Forwarded-Encrypted: i=1; AL+hErE61mEc8p/v4pTt6BkSzTfp8liMuHWkqQKt/MRVhjMFtn7BIAmODIFqx4TXjRh/E1Blc6tZ1Xg=@lists.infradead.org
X-Gm-Message-State: APuU4Z99w3+Zj9HbLTLv9veEzB4cbb6xN/grJI1aQymSrnmk1N7oSTMj
	hcwLxajYqHwT9+LelNDSoDNfl8aFpvFUDAowj1KWNbA9psLTFcQwf0j1JqdWxVTL4bfeh2/bf2g
	PC8wqlGF9hNC3DwwdnGWOksiefnE54Fdwb61jzK+KrTI3ScsA8bYuUDRmPyNRM4K8
X-Gm-Gg: AYBFou1SXgUhl0CJTR7w8uwPJ4Jb0yvCRILo8tabdVxIHl8fnnuh3LxCkc1fdems9lz
	5tkb2wc4qxvovN/i9EqkxbDWWLmOQ0YY3x7dNlpgnkqL5j0eVMRm7Z+4xn/QIzd4PQtrkRPcPhx
	gGYJZrO6vOrL9fSM6YebTHCR+kJ7lyXWKQj7PyDgIvWI/pv/BxY+ll0413sdn271aSkdZUkew4n
	P9bhdx6BePb8nLTKyboJzl8w2jYpxcrDy1UZqgRPtCSwE9Zwlc2Sf3JsJJwmYqVJcIj+AqHL5r0
	3zeXl9qrX0XVeCMeqxaWd5n8+sqDwxDgtAZQo47D3vtdQRybcGDagfWY3Fjo7Phv5rfErZiGbxC
	Rui1zc3/J+q7803oypdPICCtOAHfceeP9tGOYdMZVDjNGwNUXXfYWqhgWqQ6Ews1z+oP+FQS86G
	1LCNBSZw5VmkrF+izf
X-Received: by 2002:a05:693c:83c3:20b0:377:678:231b with SMTP id 5a478bee46e88-37966a591dfmr3191972eec.25.1794596121594;
        Fri, 13 Nov 2026 10:55:21 -0800 (PST)
X-Received: by 2002:a05:693c:83c3:20b0:377:678:231b with SMTP id 5a478bee46e88-37966a591dfmr3191946eec.25.1794596120993;
        Fri, 13 Nov 2026 10:55:20 -0800 (PST)
Received: from [192.168.11.102] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm17585787eec.20.2026.11.13.10.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:55:20 -0800 (PST)
Message-ID: <03e7af46-7fcd-445e-9210-395bbb8b5410@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:25:16 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] wifi: ath: simplify copying a peer's PPE
 thresholds
To: christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20261110-ath-peer-ppe-thres-loop-v2-0-fced87507920@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261110-ath-peer-ppe-thres-loop-v2-0-fced87507920@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2swTsOMNKBe7BoJWkK7lK7ZJrGRn9_zH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX6+4FYjYB9Nu2
 16mX2leKLz/SVNH+Q8yKOdc2d1pFrRzjvYzDz+IEuHGv/WxJMV2aIPbymDl72319UUVfIlB6l0j
 bueJ+zyziO8bN20oqa2pg1Kg150t7eJhe0NZBFacMm2FZHKIUXOgWVBVaoX5GdzKnhzR8WuBmfk
 lOX7AU6wmT7PVpQLiekWau7qNOa7HUDgwE97G6ISxMM/ciRQiPN1U0PDqRRl/6YrtuRpmFsi8eu
 tQtcuO46E44o+T53xczGY8P+VOoeP+yHPS53xV1hCcRRURjnfv/smC7LZXzkJcgeCaIqkLX1V6X
 jYj/EZiUFBpqXjIXcuG0Xk0YRq7Mei/P3/ap4okzOG3Jnuhrf6XfopcPbXVb2YnUO65z3VJq1V2
 b5fjfN21lRSlKsZpCByvNa/Is69IJkcJtZu91xQ1VXEgNoLsbGWXq8B6BPlyKLgcxhzULdUCoeO
 7sEIiFJLMR1pXN8KMOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX+H6O0+QhrR/2
 JWa/34/8nFZ2QIx97H9QSSaUJIPCVPM0WgJ2GJ3bdINwJp9Lk0Q8FJKQC7fZK7a7v9YF8T8nVUp
 4HHC908cN76oI+FPayjGchRJ4JByVsk=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af75d1a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=_siAQXIdv8hbVOeHdhMA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 2swTsOMNKBe7BoJWkK7lK7ZJrGRn9_zH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105523_682780_28D9BFB0 
X-CRM114-Status: GOOD (  16.43  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/2026 8:07 PM, Christopher Griffin via B4 Relay wrote:
> Rameshkumar suggested this while reviewing the PPE threshold bit-order
> fix [1]: the loop that copies a peer's PPE thresholds into the WMI
> layout shifts each bit in from the top, where it can put it in place.
> ath11k and ath12k carry the same loop, so one patch each. No functional
> change; the patches don't depend on the bit-order series.
> 
> Compile tested only (W=1, both drivers). A userspace copy of the old
> and the new loop gives the same output for every 6-bit value in every
> RU slot.
> 
> The patches, this letter and that test were written with Claude, an AI
> coding assistant.
> 
> [1] https://lore.kernel.org/all/b60c4c56-483b-406e-92ab-643b0fdf2dc8@oss.qualcomm.com/
> 
> ---
> Changes in v2:
> - Dropped the paragraph about the equivalence test from both changelogs
>    (Rameshkumar).
> - Kept the one-line note on AI use in the changelogs:
>    Documentation/process/generated-content.rst asks for it in changelogs
>    and cover letters.
> - Rebased on ath-next.
> - Link to v1: https://patch.msgid.link/20261106-ath-peer-ppe-thres-loop-v1-0-f6bb5fe9ffb3@gmail.com
> 
> ---
> Christopher Griffin (2):
>        wifi: ath11k: simplify copying a peer's PPE thresholds
>        wifi: ath12k: simplify copying a peer's PPE thresholds
> 
>   drivers/net/wireless/ath/ath11k/mac.c | 3 +--
>   drivers/net/wireless/ath/ath12k/mac.c | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> ---
> base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
> change-id: 20261106-ath-peer-ppe-thres-loop-ce5c2b2e68e1
> 
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

