Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FCAC02197
	for <ath11k@archiver.kernel.org>; Tue,  4 Feb 2025 18:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnDqgeo9uUJiQelPKUM1yyUwM5/dmJVYIC9id6hP2eM=; b=PuaR7adEHUCtGMkeOvyn0wcBYt
	Iihvr42Xpyspibkyev8pj7eDSi/ftGfV9Ps7BGJFoYbx7Ubeg5wDd4FOFJZUkpBj+d+UC8alBwvHS
	gPuA6Tf/QXNikT7lAMz0iyLlf5BPeNcAyah2zUMBiYjZGAzOMQKVQmOfA8hKd4fVN8ogs3xOoppq6
	qQKVUauERtD3mewl2c3u/CRDc6YBW3FmETr4dSu6N3H9ObLlbH7DPet1Y5uXxbu7YXsrh+An8sKP4
	S2wmdDq/FciWS0bNr0L9Sy0pMQkGQUwzLfXm2ROCReu/8ZFcmWwcgxRyU7DHY+HMABPDIMYHcNe7W
	BfQjqPOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNfb-00000001DLt-2CR0;
	Tue, 04 Feb 2025 18:29:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNer-00000001DE5-0DHU
	for ath11k@lists.infradead.org;
	Tue, 04 Feb 2025 18:28:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514G1bTm001689
	for <ath11k@lists.infradead.org>; Tue, 4 Feb 2025 18:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mnDqgeo9uUJiQelPKUM1yyUwM5/dmJVYIC9id6hP2eM=; b=S3XggxeBZDqErNNa
	rZc9RxZlbHnMbFPqVgodr/SbYzgwRcBvRWSBycUPDbVTs/VjerLTSsK8+hfSqvvO
	NkZLzXtxZSxEf/I39R3t13DPxaCyofQty2+sIMYzEPZy1GQ4tEzJ+uIlFxlPY12u
	81zT8OsgJ77eH1j0G3aMaDGNxjn8R1hAELo24aV1MgVviOQ0M/4NLSzucxwLqnte
	glAHKC0nr71UVFyWC/jQil2i3u1+97in1fvAxbELpGoPPCiA+31L4h8f6vB3n8g5
	Gq7q7EWYHKC6WO5Z76OhCZbN5oZ+duH5yyXg0Q3Y9QNLDnDX6LU7TwP6ot8uYicR
	LTShZg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kffnhfnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 04 Feb 2025 18:28:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21dcc9f3c8aso91778615ad.3
        for <ath11k@lists.infradead.org>; Tue, 04 Feb 2025 10:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738693703; x=1739298503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mnDqgeo9uUJiQelPKUM1yyUwM5/dmJVYIC9id6hP2eM=;
        b=PeFE+10DKcgWhv2mXGlNNjm68TsLmzgoO+KIFUJMbkTMsIMpcI59HNe96QYuSCwRxK
         vAJrmJ4cQ44d4Gh1bL8CZPTIl359Z5fVoDKE1vCYn2hoCGhQI3TRFsTPzEWz01ryWhed
         IjfIQ85cg2jjP3dI707QaK+LdZlcIHFlOxxu948A4v0d4lJLtnifjdXRNHFm03OBpwwK
         9gUmNnqgFsHwDEHjlftv3VdO3vCzny70M8cHpwyssoCbsQvR6B2dWcDnJG9LguSPa2dv
         0i4ZKb16e5bb/QBDcfs1kI6a7uJECx7t9zU4CqbpJc91WgeLkjJx2o/wAKTy9o1pbxqr
         l6Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXx3nlL6e733YSJVv6Edc6ASeaUiTTztn4101ZqNTuMiWeD1ag/HM2cuRR4wjHonJSvPpzi/XM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/gVv53NQtYlj4j0Zxxg2gBoWkrqnhMXOF9n55AHEU3qeOg01W
	MzMjIVyoSDG8VYuHG9NNBWlY5CV4DUSDkoWbq3cvnnXNGmxcvfxXYTUVrx9ueeaBnoT2/EpjJuR
	6uJxKQEKjnDIIJwWyC4Vxka86v+w56xqBztym3DBnG8BBTwK+XJuaFv4hOaEL
