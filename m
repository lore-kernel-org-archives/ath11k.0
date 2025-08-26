Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35F2CA0EFA
	for <ath11k@archiver.kernel.org>; Tue, 26 Aug 2025 15:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1//9ar4mn96BTeRcegh7QawnDMTKdyK81gfdwaa5TQA=; b=QLbj+b9AiFzSzf1KYPr6Og/tBI
	elOoVoSX+yowbQ9XTvGJ+oVTCMqHkth/b4R8S1mjJoo+marCr4ytt9ExfUPYDQy9fDXDY/v6th8fM
	4UCVOV+x0Cf+3+2QO9XnlKmEBBqmX1PKu+jfY5ru9yZ2CeOLmKbdtF7lojmJlFwym8+ja43bWM434
	UaWmAb3VUKC+JVIQNOgqjhr0Q/pEzNqm63Js0xG6RUGNAhs4Lz7/YFrjMBVzNp/xXclcFLO++MydA
	thJWOOknSzsqfizvGO/oq7fjzLcl59PyfSSArzGd5iXpcxEMNe6gI0CehwiGUmuX6iDSDHz2W7lkb
	7B+xpcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvlJ-0000000CTSA-1YZz;
	Tue, 26 Aug 2025 15:39:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvlG-0000000CTRQ-3bN9
	for ath11k@lists.infradead.org;
	Tue, 26 Aug 2025 15:39:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QBkurG021128
	for <ath11k@lists.infradead.org>; Tue, 26 Aug 2025 15:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1//9ar4mn96BTeRcegh7QawnDMTKdyK81gfdwaa5TQA=; b=X4P3LLgHNPk2C2Jd
	5x2qMx8myzFcDvd3GsgCO3pcGV7w/koG/tWWh8qqUqFLDyP4Xd3ZwtdBIaPmaidi
	CONaiwJ1SXb0I/hfrCPY5IUnND3ndfEJ4BbY0/s0gcu3Pdjj53rWqbLM3QetSuDg
	+PTAZVmBdEg58qEPG1qHl+l5GbRyM65DPxZrLo0x7Vj8RHPm2B+DsNnNOpj+WWAL
	nssxfJamSDEvzBJMGG6JfRcIIZ1IbW5tIrNFPT4mVAaU9PFInlQq3qkxyP06VT9X
	WRWT8Y+vIIHPMy4g2iPQf6Erh9HUUZCeuJu0VqcU4h0OTCckdFf9SAEIApRkXmu1
	OkHQIA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um9g9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 26 Aug 2025 15:39:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-771e43782aaso2220594b3a.1
        for <ath11k@lists.infradead.org>; Tue, 26 Aug 2025 08:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756222741; x=1756827541;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1//9ar4mn96BTeRcegh7QawnDMTKdyK81gfdwaa5TQA=;
        b=qPZY+hJjBCbuPLcykFi839mUe2gQd9OCKPEFvbvNLCItu1E4S9vBPgm19w839uEdbB
         h11taBDikMJmnbd0DYGK7bDS7IHs9O/3ZL6ZEaB+C8N72OgPaQdZsdwrK5zHUoDN4sAB
         BCR4g6TGNRN77R7zorwQYtPRLlkKSNTHDChpegfuS/v54+hvEpM9ifrEQF8rHd3SqDPL
         ZCJJ0ImTTmRGd7bibDoZ8vdIB/Y1C9+f2b2RGLUOzXza+epfIeHCoZD7Ynnyubawp08w
         pk98GDlr9lxATmY52eh7K945el5bMnZFd8+GDR9YMDq7AIQV6vIYSBLaUVRUa91USiZF
         p7jg==
X-Forwarded-Encrypted: i=1; AJvYcCVrDw7sIFHXne29gXCDJEWVUTEjh4yOPMA2HIHH3lBOmSjc4HhMl2lMe55/cHuN+X+jogv7ri0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRbgPqeJGkMxxgd7hrxYeIkMH09M3Wk66+ZiCX5nrVMr/LUD+l
	FhK05UOue03dIyLMUjlXADQ7EMdZaXnYK13qF5ReZAc3SVum0DxtaVU0QZFwMDUuuwwDFCk+z4q
	wwnWU3oEBYBecfq+0wOk+fZu1O9UVGo1xLxZqb58nie4Ci/c1WUHY2d93m9QAg5tM
