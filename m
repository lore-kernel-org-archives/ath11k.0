Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33466C02194
	for <ath11k@archiver.kernel.org>; Tue,  4 Feb 2025 16:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5xRbtahHf67+tT1W5aG/S00eDCUMSTm6m7RtxHaP/c=; b=nhAplsg2rHiKvl+8rqOkLemfuU
	/b++2WmP60NMDy/A++E2EPIKnpSU0qQWHD/iQiOYWxnGE/QM05bh6Sesgmb+SdvwRb/Eln9mg1px6
	BEtBGUHMNrNQ6c1m+ID22o6SnpmOCzXXeNSXUy7V+941cZKguU9q73Dg+GNda5aCmCRIh8jn53O3O
	llKBSNCq4OThvv+ssosC7NYYp3f2Vzbe8TyUeZ5koVm8kCGKlhDSm544+QuM/Wn9xWrIf9pEB69UP
	Q2+4gznDjddMoZtfhMRq/cY4gm44YhfVMtty+Ek9CNcYE6nLtK9nZ3DbbOq8Pe6A16Si/1nQpWZhY
	487ciqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMGW-000000011f8-1nmV;
	Tue, 04 Feb 2025 16:59:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMGT-000000011dH-2R4Q
	for ath11k@lists.infradead.org;
	Tue, 04 Feb 2025 16:59:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5147HBdT012337
	for <ath11k@lists.infradead.org>; Tue, 4 Feb 2025 16:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m5xRbtahHf67+tT1W5aG/S00
	eDCUMSTm6m7RtxHaP/c=; b=eS3FzSmK+eLeu76zF+IOpimhJmTgjGvNuLUYqwEF
	ev8h8O+CipW5T4gdNkOCfNY5DPTo+t+6GTCZueOyoDZ2zmCUPhs5fKqBN9u0+g4n
	yOyt3ygKYB1qCZgG7wCgjTYxDF/nyOHCQZMAWpP/z++kPd5NilJIZ1D0dK0+RFNK
	0X5FWoJMPM7Aiq5WgVW1FoBuhJ9kCfFTQhNY95sDCgciCSKNH0QO5G6/zNFfVTFG
	kWlM8c/XaIU9QHIlcU8SQgo+4+7qVcNOC1Pcz1+SDBz23sa+sS672k8nAZQvbg5j
	5w8Ix/y+oKTGK8JnRMy5nDcxRwOuEGPf2DMY6B3vhmIa8g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kec41b7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 04 Feb 2025 16:59:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f9c1b95ed9so2780513a91.2
        for <ath11k@lists.infradead.org>; Tue, 04 Feb 2025 08:59:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688347; x=1739293147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5xRbtahHf67+tT1W5aG/S00eDCUMSTm6m7RtxHaP/c=;
        b=jHKzt3XYcJLhRPRN1o9ifEK7gNEDDo10SAni8noPHmtiuKHkiWf21oTp/F7RvYHUd+
         cwhjXFsp4QWQ7j4aaNMxWgLHkBPsqT1WorxB30Wdo2U9vhPRmYaMb3J8qALLLyl1bmdJ
         UYrgyPJXhYMhghu30f6RziOPl3NQrsnNvnPYZE4EKOyagO7o0wNfeOE/sZyecgy36nk/
         FKgTE4/2LEPL0qCBVEKBjG8Yje2MvuajxvQpDAJR/dx3FQJ8r8DH+v6eNwCv6BCJuwc5
         5zzZrpCc7sHX4IPmAu1kZ3c9fj03WW2r9CIJDMAZ5KRyUFy1BmlmToThoTo5yE1b4PWq
         DncQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm2haLzdJVzGvVxMO/22t7QjNcSqlefE3/8JU+hF9ULZbYawbwyTYr41pLxHU02Mo4jABNSi0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcDWtigdIrxLle5k/UUzdfqqOHZ/ipcsDN3gi/CGjV5ZmfmVER
	2QCehNaB3WVOU9xPvqjwhd/Sh8qRmDglJNHO8Qg3kYjgemoDS0SUX8C4sifyVzA1pSLGsbfKqCU
	ly9POrPUyBvo/SujQVBYycoPtmraOVD8RaYYclXryurQGcZ5KQ4iwOfUM54qU
