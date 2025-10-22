Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1D4CCD1A5
	for <ath11k@archiver.kernel.org>; Wed, 22 Oct 2025 01:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1IeuNaDea5YK2zKyUZ4RwziKcJaa7Qo6G4eoyjFFNw=; b=PXbwiyvj227RS06MG4Rwj3/wyJ
	yEKRwONwxQ/KvDJArIVEset8RbkGXDRQij8wy8Niq9i3gzaCvRrU3JqRLt9SVFwHSujpoYcni15N/
	ZkuA+cbXp2d7HX07oqeC1ilRb4E9es7hOLtyrhzssUAM0zmvPIj7qAFCDUzuKnw2rW1wIU5nAL7z3
	OqAKTEPjm6fvMOBa8P0hAI0RrxXTfmTqFq6avNe0oU7Ea+R6shaswDLDMkiLlcTN9Zq3FHPJv7Io/
	ye0l+nWyIxJ597I0wbmODFIOCqn2SSw4yLoA9/Y/eZvaiNQsCeiHYjg74fRqPVjREYzIqmUxI1++6
	WnkEmPwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBO8C-00000001Brx-19qJ;
	Wed, 22 Oct 2025 01:59:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBO87-00000001BrS-0oxE
	for ath11k@lists.infradead.org;
	Wed, 22 Oct 2025 01:59:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LFMHBm025166
	for <ath11k@lists.infradead.org>; Wed, 22 Oct 2025 01:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1IeuNaDea5YK2zKyUZ4RwziKcJaa7Qo6G4eoyjFFNw=; b=GVYzx2WR4WyJJwD2
	j08SKgeMjohK+ia+qVEvEGSgh1+r3gWz0I1hB+Ot5oBtr3SHPnKwaxK6FBHAkBPY
	h2moINtIaiuxUYE2DG9w758qCUNEx16nZozEu/B2ghk8XnhpXDMJRPu0Zrwkf/8R
	Z/VihAX9fk8JJRuaxYgpnCjNSywl1P8mDUwMKpsC8ah/qdt1GEDxDmlNO4wD4WQw
	oZnySejonWzq8iAGonT/YaH23uVbELdBeUxBlwgTkfW4sbZRjSoBq9CqWdJ5Q/Dv
	LXUFY7+BDOcPrRH/o4lqTvyVpO1DmsMZ2mQx7QXFWkNoCP71FqpUGFIWCqlA1UHt
	1t/s1g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w82vaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 22 Oct 2025 01:59:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78427dae77eso5267676b3a.3
        for <ath11k@lists.infradead.org>; Tue, 21 Oct 2025 18:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761098348; x=1761703148;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1IeuNaDea5YK2zKyUZ4RwziKcJaa7Qo6G4eoyjFFNw=;
        b=JoIxJ1RrXMx+wgQeEq/uaNLhb8mwHpdQcvUgL0ygPRAinaY5ckRQq86Y6T3n2y8JmN
         6hlRe4q516ccEcqajnD1Eq7/Ns3NIW587M04zUvwMMskAVLdG82Lvh5FSgcmDjAhxQjQ
         z8uGX2Gu4g/tHnKwKinUMJ+snHpf2ynyhsJoTPTbau/T6ND/dqjkMTRwnYw8gmnLdjcy
         cp0/my81hcF3XvyrRF6tyUt1qCsy7pPG1pxmHNy3tNURW3r75LrYDZ81a3Y5HSFjnHHH
         vMub6X788j4QeJyFu7j2MuZiKK0pKFRdFnwOqzTAfdT3yO/h4/U2vutewSjiO0HDLKNy
         XQpw==
X-Forwarded-Encrypted: i=1; AJvYcCX+deVgNIpdddAlmBApOuPb7GxXE2QE60XlgWNOPR8HHjGM6/jkZNTawxkjQXQV/5D5XOamn+Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YxaIs+XQn4B8NkIovhDLq6/sVCpDOtGO9mlXAkQ7WEgcdJG50Na
	SosNGTtgh6AujnquIY9+wuOjTUXGuhgxkj83t9JN1L0zFNrGKge1PNjXuosThnqtGsb61eLY6aX
	5w8p+OR31Jp4LNQEwaFp7vs3qQpQfXmaK3+/61f/y3frpK0/WXMmZHLn5KrUKSR0H4sA2Vy4D
