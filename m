Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264CCF4613B
	for <ath11k@archiver.kernel.org>; Mon, 23 Mar 2026 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9zKi4orTheYudY4g3vlblU5Ag3YWsp1AgcplrH94Y0=; b=VeDjSODpb8j1UdgVmYytdJmYmn
	1sgXnDBAMHBuUBetfw/e/ufzO/psQZiILvCh8WX2QXXj9jWFQ4qgT8x/NEqIiaW/UnlGw3n26bR9E
	1gZCcNkkt5NAwxmUzuSd9TZvT8GAbLb7Jz0YoxPn/SPbIPjomPTzt+e6zAIIGlYHZ0KqRVaS1BkRf
	4TaiWh+m7ciStFa8SwzsOvCMBQeX/E6oA6BXW8Ak2MCNxNTmRlE/Ukc7Oz33y5oOMqmoE9rv2cswM
	Ps4U9wRyacTcm9N0YxliKQ8Pnx2f/0yAgMDmZsaVhReSp66GC7cbDU0PVzsOMc4sWvewSZESs5ESq
	KYfuSmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hj8-0000000H5F0-08fe;
	Mon, 23 Mar 2026 16:02:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hj5-0000000H5EE-1Y44
	for ath11k@lists.infradead.org;
	Mon, 23 Mar 2026 16:02:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGb0j2829150
	for <ath11k@lists.infradead.org>; Mon, 23 Mar 2026 16:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n9zKi4orTheYudY4g3vlblU5Ag3YWsp1AgcplrH94Y0=; b=YqbhLWxWZV9mykzW
	QtYOwG4kTljvla/qOCHV5UdNf8RZ56BnwuEeTEiukZFTSn03TAnHLcD67QQ55cXZ
	d4NGBBHzelNh4gb0JDwky+kbTP6F/P/8d47tyz0w4Ja8u+Dgleki4E2Pxs5iADOu
	EuoFT7GAenIgtSE3F4etU9JOWYvDhCGvG6aMO0Poq1P9V+svp81uzNp+Xs5LNeCK
	iltnnJnv3/UlsFOXlviIrFq4VJc/2ekq9sDWT6X4pUfohFbIq8+YfzFA5IVM36Mt
	cUzdiHlKXPsyySH74KyxECgaMjkHs853okE2uM+mxdynAwAhBN5028+IzUe+7Tbn
	NsI7Hg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r20q8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 23 Mar 2026 16:01:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b061868724so18237685ad.1
        for <ath11k@lists.infradead.org>; Mon, 23 Mar 2026 09:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774281717; x=1774886517; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n9zKi4orTheYudY4g3vlblU5Ag3YWsp1AgcplrH94Y0=;
        b=ACqe5vD5po//DjX60F+E8jVzJhzzzBi1SWbC+RKfeh10SnHIBbCk6i56fOF8cVFBCm
         nDWVFt9Ei3aupqqSGcConlHKGP5BRW1t1AzbBvoKD+/siI8CnVrYNuEYDF+x0Ku9u2X6
         vMKDlMHwNkx7WTOcT0Eu4Z7DSbZ3Lo/sMIIjZpmzMtvliitTp39a7c7nDZP28l7xQp63
         OLkWocgoAyvrzVJ8B0p6tOIdE8VAfzbopHrzPFf5ih6/lPFmKKObsRGRG8CdpDXDCZzZ
         fZIbQiObJv6iC7kLnN7qPhyLWmxxFE6uWq7tfUH9oF1VhnbvDe8mp/KEXowVR4nMpBUS
         qGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774281717; x=1774886517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9zKi4orTheYudY4g3vlblU5Ag3YWsp1AgcplrH94Y0=;
        b=LLhIEpLW6ptMoIdpnD2EJodfUzxnYhtpFeY+QF8aJpmyTHRmFJmUTN92ienfCPzZ7x
         +ETPeqH1/lRXP8VLM/NeCUIHgriymVbOgDqXlvM2S0aXMx6S+pOMNWKt91QHJoBhBEdG
         0TgGGa6HX3wkwpJGZFc/l1PbnXrg3eRPC6Arsn6UppfpzHAWEPwgsDavRgeoPbASdOn3
         u0NMpE6x2Sbts03+t6nEdjXhZXndY2Elif+qtoCkA+oMiUqPsiAlHtZfeKJSLr2YvTI7
         XgYlyBncu4tIqji3c1dYtnPuwruRkXupGPdD1rUo3c9Cee8LuZY6Hc0+iTC0XYbkc7Iz
         1sIA==
