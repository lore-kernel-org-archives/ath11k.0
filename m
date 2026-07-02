Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3DCC43327
	for <ath11k@archiver.kernel.org>; Thu,  2 Jul 2026 09:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylncxSLUxXESezNcxecxf4Cg6YfvZmwrGu0aRxiZoZM=; b=A/fdE8Ffzel9U1P4G0ePGz6lgd
	XYbnLcNw1O5MHLIaWBgtbibFptkNNqPkcIPGEYtT4UXz7hhVC+xB0bB/hIUiRfo6aGvfn8i1aE9Am
	RVE8NpIBaLmcERDodORWb+mgYKbEdN/qqCFhSE9U+8WUmOuz0jhmtssczDf+9+ycRUxOfKWV7L2aq
	sNcezrVuTNE8dVy2oSkVWXQAwubAAVMtHhDoZdNYNiWsomJZHgagcqGqPSJKqnzpQjO8i+KMAs8nR
	b+eTA0+ivVxGtNJ1U5dz2NQ+HI9rzsNpWgL5niNdLNo1m3YCPu0/kf1R9gPmmkt7oAi7yrZGZE9Ir
	6B645iFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDOq-00000003y7z-2kpS;
	Thu, 02 Jul 2026 09:08:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDOn-00000003y7g-0tkM
	for ath11k@lists.infradead.org;
	Thu, 02 Jul 2026 09:07:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66242shE3460370
	for <ath11k@lists.infradead.org>; Thu, 2 Jul 2026 09:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ylncxSLUxXESezNcxecxf4Cg6YfvZmwrGu0aRxiZoZM=; b=jAx+iWLWrnKeyR5+
	EQw5eZ5BqUwhxKkuKyAH8yF5wfTKRL6/RI/7gfEETY1LPBODdGD/2PyZ0J8XhCgq
	O1fHSmmpPgurgBi+iROv8cK1e0OsLuY27iCZAIV2X1AGouli99MV+4mKh2PCo2A4
	c3uuMoWdBEDt/6P4cqrFEHD56y63N1rdBHnrVFoBfrgork0XFfI3mmNaS8Q6xeaE
	iCqBHnl+/G//gae5JX2j2d604YD2IwcdRv8kF1/I3m+7fLn+uzow11pYjeJ1CsyO
	JygXsu5jBo8X6KcyrIeV6UkrNXbx9cInZpuKcoS+0vKbcTk2kcFLbOzyFaZzq5Pv
	vWfDAg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb126u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 02 Jul 2026 09:07:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-380cf335604so1642509a91.1
        for <ath11k@lists.infradead.org>; Thu, 02 Jul 2026 02:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782983275; x=1783588075; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ylncxSLUxXESezNcxecxf4Cg6YfvZmwrGu0aRxiZoZM=;
        b=H2ElLsQ61tP4fxDuAToM18PgtuFu5Y0+c7Y/w+IayYFLwFGXO/MEVvI+ouuYDQ7hjN
         sprzub+rTrljvziSgT34zhFqjivKOjKl28Cu77uJAMjPh7vx0NeAMxdIhWe7l81CnG4o
         q00wYDkVpADAYAtzAydj1CXFROAjBHh/2tQ7okSAdSpx21sUKEsaD6ucvj9UWn194tgs
         4sk2R6Ea6nbAG4K1a9DeCtQbb0avMkB4hxlPJISIPxHrPGLzeA+2oK2Y48tnkb29Y7j7
         CrTm6hiyMGv++9GQJikWmmFTw4BJ0jzSbljc9lM/3oo4NmwNepzlz6VuoOO1PZnyel/D
         0u6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782983275; x=1783588075;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylncxSLUxXESezNcxecxf4Cg6YfvZmwrGu0aRxiZoZM=;
        b=QRddXBXjbMM/UnTxshOuAjl2+T6YxgoW/OROyz+QlwZgWJ20SzSkGRoNyRt65F/Wb4
         17AHv/7oQftGLTGXmnHIj57anULy9sTZQ2WyxhwYzHwoaUC8DLgooZn2jIFXhCYoWscC
         7c8MuMUl91HWr+M/Xn4pl2E31Zw4PGUSHwJcfPVhtQnhtLzbIoZn4J4z5+o4qhPLxLRt
         kgVczPok+bMMXGua+r/lGQT6mwiFQ1hrOLbJf88Re2S6apii5euZ5sMsZfvjtDzIj8fi
         PNgAS3tjxs0RGuWhR+gjsT7VqZ5bsogP68YFfCmnWIyh9KbtwedOPS1zHlphzZpnYUau
         AtSQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCWnkB0Nx3PtyHY9UFUCsyYNQR3cnoD70fJbdepkrktVsJ0aJewpsupotHQyTPmw5hkoU304E=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNImEkDCqH5cbl+1GgDzhbZ/HhxwI99vyw9yRIZowhRryOJe/e
	XA8zvrxoEqvjwZ71m5rnKim30Y49omPrIS/AvUwh34wURjfV9wSBTR9KlMn3z2lwWhiBuKBYumw
	b9TR3eFuDr2fcVksad/wt6Msm2qYwDkSpoRqpOKlVFgPJ2WeQ7grn8PRFmPMtVdt6
