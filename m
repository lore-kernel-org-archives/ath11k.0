Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146E5C3ABAA
	for <ath11k@archiver.kernel.org>; Mon,  5 May 2025 19:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mn2rrLB+XnCWDOZpcjuYtgBAhtXxoLufytebR8dLHs=; b=ngUKeru4V99IfMvrjvwf9VutBq
	9KYg1x5LP9I0iQcuWAMJpnZWDLg31LwE2+mcBEECLLOjWC2s2dTwGNHI55yXpgauxGWmoq7497G2q
	2fVNlTV8AhYHpZDOHXFvx/HczxPH2NVaM9yk5noHOKRK/wrY4wALfj4zIrmUw4Zild6HQZoYCagS7
	mv7X5RbYgGB3seffOmMpRtJw4BuWaRE7BkAq49v5ZvXzu4XQ7nL+3Slhq46rLJ7rsJaCACC6/IQRI
	s5D8lVmf0hCjm87kY/Cv9ZzZDG+aXMFFSZJ1RVGDWFUjCDwY62dZaJ+f7f+/zxJj0JcIaB12d0MLj
	DolAN7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1Jl-00000008NxT-0nid;
	Mon, 05 May 2025 19:17:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1Ji-00000008Nx4-0rEo
	for ath11k@lists.infradead.org;
	Mon, 05 May 2025 19:17:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545Bf5Po028614
	for <ath11k@lists.infradead.org>; Mon, 5 May 2025 19:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7mn2rrLB+XnCWDOZpcjuYtgBAhtXxoLufytebR8dLHs=; b=BBiTabJW+n4KBvlh
	R1w3pNpnz5dWa89tsPzuX98S8ZllEPCT8oKi0cdnxnXqm2sOjiJp+w8YJE8mtuTj
	b9tZ96FtS8IUc6cAfAsnpRQ7XWABacow/r36VNmYkqqP/J3XYiW4xQtLO2mWNTyl
	31Hyer/PnahgX6vdGkBlPgeaxzz+Gkyju8VDlKfu2ABwHw5uuPXWmGgJxZ92jF+p
	7+USM2gSk+PeQs49HTI8jvc5H6pDWAgUuQqAKyaAhI3ExPM/g/33AhIwikkxVWxA
	/gs6BAdV/vNpPmbN6NQOp5zKRChV4dAqPodRPKWm2OO3YSgYaH9/nonjgUq8PoBs
	BnESbw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep55qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 05 May 2025 19:17:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-308677f7d8cso3930435a91.1
        for <ath11k@lists.infradead.org>; Mon, 05 May 2025 12:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472647; x=1747077447;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7mn2rrLB+XnCWDOZpcjuYtgBAhtXxoLufytebR8dLHs=;
        b=OGcQWVPDyLubzqPnBfpsatnTOkPgBcCl3zfcXbzCiieBZ/rgAsP5DrqzaXO3CWeijh
         UGWJZyJEGz2aK6Go/NnbQthszYEQ0q1kW2JzVqcN4oo1BnSK8yBOgF/Iub4lHYWWDRT8
         p9V5mnw4kd3XKghm+2rkiiwseCJGJTvz1c2dq/sZC0qGPlIYaXuzGYqxgi4O4+UL1ipn
         blevhlFCE4DkHtvZdDmNpIRtcRazdeeHWa6SVMifPBvpo/7dWSh4FNps7yHRAH+GWmax
         Z+yvDTooUaHbAZ5bE5KW2M2MKEnwwalhok8pxu1BEFJnrFSn+62B/nZ907ByGWp2yVpW
         GWjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb2FYVgHGrEwWgJVn6r+vCSfjCjzxCRNMzgOnrklBaP2ifn2HPTjjilc2UMC3wL1waAOzOrR4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUbusYPI8U92fRq4K1YL106P0nGOX6UHF6DZLsIpV4U3Utv09P
	pd34fY7jnfR9GilrUeeyG5ke9cKrr/yzQ6CumBY71G+QV4jPXi6dRGa1CEJTDpZ8u2nIZvY06Yb
	Bdw02y9cSL40yAG8txWEc4b7+h2S24x8PZrDxrQJt7cDad4LJlsKVearAZJrM