X-Gm-Gg: ASbGncsaSvMWdUeIZn56By8B9sjkJ2UwVzlH3ZeC3kV3tN8yRDgB6VhwcDnKpqCk3ey
	AvVGW7TSAHt/u2V9ItdGT6XD7G44qjaFquGnQDBmN+n1Tp54dPow36um3D/l0vZJLUGEcpvZnmw
	z3GYCudemFCaxjhZrp4BmuKqqIKt6t/EmL6gSuDFiLaVcLwOmjVq3E+/KIOdMiNHUjBRL8aA3Mi
	lk5Dl9L3fnlAvQik16UuqW9wZK+2geKhEzMjqslHAxTnFx9cOMSNu0MJcPx1RsX5hVE0DS6Gu7V
	bZLvFy18fnvxJAfiUfevEhABrd5DqSzR599yJcAx9FCKJrbofVfOgD1mLjo3UQ==
X-Received: by 2002:a17:902:c409:b0:215:5935:7eef with SMTP id d9443c01a7336-21dd7d78cafmr447489415ad.22.1738693703145;
        Tue, 04 Feb 2025 10:28:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWfHpkj5rPvOMiaCxTkUUngfXcOxXuZuG9TuF99jRCZHmEMKHu4h4bQdbh48P+jn6RklMqtQ==
X-Received: by 2002:a17:902:c409:b0:215:5935:7eef with SMTP id d9443c01a7336-21dd7d78cafmr447489045ad.22.1738693702763;
        Tue, 04 Feb 2025 10:28:22 -0800 (PST)
Received: from [10.227.89.219] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bfdb81bsm13773004a91.49.2025.02.04.10.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 10:28:22 -0800 (PST)
Message-ID: <a4809256-5806-4e1c-a12c-d5d2a6c0be44@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 10:28:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] wifi: ath11k: pass tx arvif for MBSSID and EMA
 beacon generation
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
 <20250203214448.1978156-3-aloka.dixit@oss.qualcomm.com>
 <db16febb-a58e-4a60-ab1a-212c30fb5313@oss.qualcomm.com>
Content-Language: en-US
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <db16febb-a58e-4a60-ab1a-212c30fb5313@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: v_Up6QlBNllXBpAWI0wWIgld-qHTBucd
X-Proofpoint-ORIG-GUID: v_Up6QlBNllXBpAWI0wWIgld-qHTBucd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 mlxlogscore=743 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_102825_116516_672E46B8 
X-CRM114-Status: GOOD (  12.17  )
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

On 2/3/2025 8:41 PM, Aditya Kumar Singh wrote:
> On 2/4/25 03:14, Aloka Dixit wrote:
>> Function ath11k_mac_setup_bcn_tmpl() retrieves tx_arvif only for
>> a sanity check and then calls ath11k_mac_setup_bcn_tmpl_mbssid()
>> or ath11k_mac_setup_bcn_tmpl_ema() both of which again retrieve
>> the same pointer. Instead store the pointer and pass it to the
>> latter two functions.
>>
> 
> Same, Is this tested? Perhaps you forgot to add "Tested-on:" tag?
> 
>> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
>> ---
> 
> 

No, only ath12k patches are tested hence no tag here for ath11k.
This patch doesn't change handling functionally and I confirmed that all 
places using 'tx_arvif' first do NULL check because the refactored 
function can return NULL. Functions ath11k_mac_setup_bcn_tmpl_mbssid() 
and ath11k_mac_setup_bcn_tmpl_ema() always receive a non-NULL value now 
because the caller ath11k_mac_setup_bcn_tmpl() sets 'tx_arvif = arvif' 
whenever applicable.

