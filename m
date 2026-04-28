Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE7FFF8867
	for <ath11k@archiver.kernel.org>; Tue, 28 Apr 2026 02:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPzxcDFXiWrzals8bQN+wr9M8M/HVCUe6SSz/woMcQk=; b=Cg5gPejMCu9CqFJRovGjWCYis1
	TTbraIWcE+JyA6k+im9QuQvOdw4pNxqEMZHbUk16pLdkDGeETAUjM+Amr1zGssoKNPppslg3vg961
	xn5EW+IaTlr4Pmr+NTntCWPgkkRHlXMVggK46VYL1NBPPsaZXr9FEqpx+PNBUow/3yEKtJd+LpVUY
	6sKp+Ei+68lOYo7tyF6Lujf2yiu1VMPIIuaA2HauzAlJIAzuaryA4gKw0RkDBDLtviNXvCmYKHB0D
	CPV/iVHpBy4NyZxM4m9mjZUNqZmexWHLDL6PcA6QHwtSNPdHG208uuyOlLc0HKayveAsmGyWWrXqN
	e+GGkk4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYBs-00000000Rkl-3qnM;
	Tue, 28 Apr 2026 02:28:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYBr-00000000RkL-1CKX
	for ath11k@lists.infradead.org;
	Tue, 28 Apr 2026 02:28:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S03QO6440983
	for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 02:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VPzxcDFXiWrzals8bQN+wr9M8M/HVCUe6SSz/woMcQk=; b=h3aSYlytsmDR/39V
	+6ytcNIFPZujdq0Wb9bC47o0MwcyGknAGminCRam3kpnmk6J9NQMYp6e4WSMqjEL
	xbJ2h3RyCHdXIVjafoqhk2HnWnb1dJFovlMPlQE1v386PS0/UG9Nbn1Vi4fIioE5
	UpUOphmEOn/OsGfgHS+9zaFVmC4JEoAg1mAzkMYQAxGTw8k7xr3jf7Bhd+ooTzOu
	fsmUnTl/Bwg4UBH6h15HggCtIKTX2e+kitTw6qB1rHkdFaNOMa7WYUOjryLs6VDE
	D2JIIwkJpHpF/huPj2zDE8SSPzHayR9KgbDurFjJAODLTm2+oPtqwuXo0k4P9O0P
	6YQoBg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac42733-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 02:28:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f70ae35c0so5607737b3a.2
        for <ath11k@lists.infradead.org>; Mon, 27 Apr 2026 19:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777343326; x=1777948126; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VPzxcDFXiWrzals8bQN+wr9M8M/HVCUe6SSz/woMcQk=;
        b=Itk9WnxAb6xmLd+9iRZm/1thLmZuOeN4cNgGk4wYSE3Hm6vJnFsQoAapd4A2GdOcs9
         v226k9KNoL8Bjn9DIz74x1U1HzkPvO/uswakcK8cWhzZmcvn7yEbVTwnnWQzr8xvTGAL
         zcGoo4TwJ1OrNCRslHMN2+g+iTpqWrpAdiOmjzHxexWd9s8FXYCmK2DbxXi6awAisMzh
         HipXiVySsTE5nnymcOvPc05Wn0CpG6EXz8AK1yIiG/LE2Du+Bn+aKniYwGAGbDom67ex
         lsqJqH1rFHHX7QMhTrTiE04G9WBFKCS5q/OEvKbeVOavo2ai8sjSiS0/6rAyMh944Pdv
         vtzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777343326; x=1777948126;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPzxcDFXiWrzals8bQN+wr9M8M/HVCUe6SSz/woMcQk=;
        b=SxlVSjX8vRcDA7aeDZDqdEREtWQtR5S+RwN+PyYZ+LokHwX8Kw7MPwcvYCFLLsOFGp
         JuTKKZ/+G+aXCfkPtizCo4svV0UGyF/HxCHUSBB3z1nnPmdkWcPiENlJPIPka4CljusX
         mPjGYR/dTX8O1WY9HpjxP63OI4apXVVxZaCQRP+HQxSKmBFP5qV40UoDMP6vWGg0+jil
         iD31HsWrhUWCA8xGTxDVBj52RrVEW107/R0YPd7ZHV6Dk9G6hVUDqhpwui9LHKNrZR9r
         +hGwDWi658F6mL/Q4dRlLiPAcfRn31XJmxYwi1TjZIYGHCEk5cAhMNzXsYzfCnkmXRUm
         rchA==
X-Forwarded-Encrypted: i=1; AFNElJ8Boy6yVdTNX0peI1WEHPeXpvsy75UG5uCSAbjiPaF5AfsFhJledtQvTLRDawGJFSWgQCjshio=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv1kPVq/NU+WtJbnQya+sC8NmsDD8brea5a+ss/KXieIejWYaU
	aPdHfl8Ywu3s+AVsu86DwovIE5jHGKhyybOss57mEP0FjGRB9sHQldD3mlUIvQpRn4Fv4ReGeWh
	lc78YD84WyRQnKMjogjy5pek6JaRO4AjYZ6XKdeTvPFFEr+LTV76ZAbkmjPGffhso