X-Forwarded-Encrypted: i=1; AJvYcCU4ZOpk9JV2sl12W+g71036oVY7xmbg3BlWp+P/wTytlXlvMMyxgoliiikUEJ3Ux1Qq4FqKzAY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjiMg8qbJgVUpEjAJcxFCZ+0VpLHgwjcjnOjtFh20zCYyH4F9+
	MR4WOx/qmhr7Qnz9/ZVy7Y2cUiQz3yZiosSqeqvmuAALVqzRlGHX0xgEO1Dn+Yyc7ul2KHUk7bE
	wYRFXC0jCo//cVizV98DzGNd7vzdBEedzrzNJ3oONO3ZUSb46DOiV0oeUuIlULO6H
X-Gm-Gg: ATEYQzxCtN59hk0wj6W6j/Cf4Vh6znhSXdbB30yZxWcB6R2LMhJnDFbo/g95ao8ae54
	Ru2ByCwi37PEImbVaauAU9coL9jouzBgSrvr2Q9u9puQ+AhMq5LfBIG0R/K89DdhTO0wbWrNHLe
	dtWE2FhwXpoTn7eiC8zghUo14ksa+GnWi6nOrExq1UFR0NljYC2C1OQxyy5J4BoLQLgj6+9EK8/
	FOb+MmpRwm+NzF4BuFRBek5ZHeDgGRt3eaTSU9V12/g7zzIk87f4JeKRT1j/xFm2BEkdpFiKW41
	d0jjMpU+Z/fA82DrFqARVcAU66CaPTRGUqi/uXBfR4SYWPRNvo+ipqrpCyNStu0PrlweJuNJbdx
	IPJwJVGUFYZ5zFm56sY/DsCwE7jQarE1uwtE/QfiQ2PYqvI0uuxSaq8PfFQiKzunvj6IYOnhv
X-Received: by 2002:a17:902:f605:b0:2b0:5084:eb1e with SMTP id d9443c01a7336-2b0827d60d6mr115009405ad.42.1774281716750;
        Mon, 23 Mar 2026 09:01:56 -0700 (PDT)
X-Received: by 2002:a17:902:f605:b0:2b0:5084:eb1e with SMTP id d9443c01a7336-2b0827d60d6mr115008615ad.42.1774281715347;
        Mon, 23 Mar 2026 09:01:55 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.198.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836ace98sm118764995ad.80.2026.03.23.09.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 09:01:54 -0700 (PDT)
Message-ID: <5a802f1a-b4a9-4ef8-90ab-2da712c36cf8@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 21:31:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath11k: Pass the correct value of each
 TID during a stop AMPDU session
To: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>,
        ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260319065608.2408179-1-reshma.rajkumar@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260319065608.2408179-1-reshma.rajkumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c163f6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IA6WQLajIBRXaGJ1BcQDag==:17
 a=vkfXM0Oplov9zySb:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6i7BSPJ9TF2FqONBaDAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: r0IJ9Z0cZsoJefM_9L2yuqn69kinawjd
X-Proofpoint-ORIG-GUID: r0IJ9Z0cZsoJefM_9L2yuqn69kinawjd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyMiBTYWx0ZWRfX3UfZUwUjYl/Y
 NzLpyll3g+Areu2CK5Ik4rttxGeuct8VcQAWvboivDkM/PL5deBwilbnGTefpXbi151tBHG2+4L
 TFTpuubhj1j3zgOfNp08JrO3KjvmXLLj5c75QswRYEL8RoBHa7ot0C9eZ0VKre14Jpw4T9o9OeT
 TxqqkT8yjR2P3vPnBznQlKl3KqIMy3RH3dCuoZto4LgH81cyExMV+ujnPNNHPl3iPZ6szymo0zr
 KEddQkaWVVEVSXmrrwDBkj2SPhHuLpW9jvlvvwfqZwZyotoDdF8l3M8CJFUNRkW7mImW2D5zHKj
 cUZKJvf9uXUvi03Oo63IPlvMxjeYO84EZBwrl2qkMsxLyfzUYoiuV3dqV4w+3ZW5jGpxfOtO6O5
 YYPw9lu/zi4yQxBqM/dARuTGK7J3dW4sS7YBiGmGxPziOn/C/SN7PLJadnV1V8/LkSnB2DBXDyk
 UxPENHA13HuieSInHQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_090159_534720_A0FBC5E8 
X-CRM114-Status: GOOD (  13.75  )
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



On 3/19/2026 12:26 PM, Reshma Immaculate Rajkumar wrote:
> During ongoing traffic, a request to stop an AMPDU session
> for one TID could incorrectly affect other active sessions.
> This can happen because an incorrect TID reference would be
> passed when updating the BA session state, causing the wrong
> session to be stopped. As a result, the affected session would
> be reduced to a minimal BA size, leading to a noticeable
> throughput degradation.
> 
> Fix this issue by passing the correct argument from
> ath11k_dp_rx_ampdu_stop() to ath11k_peer_rx_tid_reo_update()
> during a stop AMPDU session. Instead of passing peer->tx_tid, which
> is the base address of the array, corresponding to TID 0; pass
> the value of &peer->rx_tid[params->tid], where the different TID numbers
> are accounted for.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f2895 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