X-Gm-Gg: ASbGncvE+Vype3EIqEqF3vq0a2+iqv1yaMXy5mQeTtcOyXwCgI+v8dv1f+05CDZQz9N
	/QKoBncjjrNxrvn1OVLgLcTyB2vnCfPIL+Ab8i/LpOr3Olk5Cg+AOhd7UjtWMhZBIIrvSQ86MqA
	GuolJAMtIljb4clNvT8RBRZoZXfL45jE5yVuEFc0AhqeqBZTTccj/9RAYeFg18DzXZEq5fTFW9Q
	uxFKlH1v8vlq2gQ9OR4r0uYvK3DcVP9SwV3qtaELp31pxtsHDh8mGnd6zyAE2f9Zl74ZMVZe0VK
	nuqUjgKxJCisNw9KA68GS+XwUlXez2HCDqjv8UdAoLkCzPJfCiznKJkkI+lMkTPG
X-Received: by 2002:a17:90b:51c2:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-2f83abdefc1mr46999337a91.12.1738688347089;
        Tue, 04 Feb 2025 08:59:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTcH4wyAt7q7aTLpPh5THV7kuWDRCPr1YuScJ23G9Z+DsK08914h9Qwkm3YHDVTWmSOOVVgw==
X-Received: by 2002:a17:90b:51c2:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-2f83abdefc1mr46999303a91.12.1738688346786;
        Tue, 04 Feb 2025 08:59:06 -0800 (PST)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f7927sm98992365ad.99.2025.02.04.08.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 08:59:06 -0800 (PST)
Date: Tue, 4 Feb 2025 08:59:04 -0800
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-firmware@kernel.org, ath11k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: ath11k: add device-specific firmware for QCM6490 boards
Message-ID: <Z6JHWMJFPB8mJfdw@hu-bjorande-lv.qualcomm.com>
References: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>
X-Proofpoint-ORIG-GUID: 6RdwcawedyTdNtRoxQlZauDCFA6Ydl98
X-Proofpoint-GUID: 6RdwcawedyTdNtRoxQlZauDCFA6Ydl98
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=785 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_085909_636557_3E1E0959 
X-CRM114-Status: GOOD (  19.37  )
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

On Sat, Feb 01, 2025 at 06:20:52PM +0200, Dmitry Baryshkov wrote:
> Josh, please give a couple of days to let ath11k and MSM maintainers to ACK or
> NAK this.
> 

Acked-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

> Compatibility links are added to follow the names in the existing DTs for the
> QCM6490-IDP and Qualcomm RB3 Gen2. If platform maintainers think that breaking
> those is fine, I can drop those link.
> 

I'd prefer to keep those, as these paths are referenced from the kernel
packages in Debian, Ubuntu etc.

Regards,
Bjorn

> The following changes since commit 722d0d1271dce547df152e5d6db84c139b9f83a7:
> 
>   Merge branch 'robot/pr-0-1738348854' into 'main' (2025-01-31 20:18:00 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/lumag/linux-firmware rb3gen2-wpss
> 
> for you to fetch changes up to f0e750f347227cb1e0008715a27b2020399b5efc:
> 
>   ath11k: add device-specific firmware for QCM6490 boards (2025-02-01 18:10:11 +0200)
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (1):
>       ath11k: add device-specific firmware for QCM6490 boards
> 
>  WHENCE                                |   7 +++++++
>  ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn | Bin 0 -> 7734064 bytes
>  2 files changed, 7 insertions(+)
>  create mode 100644 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
> 