X-Gm-Gg: ASbGnctQVIYJeu6SZ2EZf7yM+dpjV8D55gDBrVmpo3g0J11EGcErQJcEyFMQCGj1GN/
	xCqTBGfL8wfu8+tt72U4oh+qiBKvOcIX8YFyRvlW2opR2uF24GSdAZ9fwLpql24sjqNL4aKkLso
	TTc4eFYg/yHFtO96VaCFp01oio6wfGM/5Ms0IImt+V4ngE/zWJPxCQcyFRrz94n/11Z2r5p5deG
	HUeMs4v+l8hwYgqWPHNh3VtCAe/ENGmRbyFxok2WFJZTapj6ayGWmo6hbsGsLo6XA8golxopFWp
	Ht2W/bF3Y35YeiaPtwHaY6nnTK6UbjUv23A5dN9rnYfH9VxCgnTd0OGtuRnUuFrjkhtxbt22c6X
	Rxd8Mf1lJhOy/Qd/rvz90qahsvcHvcjF7Cjr5Q888vImgEeaC2agnn++j+PbT/iYNP+nf/lom
X-Received: by 2002:a05:6a20:1611:b0:334:98c0:9c3a with SMTP id adf61e73a8af0-334a8585723mr23162904637.24.1761098347832;
        Tue, 21 Oct 2025 18:59:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA3Ow01RmsRCtTan9tz/juMLr3gv7kE5ADQ1R9VputSABfYuzoLi42dtGfxiqZ1ISudZNqwg==
X-Received: by 2002:a05:6a20:1611:b0:334:98c0:9c3a with SMTP id adf61e73a8af0-334a8585723mr23162879637.24.1761098347339;
        Tue, 21 Oct 2025 18:59:07 -0700 (PDT)
Received: from [10.133.33.122] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76676a2esm11489091a12.15.2025.10.21.18.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 18:59:07 -0700 (PDT)
Message-ID: <1f49fc62-9416-4443-ac47-e67fb7836797@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 09:59:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/4] wifi: ath11k: add support for Tx Power
 insertion
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251017-add_tx_power_insertion_support-v1-0-f08feacfca93@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251017-add_tx_power_insertion_support-v1-0-f08feacfca93@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX1JNsD+bfVPWB
 TUdTkGH2I8JWmsEvy94P/GGEq39pAupfwJPgD+FUV1DGCZ/MCVgzDN+wRup5nWaRXpXaEl/DgkD
 y/MYvWzBckTWUFF3sm1PS+rT5HhVaMbDUKaxbdQjPzGpBaDohxTCvcx/JgX+5JXr6RlOd7nHam0
 7xlS4tdFXklLvmMtuBCfbRJWGbndf9gNw7yakdQxbPnCw0pNmchgCOFotyZPj0br5jFZjYlTR3W
 DY6CfsY9q5ApLnb6sYE5P9syqDtvu9MrxZXJfFS2GUx6oKhOSg/SJaFjCLfkJOn3zFWZQU16OPs
 CL393ti7I6tYWRJJFY3TdJMKlApsQnoRWIQ93KIu4ututMC+Y5ywHeoDRECrQcIf4arqrmhv+RE
 J1312nji7gPt/IubcZNkTVr9k7x+aQ==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f83a6d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9jhMNZ7qWXdoG8tHMgQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: MCuGJeSRPif1Xzqg2c8ERGvxjBVAEdqZ
X-Proofpoint-ORIG-GUID: MCuGJeSRPif1Xzqg2c8ERGvxjBVAEdqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_185911_364608_B95BE64B 
X-CRM114-Status: GOOD (  15.30  )
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



On 10/17/2025 12:07 PM, Aditya Kumar Singh wrote:
> For certain action frames like the TPC Report IE in the spectrum management
> TPC Report action frame, and in the Radio Measurement Link Measurement
> Report action frame there is a requirement to fill in the current
> and max Tx power of the device in the packet.
> 
> Add support to populate these fields in the relevant packets. Advertise
> this capability from the driver using the feature flag
> NL80211_FEATURE_TX_POWER_INSERTION.
> 
> In software-encrypted cases such as PMF, skip insertion since the packets
> are already encrypted and cannot be modified.
> 
> Patch Overview:
> Patches 1 and 2 serve as preparatory groundwork.
> Patches 3 and 4 implement the core changes described.
> 
> For context, this ath11k implementation is adapted from prior ath12k work [1].
> 
> Reference:
> [1] https://lore.kernel.org/linux-wireless/20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com/
> 
> ---
> Aditya Kumar Singh (4):
>       wifi: ath11k: relocate some Tx power related functions in mac.c
>       wifi: ath11k: wrap ath11k_mac_op_get_txpower() with lock-aware internal helper
>       wifi: ath11k: add support for Tx Power insertion in RRM action frame
>       wifi: ath11k: advertise NL80211_FEATURE_TX_POWER_INSERTION
> 
>  drivers/net/wireless/ath/ath11k/mac.c | 447 ++++++++++++++++++++++++----------
>  1 file changed, 312 insertions(+), 135 deletions(-)
> ---
> base-commit: d5ce93f136fbee2b7afbe221f34ca881036f8de3
> change-id: 20251008-add_tx_power_insertion_support-e5225e924bfd
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


