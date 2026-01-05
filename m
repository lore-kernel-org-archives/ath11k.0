Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A172BC2A062
	for <ath11k@archiver.kernel.org>; Mon,  5 Jan 2026 02:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FsRJhkCr/ESd4vAHear1nOT8fKaGVoJnRJCY9ZaTGU=; b=rYYav8lJ3SWITGBtqaJDd1Qmyu
	FhJJ/9w1UnFipq5VBcTZvOLAQL7O3k78L4JNJkimVYFlVdQVeJ/CdWYKyJiqcxx24rKW/l4MEhIyf
	g4SUQhs9oCqxwC1tQLaHYM0gHk8wj8oTjhxAP7w07qgvwubrfUMzvSjXlTYQPGTvjN7ILm9gQs4eU
	HYmhDN2bYj+sp4zcVX3xvtFmlxa6kJsh2De79SACYridbHk2jMZolp/P2L/1WGNpYszUnRGt3UV9G
	QCk1BIRsNZvwcHyIYuRFtZ4lv08BIzT1nTaB7gWGKJSo50isBsPctegGqGZnxAOM8LM0vuJ4MQPdP
	4x3dTpVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcaEo-0000000AdPe-3YXL;
	Mon, 05 Jan 2026 02:22:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcaEm-0000000AdPC-25xb
	for ath11k@lists.infradead.org;
	Mon, 05 Jan 2026 02:22:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604LwA6U3927486
	for <ath11k@lists.infradead.org>; Mon, 5 Jan 2026 02:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4FsRJhkCr/ESd4vAHear1nOT8fKaGVoJnRJCY9ZaTGU=; b=awvbLTzedY1tH9Mt
	f6x6KNBRF2yqQ/lIaJGh+RDJ/SxOo9OBja7FCH1Qlgty2ZDU7my/lvBQOcwafEOC
	/4pTRY0/4fU/EoC8IaHg4rwO0HO33f3lPI0y7ABiXZfGY6nECuK54OOmM/CqrmMV
	sl7g4MMqD9GXxRFsgIe1lkVGx7h4bpcqx8L4NpJJrkxI96NX9nDf9yIS0CFoxga1
	4PYwUlM78/46pZ7YZlLYBseHSdcQWckV2O9xIr4ATB1c/0dwMGES2DRB8InCEneN
	O9e/BxbkTSRRejQzrHII4ThJmG73H85q4+Daf0IZ8OGbkm/mRv6o3AGgHG44S+dU
	gvzxmA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet462y8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 05 Jan 2026 02:22:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a377e15716so180132435ad.3
        for <ath11k@lists.infradead.org>; Sun, 04 Jan 2026 18:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767579746; x=1768184546; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4FsRJhkCr/ESd4vAHear1nOT8fKaGVoJnRJCY9ZaTGU=;
        b=JohbPw51TF/Go9hLqiPzi5b3dGGaVASn60HHvPGPRiMXTCDAAZ/0cK0tJzgiUZGWmh
         NaTXhWwTNPhc8RA9wH8syzwWduJJ4LvPf+zWCuIMeKtYb1H1/AbdVQG6cZYM3vxErgTH
         /E3z8ilcmLAm8XfbHy7zF6MkPTSNvdJGeMVaKb0HRqNBGyYGvy8BHT6knL8E8ELOWP3Y
         lB5ahUamqgtVknpjvIXfbfqNMJGnpKr3hfiZ7QitiHOFSHsK5OAnXdycAmhD1xi3UQIx
         zBZnvkYIKDZOhO3ZbD9rCyttPpacZ4FSYy3n3aNnmi+QvyUsOlavDq9e4uPmTiHt6j+I
         FZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767579746; x=1768184546;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FsRJhkCr/ESd4vAHear1nOT8fKaGVoJnRJCY9ZaTGU=;
        b=iOR9mzbr3fZcU+sL4Yltk7P02cuycTupdM9Wrpg/uxzGSuAF11Csft5kMQssYJXOV1
         XSO/fySZ92KGj2ZzYsKJTSK+MzZnNjRaKUU5iWdRaf9i8jsvXBpgEU/DUfOGiv4fnuyY
         xG/NFuV4rrg8nWu2XFclXcWkIFEZv7H9pIE8ziFaY2EAuu+IILBaRFpWBqhvgsHIvrOV
         wVcpiTx0DhTeVv0j3c54LhLU9pn+nNpzqVAiguLeMmxmiZs0gz+m8jmnUdrq8YI9sSuE
         yHaYqhKpyt4e7dYjDRakvnFAU1KcB79VmoZZCXXxLXbN7bkBTi1yPlkKchxxtCl0+XbZ
         YzOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGWPexzW/BVYIOhphTHIKTV11Q4nUY6SBHt9+hI9qRNqaWJh+Y9fxSVi54MN8Vow6sz66M0yw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzL1Nn6JboF8sBT3fZsLttTsOs9cthMWgw5bNkJ4jYq/ZGw225I
	/6HhebVzusmSSPaTFa9iKS+Nm6zvMihbHooPm+5xuzd3fd6G2DYvxOjdG/lb0PTjRxXli2aJMZR
	TBrMSSIPGUmR9nX645X9PnddNfQDJdDc+c4jTnLzJA3FHPD+7VxhP0P+uFGsAUtAI