X-Gm-Gg: AfdE7cns4a3SWgP0MmmwcOMwu/xJpukPO4NHwKfQLhX/SnYALcpRPPUvo7C4dtkqaDW
	/jEyu6rY/WFZZ/nwyvaxZpALT1pdICRtpF8zoe1YRMIVoJ93lCPPWa6InSs64R75NYXMjel6Yxx
	TkeD/zJJdc1rUoXsUZ/MqBggB/m1SUhM/IGEv8IO6j+rfvMq3JaBAdmvwTyAZ1KeWPl37VCVzNF
	Z7eJeAQlX+wHkHO+rqIAcLMiAHNUNofGhPddHSoRBqhWf9gt571AZ/gJTbH54uGgQ2ia6xvhlZm
	Lz2aIq0tEp5skJKkmkW3wrnrVvrDhzKkVPvFtdICzlv3kgFXH5jgw6xGCQfQU7yT3G6LvEcA6ZB
	NkcT48DBHbtvDyPh8xFIA3kdkniUSH2vtp37kOxJTOalB+oN5e38bQLJZn9OvNtxsvndkWlpdca
	Q4QVqR2/gB
X-Received: by 2002:a17:90b:4a:b0:37f:9ce1:cda8 with SMTP id 98e67ed59e1d1-380baa88b4amr4478361a91.30.1782983274997;
        Thu, 02 Jul 2026 02:07:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4a:b0:37f:9ce1:cda8 with SMTP id 98e67ed59e1d1-380baa88b4amr4478305a91.30.1782983274349;
        Thu, 02 Jul 2026 02:07:54 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e165cf62sm738930a91.17.2026.07.02.02.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:07:53 -0700 (PDT)
Message-ID: <c4569099-14e2-4898-ba9d-092680150d72@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 17:07:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix refcount leak in
 ath11k_ahb_fw_resources_init()
To: Wentao Liang <vulab@iscas.ac.cn>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260609092528.220547-1-vulab@iscas.ac.cn>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260609092528.220547-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5F_fqHMjjSIukCxHZGWovoHJEv-JXkF7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5MyBTYWx0ZWRfXzYsvBFy2h3Rf
 ijLDbE5VdifrixhCwUcaA3oT7SXHM+D+B9TnyeD8aW1gZbqbRhZ9ZHi4EKBO7k+oCxr5k6v0q8Q
 uAXNDyF3nR2u8ArkzZJka0xeNL2uXKM=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a462a6c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q36DTRNDronnURX6cDEA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5MyBTYWx0ZWRfX4/UkZJvTNT0X
 slhWEV7uKkU4v0Fd+6646ucy6EHJzl2tnhLvFbAsEYxIwKDFMQE6A8/fqnSsppt7Wam+noaPda7
 sxCsQnOK/PLJVVsfpSvAFEC9OL3ZSo35vwhUOomtIOY0aVlxi0WTCcpxENJa7S1w67ENKCLZahq
 CAn9hkFKwtXIQObgOguo1Dw2Qs07C1bzKUCnSh4s6PUW6rAN4mQrs2R19GkpW8kHZXJndcK00vQ
 uGpoad2L2yT8oxVDRY20SiFPEs2P7+3mter0WdPdPfASzwZaxKK1D3gJttIHWmRtCucKdcqbvSd
 lfBiqToRJsLxtBHsYrg4ZYQp0QIZmBOZKdktgi/uFpvHOEPvejpHfX9CpuzXh3CY7F1yH0szIlG
 yEASAUDuBDJ44GqWCUE8o5toMS40WdA3/Vbz0FO3TfWFZlbkhf4EqgRpTfJlvJyzlOGrdefkxoc
 k22hg5iz/6IHUw/xr1Q==
X-Proofpoint-ORIG-GUID: 5F_fqHMjjSIukCxHZGWovoHJEv-JXkF7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_020757_372168_C1D99678 
X-CRM114-Status: UNSURE (   8.98  )
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



On 6/9/2026 5:25 PM, Wentao Liang wrote:
> of_get_child_by_name() returns a node pointer with refcount
> incremented, but the error path when ath11k_ahb_setup_msa_resources()
> fails does not release it.  Add the missing of_node_put() to avoid
> leaking the reference.
> 
> Cc: stable@vger.kernel.org
> Fixes: 095cb947490c ("wifi: ath11k: allow missing memory-regions")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

