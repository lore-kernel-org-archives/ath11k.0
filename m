Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE81CD4F54
	for <ath11k@archiver.kernel.org>; Sat, 30 May 2026 00:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpywO6SkDOjlP3BMRqeWEdeabYg7GdsoNqQc655h+qs=; b=Y9xXj2s93X4Q/9ZBugbPzhbN+k
	+QRxWJ7mjIDUwvSOONrPu/o3TkS7VJHET23YL+VsXu3oSu9GNLP024haOBG4idh48VVug3iMIrFVq
	0ihOYPAEGFtTbwvkPh8Q2UdwaoRdFyzur2+WpaRwhxJyfQjIEzBam6UbJSzhTGBCNJLmN2dlTfHZe
	HOqLA0B5n9q4PXilWbBi5er568fnbhNQ16YwMbbiS0lUsQFlUMNtywbBFH/UUTUmqL71nG7Y3kgzr
	c1MLq1AX8tI3M/elCLp/zxHJeb52p8GQegFs1bCjjDwYl163J5kwlfgQ21LuPfCNiBSHbXZsqRzi0
	HfcDoEAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT78f-00000008JkP-1KI9;
	Sat, 30 May 2026 00:01:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT78b-00000008JjV-3eVS
	for ath11k@lists.infradead.org;
	Sat, 30 May 2026 00:01:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TI2IqX589607
	for <ath11k@lists.infradead.org>; Sat, 30 May 2026 00:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpywO6SkDOjlP3BMRqeWEdeabYg7GdsoNqQc655h+qs=; b=SPjJSPV+ZNlrAoQn
	ZHxh7mmtcvDOm1MYocHyO1ZEIhJMunDrcUhCqbHQLdAuI1BDF0Ql+/oIxZZmLhic
	FMywCJ1j1ahva4KoZ/rxXJd9C6M2ukZJnKaGcjwlFY+lmggD1+zjUQEK3OhXBnik
	Vgp86RjtLCvAfK3PMeDe9To2Pd3DVU4F8TpzWHeU1v6zbLRjefpWtPbnu7PZrNLc
	wMOA8NTRrBZ1eYh0tygVzbxKYMzbVKSKu++zKen9u+LT9KSbwllVS6868krliWEj
	GtjURwWxPyZUkGTvu1MFVmLMZSMfK1LE8CERJZbpk0eeMIlgTqk3HlXB9YAQJI7T
	8R/e3g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef8rckqa7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sat, 30 May 2026 00:01:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304f23c55b2so1121073eec.0
        for <ath11k@lists.infradead.org>; Fri, 29 May 2026 17:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780099272; x=1780704072; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UpywO6SkDOjlP3BMRqeWEdeabYg7GdsoNqQc655h+qs=;
        b=JPBwGvGhvo1l5AR7RrnDGdenshdZ4bLgWFZAZ/2phyoTTadqEwJI7Lag61OpA+OAdn
         ngj2nF5k7Vvf4lX81vbM4X7f3trUUaWwrw2+TPFloNmFKwBnZ/96iulE3DJoQaGSZ0Su
         A4/lMhEqknxx+SSWH/TDM8nUs7+XHBZDwLaWyGCQXnbfG3Wb59z97i1BN8N1f7mrdulR
         Yrwj7dP+QjPaCfXnQH5ccXs/F4NDkqxxGVdAGBKEdc+eCy4LwPuJEd/gwavD5M19o9gP
         PIBcQef6k4bgsAnkb2Emby9jM/qTDxz6sT/7VwTE0AkZL/1k8GmHyLx1CpukXRJv/LBP
         sGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780099272; x=1780704072;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpywO6SkDOjlP3BMRqeWEdeabYg7GdsoNqQc655h+qs=;
        b=gQiOci+BY7tJKTaqXbWGW9Q7wDHHfv5f2s6NmAzxwEnWpIAH//5qFfqvEZ88VZfiNs
         B/pX3vR42/r1hS2gk0BLeb/QGEIm1AYhNP6bboRPlSl86knmCqOdvvrRKDL+xX1Uqnk2
         VUDn9WTxnGs9z1Lwe4qU4ty+8h3RDWgf6q8z9ebR4f0VdPMYjZ8eKS77rIqs2V6JPM/w
         /Hw15uANIDnI6RyhiMGq77AWA0tPUp0Upe65av/g8v9VUshpS3P/bwxFDqjMpKsopVZX
         NNB0z8DEiyJlPWg+ml1y7pQG5iu1TETdBqhxPUcvgodqnDnj9jw34PqFXSMw3p46H4Bq
         Y5Pg==
X-Forwarded-Encrypted: i=1; AFNElJ84LYEiFG7quIk0JXnV2YyqLMXMeR1QLDaUj5gwXH7oaYONyt7otqVayX4o9tMgM9NHuhSP7Cg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9PO7SAW6CdW4QauCPK78bFqpdu/16RQpgyZS5pz++xoGDBaDG
	h1fHKkP1xUQmZOODccf/OtvjATsE2kvYg4FF3jRE1O+AjFBLO6GIdCh7dDSxZ9KQfEcZ5NL6ORP
	rGQlevkPn93Gy9fao7PwHoG6zaPWnNp6k7y+kVbIQK3zAB6qsBn5lZijKhqjmfYO3