X-Gm-Gg: AY/fxX6AQn/Z/RvW3NpfdIoW4wnwM8HxZfXM7DlL+2hbSaZNRuDGp8lv7Z3oY9xByet
	21cLguUiLwofL1O8pDd/LggtuTrF32UN9QtOQns55kCrfJamZ4J6IvaLXqcMtH05IjilhEnKww9
	1qzOpDbrGvM2a7V1WtydL/6vZaAc7i/iJXAnk2GMiT3VrnaZViqiilaPC+zUMQUc1JuSPuGCZVl
	ueYCBA5/wtnyuS2YSXFfQdYkOkEUUCZ5elwQFCiXb5gKgTNRPJkxpvoXmzlJt5EkYzqJpCRNUZK
	qF74kXCPs7GSGUe1b24g4Cp8k3gUCdOxZwCRB5LRmXe13vCZAreXcLkpmr1fxK0tXjGIkDoYX/u
	5KpU9gjjTzfcYWJGKBVTLo01y+YqtQJsiPyrtevxiZae4U1AIfe+e4WAl1KRIHLCCZxLe9tenHo
	tJS2c+qw==
X-Received: by 2002:a17:903:2f8f:b0:2a0:d431:930 with SMTP id d9443c01a7336-2a2f2a494a2mr513096845ad.47.1767579745844;
        Sun, 04 Jan 2026 18:22:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExjJB7nVRkK2WQhSZ+qpovsPM9KrF7bBKN5gmhwMxrVXo9yHwrdF8tG8YH2piAxMFR0j2omw==
X-Received: by 2002:a17:903:2f8f:b0:2a0:d431:930 with SMTP id d9443c01a7336-2a2f2a494a2mr513096675ad.47.1767579745390;
        Sun, 04 Jan 2026 18:22:25 -0800 (PST)
Received: from [10.133.33.54] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb25sm440862615ad.56.2026.01.04.18.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 18:22:25 -0800 (PST)
Message-ID: <717658b7-91da-4073-a746-a389319aac2d@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 10:22:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5 0/6] wifi: ath11k: Add single shot/periodic
 CFR capture support
To: Qian Zhang <qian.zhang@oss.qualcomm.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Yu Zhang <yu.zhang@oss.qualcomm.com>
References: <20251230082520.3401007-1-qian.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251230082520.3401007-1-qian.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDAyMCBTYWx0ZWRfXyVE7SiYG11Mj
 nSWmG2ztqBUnzkO+CLBEn2Jf/k1cAVVu7ncN3Ng/2v1bv7/A+rrB4dyL9bxwp8YwMp0B/F9Tet+
 d6ZFgqC+hMMRLLqkVPNEj0xGUNTT3qNVMZc8zR7TuWruYRP68Zuc1lKkFRPsAyCVzXPFpSFTCrs
 qjA0m+PF6d3ke/pUk6FMu9q1NKQJQi5bl3JJ18TccEqfjg/EMQMx8q2hYW/tGvrRA7VfDY9Sh4V
 TRByymHIg9H+6zm6vRVkEJzDRZGppxduOogjvzc/14V41e0gAqb5qkXSYVxyg4STg5UYNmcjJgB
 vTfE/4ymVX/v0vfsdYtX/oNVJPz6RiSLFQask/w193C3Sj9qls94WvSEMiiw+kz547mxBaRyoEo
 cmiRKO/97vQ2ZH9Y6AXj37Ns31YCcGpU7RhL8PDS95r1nO0pyLkk23JaqtgVjKQYnNi1X2Eexth
 veQCypK0JMSipYuJ39A==
X-Authority-Analysis: v=2.4 cv=UuVu9uwB c=1 sm=1 tr=0 ts=695b2062 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=n3Tg3unRUF8wbe423YUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MinFlFFIIe_3VGLoChSEoZsHp4BXxUpe
X-Proofpoint-ORIG-GUID: MinFlFFIIe_3VGLoChSEoZsHp4BXxUpe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_182228_716489_A7223C5F 
X-CRM114-Status: GOOD (  16.89  )
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