X-Gm-Gg: ASbGncuWKOS0XXyINwEjhpfEQJO03Uks6Zgj0+0Fo6v4G4ZvpV5avjMvo05mR4yKsPM
	RrG/XfQ6GaYlbSeMOMGBpdP6RP5dQysKwiz3zQX/W/XKQeCfbjrYukjIKsyHrvebsYoU9UVkih3
	kkWw1LbviMtgp396481EJ59eAXZouVqsDSeM09rkUE95OII73EVzwP88HIEtR1Us+A3WXYQQf8/
	2QVFDnJcirM0id/QhtxSVnoMCIW8++8Mu6Kd/qReBgcTtnQrKWNKFOzV7PWUbHJgxIjy4hlrYcC
	Xil0tanDWnqY2vzkDUe7pPlb/mP28vKn4MVRl9hzg6kFDKNkmcBJMpFrh/H3zrBqazrO40bH/73
	UdL5sweQxepCfZy9dbIE=
X-Received: by 2002:a05:6a20:3d12:b0:243:7cff:6251 with SMTP id adf61e73a8af0-2437cff65ccmr9026060637.26.1756222741344;
        Tue, 26 Aug 2025 08:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL0KSG01yve3r3qzqiKchOxZo/p+aKsbAcVtQItkNd7vJ4cyfMgvyDRPq539k48rr7cMjN6Q==
X-Received: by 2002:a05:6a20:3d12:b0:243:7cff:6251 with SMTP id adf61e73a8af0-2437cff65ccmr9026009637.26.1756222740816;
        Tue, 26 Aug 2025 08:39:00 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7703ffae973sm10724369b3a.12.2025.08.26.08.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 08:39:00 -0700 (PDT)
Message-ID: <2fab10a7-8758-4a5c-95ff-2bb9a6dea6bf@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 08:38:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] wifi: ath12k: Use
 pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250825-ath-aspm-fix-v2-0-61b2f2db7d89@oss.qualcomm.com>
 <20250825-ath-aspm-fix-v2-6-61b2f2db7d89@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250825-ath-aspm-fix-v2-6-61b2f2db7d89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68add516 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gMjHX16tY-KYiP7tJ_8A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX+UVOHew1r+yG
 +4DdeG8crIxwfnQMfM0MKpjwKOyJ5fS925fE6pRoEqwJD9X51f1o5nb5NZE2vGaygsQpS5eiDF7
 2+cGdpLbobwE9qxAsPM+8rc1E7Q2suBZnolS0J1XKS2CRPzyKwklf/dkAzq9moLGZ6C3QETKvTw
 Ixod9E513YI6asVC6yxJxT5DdMAOrcTsk0odmh5bLPXygyYYihFDNAmaRHYjzM6i6Ov024RZ1Pq
 1GtReVWamTSEUHu0w2hpkaXucx5nncAWf8qAU1iNZuQfg5pZSWHLvFMQ3HAnCbERSvSya1VmdpI
 w6Wiw9m27lbaYt/JSyikLxan1DPQrZ13bSo1nYqKuGRdLCt5IqLPQrLf7hGYpJg3auycJzhO6ni
 seoJoRn7
X-Proofpoint-GUID: dEE6lJafur0-PtSl0BsdfZLISvOu1qQJ
X-Proofpoint-ORIG-GUID: dEE6lJafur0-PtSl0BsdfZLISvOu1qQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_083902_907349_38D4C51F 
X-CRM114-Status: GOOD (  10.98  )
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

On 8/25/2025 10:44 AM, Manivannan Sadhasivam via B4 Relay wrote:
> --- a/drivers/net/wireless/ath/ath12k/Kconfig
> +++ b/drivers/net/wireless/ath/ath12k/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: BSD-3-Clause-Clear
>  config ATH12K
>  	tristate "Qualcomm Technologies Wi-Fi 7 support (ath12k)"
> -	depends on MAC80211 && HAS_DMA && PCI
> +	depends on MAC80211 && HAS_DMA && PCI && PCIEASPM

As you point out in patch 1/8, PCIEASPM is protected by EXPERT.

Won't this prevent the driver from being built (or even showing up in
menuconfig) if EXPERT is not enabled?

Should we consider having a separate CONFIG item that is used to protect just
the PCI ASPM interfaces? And then we could split out the ath12k_pci_aspm
functions into a separate file that is conditionally built based upon that
config item?

Or am I too paranoid since everyone enables EXPERT?

/jeff