X-Gm-Gg: AeBDieuQqmatVTMcGeC0imqlOw9R/A6Gc6O58iUJzqOtq//29bF6sZByiIcNbZ01T2n
	0+7BeLFx2dvMJUTj4koHgnEldIfRrGp0iphqKQuYnXlpK7aYZS6c61llEsjjrJVuD5cwE937/Jv
	DJonpb9BqXsD/QTNEEnMazhjQARr9PNFkW5/p6dhDd1IDZhc+Tr0SanFv+9NiK3MddF4vqH0oqj
	fIk//Tktpu901qfCv1HpMEnsoU8O1NH1Se3seRf3sPlRO6y4ZBglFCunZ4UpauTJcnjUA/6E9lh
	sdT1dMkrmC8MyvPQxyTG8eBktr6krXxBCMUrkIi8jPxQUddM6KB2HN2JMaF0d6vWjc2dUpxP83O
	rhdB2+/dL1obcjJpz8ua3+GyH0MrM21UUWbqPgETFSgBgFLz+UAsxihr0V/s8/fga8HxwfzJI7Q
	ppaj7vNgCc6QvWQ3OukhFgPB7sy0Kgtw==
X-Received: by 2002:a05:6a00:6c83:b0:82c:ae0e:dea with SMTP id d2e1a72fcca58-834ddb9f511mr1033692b3a.32.1777343325937;
        Mon, 27 Apr 2026 19:28:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c83:b0:82c:ae0e:dea with SMTP id d2e1a72fcca58-834ddb9f511mr1033664b3a.32.1777343325496;
        Mon, 27 Apr 2026 19:28:45 -0700 (PDT)
Received: from [10.133.33.153] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf5705fsm930726b3a.42.2026.04.27.19.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 19:28:45 -0700 (PDT)
Message-ID: <c0d2b6df-4109-4c93-b229-7eb2d3fca6a7@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 10:28:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix warning when unbinding
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260420110130.509670-1-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260420110130.509670-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NjX3ByJKHxFeywf0VNu3JUX1GpmXrNf-
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f01b5e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=oU0rmw-L0ToDbzm52QUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: NjX3ByJKHxFeywf0VNu3JUX1GpmXrNf-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAyMSBTYWx0ZWRfX9NfP2vtanM/W
 oEBvCo1/0C6kFLJHVRTHdnndgwNiUgZWO8UgAkpgQU7Ln0UX/TAFmyWuK0IGUqwnrWU6lf5lPbw
 c0ro51EKLUHH8h406+RjqpR9OnmUr7wnGbF83kIpdhzUZQlBdZMPA1/gYUHFiXJjHPsZS+i/QN/
 s3V0SD6eTeiJT7HMSnFF+Zp/ADd/OZnnlOpyitYSCVXIR9h8WJhDOVqPgwV30bQ7U67xNoip/Vp
 OBN1v/ilQylkpS9ptNC5uDVMLzUwsP8Ggrp9i20QcxQRGQ7KDsZK1ytBOU/pwc7cVYkPpbMJ71E
 DvC1NXBkJqRfd0REq7LG6MK+uCZmi6K4f+JveMcC2yw5gIC/onJ7UOZGnnhII1UXbkMZLBcd6ut
 D0hBF1QmSgpzexR9ywgqwbvJ1EozUonGZ9SBWM4baTpmN928jA6elm2rFigRu6byJR3PPUWhw+J
 lkbsgFYl6qqaBqgnl3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_192847_353351_3330CFDB 
X-CRM114-Status: GOOD (  19.55  )
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



On 4/20/2026 7:01 PM, Jose Ignacio Tornos Martinez wrote:
> If there is an error during some initialization related to firmware,
> the buffers dp->tx_ring[i].tx_status are released.
> However this is released again when the device is unbinded (ath11k_pci),
> and we get:
> WARNING: CPU: 0 PID: 6231 at mm/slub.c:4368 free_large_kmalloc+0x57/0x90
> Call Trace:
> free_large_kmalloc
> ath11k_dp_free
> ath11k_core_deinit
> ath11k_pci_remove
> ...
> 
> The issue is always reproducible from a VM because the MSI addressing
> initialization is failing.

MSI initialization runs at probe time but I don't see an error path doing
dp->tx_ring[i].tx_status release. So can you help elaborate? what is the call path when
the dp->tx_ring[i].tx_status is first released?

> 
> In order to fix the issue, just set the buffers to NULL after releasing in
> order to avoid the double free.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
>  drivers/net/wireless/ath/ath11k/dp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
> index bbb86f165141..5a50b623bd07 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.c
> +++ b/drivers/net/wireless/ath/ath11k/dp.c
> @@ -1040,6 +1040,7 @@ void ath11k_dp_free(struct ath11k_base *ab)
>  		idr_destroy(&dp->tx_ring[i].txbuf_idr);
>  		spin_unlock_bh(&dp->tx_ring[i].tx_idr_lock);
>  		kfree(dp->tx_ring[i].tx_status);
> +		dp->tx_ring[i].tx_status = NULL;
>  	}
>  
>  	/* Deinit any SOC level resource */