On 12/30/2025 4:25 PM, Qian Zhang wrote:
> To enable/disable cfr feature use command,
> 
> echo <val> > /sys/kernel/debug/ieee80211/phyX/ath11k/enable_cfr
> 
> where, val: 0 to disable CFR and 1 to enable CFR.
> 
> To enable CFR capture for associated peers,
> 
> echo "<val> <bw> <periodicity> <method>"
>  >
> /sys/kernel/debug/ieee80211/phyX/netdev\:wlanx/stations/<mac>/cfr_capture
> 
> val: 0 - stop CFR capture
>      1 - start CFR capture
> bw: CFR capture bandwidth
>      0 - 20MHZ
>      1 - 40MHZ
>      2 - 80MHZ
> Periodicity: Periodicity at which hardware is expceted to collect CFR
> dump.
>      0 - single shot capture.
>      non zero - for Periodic captures (value should be multiple of 10
> ms)
> method: Method used by hardware to collect the CFR dump.
>      0 - from the ACKs of QOS NULL packets.
> 
> To enable CFR capture for unassociated clients,
> 
> echo "<mac address> <val> <periodicity>"
>  > /sys/kernel/debug/ieee80211/phyX/ath11k/cfr_unassoc
> 
> Mac address: mac address of the client.
> Val: 0 - start CFR capture
>      1 - stop CFR capture
> Periodicity: Periodicity at which hardware is expceted to collect CFR
> dump.
>      0 - single shot capture.
>      non zero - for Periodic captures (value should be multiple of 10
> ms)
> 
> To collect the cfr dump,
> cat /sys/kernel/debug/ieee80211/phy0/ath11k/cfr_capture0 > /tmp/cfr.bin
> 
> Previous link:
> https://lore.kernel.org/all/1645005922-7252-1-git-send-email-quic_vnaralas@quicinc.com/
> 
> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> 
> ---
> Changes in v5:
>  - Restore the author in all patch commit messages.
>  - Update patch 6/6. Cache the phymode during association and
>    use it to replace phymode reported by the firmware.
> Changes in v4:
>  - Update patch 2/6. Remove redundant bw parameter check in
>    ath11k_dbg_sta_write_cfr_capture()
> Changes in v3:
>  - Update related comments.
> Changes in v2:
>  - Update related comments.
> ---
> 
> Venkateswara Naralasetty (6):
>   wifi: ath11k: Add initialization and deinitialization sequence for CFR
>     module
>   wifi: ath11k: Register debugfs for CFR configuration
>   wifi: ath11k: Add support unassociated client CFR
>   wifi: ath11k: Register relayfs entries for CFR dump
>   wifi: ath11k: Register DBR event handler for CFR data
>   wifi: ath11k: Register handler for CFR capture event
> 
>  drivers/net/wireless/ath/ath11k/Kconfig       |   11 +
>  drivers/net/wireless/ath/ath11k/Makefile      |    1 +
>  drivers/net/wireless/ath/ath11k/cfr.c         | 1022 +++++++++++++++++
>  drivers/net/wireless/ath/ath11k/cfr.h         |  308 +++++
>  drivers/net/wireless/ath/ath11k/core.c        |   41 +-
>  drivers/net/wireless/ath/ath11k/core.h        |   19 +-
>  drivers/net/wireless/ath/ath11k/dbring.c      |   50 +-
>  drivers/net/wireless/ath/ath11k/dbring.h      |    8 +-
>  drivers/net/wireless/ath/ath11k/debug.h       |    8 +-
>  drivers/net/wireless/ath/ath11k/debugfs_sta.c |  142 ++-
>  drivers/net/wireless/ath/ath11k/hal.c         |    3 +-
>  drivers/net/wireless/ath/ath11k/hw.h          |    5 +-
>  drivers/net/wireless/ath/ath11k/mac.c         |   19 +-
>  drivers/net/wireless/ath/ath11k/wmi.c         |  147 ++-
>  drivers/net/wireless/ath/ath11k/wmi.h         |   97 +-
>  15 files changed, 1855 insertions(+), 26 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath11k/cfr.c
>  create mode 100644 drivers/net/wireless/ath/ath11k/cfr.h
> 
> 
> base-commit: 4465d808fda12fa47f83733a9f7b7dbc29d0ea54
> prerequisite-patch-id: f44bdcbd36af0c3fd57b477848bf4699cade9389
> prerequisite-patch-id: 76c61f8f00aac2a3b9ff31e0166bb12997c2b0cf
> prerequisite-patch-id: 886b24b2496167c304e8ed42b5d879e0ecab111c
> prerequisite-patch-id: 672baf608620c531b3765941c2719ad9d34b99c1
> prerequisite-patch-id: 07c9ff6fcaf4ba464be993caa19eb49113eedbdf

what are these dependencies? They are not present in old revisions.

BTW, if you indeed has dependencies, in addition to these prerequisite-patch-id's, please
also list them explicitly in the cover letter above.