X-Gm-Gg: ASbGncvhRz+WnoMnTYx7GQAd7M0YN97LXg76Zsuav5ujQV1+Nxg4pIQrfOWoYRNYWEi
	ZFhVQZxVG1GGmZ/RwbGEyIjh3LfqLpFgruhzEoCyLMmlKdW9AoZV6o+5uTSXTAqZfdnLbzX39C9
	ecLTG2i/foU0wcX9+grvwZtwh1MHfncJM55LT1D0gLBvvrTYEYZMu3Z+npnNzUrzZKsuDyQYAjm
	ax95JwcdAkzKWG8YyosAbtjNQqorbVE/+ceZ9GvxDkjPY/qiUMoIlPuA6MKHJraYyYbJ+i6y4T6
	AXdwZw9fnCBNDJu3TWUMbu4gMV0pXrtg+kmLXmlKPCp026tbZlw3T349dXcLVFFNWXjUrKsbt8W
	ZiiQO
X-Received: by 2002:a17:90b:2545:b0:2ef:67c2:4030 with SMTP id 98e67ed59e1d1-30a61a2bf23mr11942152a91.27.1746472647423;
        Mon, 05 May 2025 12:17:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp19+cr+5w9t5t+d0bTheMNcdBYXAAQfq5l9a4/Cfanoha8qZ0UTuQPA1laccqJJm2/wtiWg==
X-Received: by 2002:a17:90b:2545:b0:2ef:67c2:4030 with SMTP id 98e67ed59e1d1-30a61a2bf23mr11942122a91.27.1746472646944;
        Mon, 05 May 2025 12:17:26 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4762672bsm9313052a91.32.2025.05.05.12.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 12:17:26 -0700 (PDT)
Message-ID: <f58075f7-f643-4e47-b774-dc529aaa01e5@oss.qualcomm.com>
Date: Mon, 5 May 2025 12:17:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] wifi: ath11k: Fix memory reuse logic
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, quic_bqiang@quicinc.com,
        Jeff Johnson <jjohnson@kernel.org>
Cc: kernel@collabora.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250428080242.466901-1-usama.anjum@collabora.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250428080242.466901-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=68190ec8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=aP1bZ6Fae55lA2u8vz0A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: q26h7cAU4xmpIDH23hJztyytFySWsx8w
X-Proofpoint-GUID: q26h7cAU4xmpIDH23hJztyytFySWsx8w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDE4MCBTYWx0ZWRfX3jSrffnGiA+d
 nhlEB5in0WID7uXl3M+cz+ijJH8wAnx2w6Zuz7HFJVuMgwUgX9n++dind64DBrYY60jVieJN+FC
 /sB5hbhFvZt4ljMdCOu/9m65VSuHzXq4/JeGx1OUqsCqgKJtVWX5uGTTSC642nyMm71lyT6ZHv8
 6rBm1etRZz56zB2zoGKbr7arxmg3bK2ozDvkB/wC1LmL6HT1ACdTDiZK6z+GkqVno80rbE7UhNC
 CpAe708qRNXKrTStAS2aFMWxunrpbbrFcVNe6fyVyX3Ffqy06APi/Pby3At5+/Iq9vnlwIiGBOW
 JA6zBAQTPeDgn6ti0OkAChB7JpgEzDD92SZ17uMckvxYTb4nYba/z3o7xyPeqesAYPJ/g1F6bCi
 p5JLDlspxMBT7F6nI6Jm0aT37Vqv932Tb0eYOKJafJi0Ap6ojcrjX2WV6qtEYc2m/6DAWpkv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_08,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=952 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_121730_385865_47765D16 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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

v2 feedback was not incorporated:
For starters, can we make the subject a bit more specific, i.e.
Fix MHI target memory reuse logic

But don't repost for this -- I'll make that change in ath/pending

However, does ath12k need the same fix?
If so, can you post a separate patch for that?

/jeff