X-Gm-Gg: Acq92OEvu/ewaDDf9rn392mtdHYWlcL5Kb+EhzcHlX3vGRjeg60/r1PotGKdK+oOcJr
	1JNnAn4xBSeAg64czAgJkiIaNvVikZRjRqvp5vQc98j41qm1UUAY96IAvXx+oBOIpl6k6x6sWGD
	0wEafFzaz2riVjAPGlM0DaahI0Al49kv+56NIL2u7slsDw2pA7+5q0qPWzub5+x4NrHBpD49cYJ
	dEkYcCFGR/ZsL0DVA3stPqB0qUQxINsjVSAKYlfCuTt07B8Y+dZZ+c7QWYnK+YF9V8GMpZ2ZAEp
	NndOptnle5Qk+6nuGJM6NPV5tegn099r/WcjauC9F6j05QB9D411vsIeXdLibk9Emwe9hEgs4W9
	xfMktCUSFpr6aAX+2L74McJQYKmGZ+6U7qdmd68UtOGZlu8YYeaGrBJqB66wIaV+fG2aK+ua5+y
	rs0ebbaim1bisF6BAyAaNPD2JK
X-Received: by 2002:a05:7300:5729:b0:2ed:e14:e954 with SMTP id 5a478bee46e88-304fa6dccefmr962697eec.30.1780099271376;
        Fri, 29 May 2026 17:01:11 -0700 (PDT)
X-Received: by 2002:a05:7300:5729:b0:2ed:e14:e954 with SMTP id 5a478bee46e88-304fa6dccefmr962652eec.30.1780099270745;
        Fri, 29 May 2026 17:01:10 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5d5385sm2693818eec.28.2026.05.29.17.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 17:01:09 -0700 (PDT)
Message-ID: <4bf20c0b-f153-44cc-ab83-cd0251dabaff@oss.qualcomm.com>
Date: Fri, 29 May 2026 17:01:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] bus: mhi: Drop controller runtime PM callback
 indirection
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Loic Poulain
 <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
 <20260522-mhi_runtimepm-v2-2-fbebf41a82bb@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260522-mhi_runtimepm-v2-2-fbebf41a82bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fULnemCjFKc2PkCI0JWKuMv3iaOlZI5K
X-Proofpoint-ORIG-GUID: fULnemCjFKc2PkCI0JWKuMv3iaOlZI5K
X-Authority-Analysis: v=2.4 cv=DuNmPm/+ c=1 sm=1 tr=0 ts=6a1a28c8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Q7cftjHEbLmqyJcuSDAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDIzOSBTYWx0ZWRfX9XXwR4ZfNYgE
 699XIpsl4nxlXghGhjmw4oToMKVQhVTX1/NOXhWo0jH1njaniiKuO9GiRHlo+0AOUhkbo2VK75s
 aMYA8IpqCh+vybwtsugUPhPGwUVBo07gLIFveZrwb0BJ7hOHjmu371sv03PKoR4c/+7+GtPhCBu
 NHd+LJpS/u6G+BEYbYjgCTnfv9V1CXTpMmEqWpAp1A3cuZTqBBZJ4Uy0QrApCyp5POY5ajqN5xT
 ci/iAcIHUTlXWU/PcUkhgx+gUbd5oQ1sNoDYLG/wtLA1vP5Gyy8ZdClxqgDNLVv1mbZHyt5pyqR
 Q3jgTAoHgabj1o+dQnp43EJYyOWJmMpWKMncIX5yPIJUsXzQ/a/lfav8inazEwNvlRmoXoCENsp
 El7gbRH3Kkk7lfNwmgG/lFhe4WVJUjHdj+FKPAI3IJzG/oHf0vvDUp7Zh7SpG0+hiPhNLqGeRhR
 CC8p+WSTPv2bx/1Q+yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_170113_975823_702C266D 
X-CRM114-Status: GOOD (  11.06  )
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

On 5/22/2026 3:00 AM, Krishna Chaitanya Chundru wrote:
> The MHI controller interface exposes runtime_get and runtime_put callbacks
> to abstract runtime PM handling from the MHI core. This indirection is
> unnecessary since the MHI core can directly use the generic pm_runtime_*
> APIs, and the existing implementations are either no-ops or trivial
> wrappers around those same APIs.
> 
> Remove the runtime_get and runtime_put function pointers from struct
> mhi_controller and update all users in the MHI host stack to call the
> standard runtime PM helpers directly.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

>  drivers/net/wireless/ath/ath11k/mhi.c | 10 ----------
>  drivers/net/wireless/ath/ath12k/mhi.c | 11 -----------

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


