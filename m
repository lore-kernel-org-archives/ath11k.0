Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47310CA100E
	for <ath11k@archiver.kernel.org>; Wed,  3 Sep 2025 00:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zucT71ouAiCeaIb77mSjfcSNqEy3XsFXZs+bwZ11Org=; b=GSAHQGb2sc2ekHpk77DNzknCrc
	DYun6Qb9/SLJ1thS6fUfW/759Kb2x5SFNKaBnc33rqesMCkbi3FOk9lgSYwMO7HjINejtBud2QX3M
	PgD+M5RJgEWzSKiqXF/EVy0V7rimv9nIiAI2owlDGbW/pci/UA4I9rBITohKdGfZX4MsBcy0Vo417
	HISKB/OmwXHe/sul3XAQ6JFCwaZTu5i0+DiFpYAS2OkHUtU/H4kk5wYtSg/1EbPJQENi0RdBgx8x4
	81hlGsjjcFnc1wNj4qkLwfRJpOExE3LLUwVGh7b3MqZjC0rW1MWw7JD/Y13I2tbCG/N0xs5O8ECso
	4XLIzn/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbeK-00000002t0S-2sBN;
	Wed, 03 Sep 2025 00:46:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZmD-00000002R1C-3MaH
	for ath11k@lists.infradead.org;
	Tue, 02 Sep 2025 22:46:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqIjt004319
	for <ath11k@lists.infradead.org>; Tue, 2 Sep 2025 22:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zucT71ouAiCeaIb77mSjfcSNqEy3XsFXZs+bwZ11Org=; b=pnadynPgi9HiP4Oi
	DzZxir6erC8e3hW/qN+rZuE3MPi5ZFvK4TYyNT8qDGK1nso4SEwLKx1zrhScwJ7G
	urBsL8r/KxWKQiBVh2mJrLs0yDMxg1gQQ+MzwhruqYims6//1mRvbPrVwOlinkdY
	49ytk3zQdPMsAc6/New17WPj7JHtWh4L9bfef1t/q1nCOaGyDZbWAFXQg8kaAmlc
	/cpq6FZ8xa4Gg1u0pH8hwub9GE8d1cGhQagf4cBh9hO1hvc1dVBPp4MdzI2mTFpK
	EQ/am7fcn1DFPO7Lhx2P719u/aJCjouhMgQelA06WjhxQ+p0XV0nnendbeTjtCLB
	LE7qDw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjhdvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 02 Sep 2025 22:46:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7726280f7d0so2340115b3a.1
        for <ath11k@lists.infradead.org>; Tue, 02 Sep 2025 15:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756853215; x=1757458015;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zucT71ouAiCeaIb77mSjfcSNqEy3XsFXZs+bwZ11Org=;
        b=kgb2oKu09V2F0BWsEcqbOjB3WGDshbBDIA5fXwV8qMKqISiwoMFX8lcbmUyRFm6kaH
         6sbBojBRGIPOkLp5fFJdkgo1ifieWFYXfWV1vgTM1ro8NiZE4U4tMTpXkSmWUjHGl97p
         UiLxf230bFrX2OvJxvMFRH97oAhynjr6XTcVU4AKlXFMUx+bzmI+z7KMdLQBx1Lrk8bP
         PPDaOLn5s6kqgmsM94Ld9ZxzE+NH8nsYd2j1muUWaDOMN+/tt7Gav3jFkvXHPOQeb3bn
         dNMVw0Rls/7fJPDpd2lQ6DObX6xXREFaW1bhwNEHju3dYxB4RSo+oluAdET1pzsbFe6o
         3mEQ==
X-Gm-Message-State: AOJu0YxSOf+id6nL9SQ1iR7qkpqlbHVdkwGj/01fL9KfeQYAqnd3EYro
	+jpT7rubK//y6d+v4/xHptfbsnXlBMits/t3J1ChHomLjLiqBFKyRgDG6ymHMl8nbhdQUxDvmkM
	ggf1Lp/GmhuDlexypVatYvG+3LG1yGrfDUIewl/OPv6Fz1wFzgpr+tY1pnAkVYy8dytoxhY8P
X-Gm-Gg: ASbGncteHgBkXQx/u9daUMGKimrC6XBwReS+GisjowRaQpbLFezP9F6P7ZdGLwRG793
	SLReZo+p5Dprl9AUFIBY1tW5nQT6RHXbvmMpCURvuo1h+/2lRNOMeYYW51Lsb5mTZ8TODy5ZS7a
	1JitYtBzt9sbpawuKynRKcOwjCvk7PqzgOyMkgRdS2wSCZUxyKQjguUpTvw00Gd0oYGykFwNB5P
	eh1vW31XD06OesATRvDdJghMWPU3tbWnU9PT5kK8iOOS+sI7ztMaTF5qtelf/gcVUHNxBxhQyvd
	sxo6SPSu26Ah1V7TEzJy6qyaMyvc845CyN9m2meI2YMtcDsXHNAit+2ux3eolJlIv2IECwhangd
	E
X-Received: by 2002:a05:6a00:1a8f:b0:772:4759:e433 with SMTP id d2e1a72fcca58-7724759e59emr15320128b3a.2.1756853215191;
        Tue, 02 Sep 2025 15:46:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB9qv0eFVzvl5nEblgwwyWD57ltVYbxlrH1yVZyYs108Q6uR+ONxW2OmtRwVKSH4m6/Xuycg==
X-Received: by 2002:a05:6a00:1a8f:b0:772:4759:e433 with SMTP id d2e1a72fcca58-7724759e59emr15320108b3a.2.1756853214691;
        Tue, 02 Sep 2025 15:46:54 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm11129947b3a.4.2025.09.02.15.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 15:46:54 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Steffen Moser <lists@steffen-moser.de>
In-Reply-To: <20250810170018.1124014-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250810170018.1124014-1-rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH ath-current v4] wifi: ath11k: fix group data packet
 drops during rekey
Message-Id: <175685321400.3902096.17516915412398086477.b4-ty@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 15:46:54 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b773e0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TGNEUY_dwaX08I1wFI8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: vhzGKjoNakoNSpajfpi7jaMGGeonJ2Nq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXxUNL5QBbI38X
 8nuX0kneKew+K3GUuK+wMwKGpyMLZFn+Gcn4vO/cVXKr2wXpekbo0zL9uy3Cqf9jcXs2tzqagga
 p8dexpyXErYD1fQ/CDZO0Dw2N4P/Z7bIvS7A+SXXi7wdXrJBQgoZa8jzITRZlEFA9tRP/R1N/EZ
 wtWmOXwV/GYRXecq26ugHOLzKNEoh72iWqaVodCteOShJ0+yAzf3SgVNh8zxznnWW+Z26G5uBrB
 w9m11l3s2vXXtGxabsm5GfV6k8cxhmMD151g0z5yxNsvpqRowFPfrayU/yLs+o4PFHzueGd46uT
 CBXcK5qRuDgas9x8hpNeylUdxpFa8Mj7fEkhfxVrdiQOPjZkSK5XyCWcJgU1blsdjQN89yzwvxK
 dgEki2W1
X-Proofpoint-ORIG-GUID: vhzGKjoNakoNSpajfpi7jaMGGeonJ2Nq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_154657_956155_0BE85682 
X-CRM114-Status: GOOD (  12.54  )
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


On Sun, 10 Aug 2025 22:30:18 +0530, Rameshkumar Sundaram wrote:
> During GTK rekey, mac80211 issues a clear key (if the old key exists)
> followed by an install key operation in the same context. This causes
> ath11k to send two WMI commands in quick succession: one to clear the
> old key and another to install the new key in the same slot.
> 
> Under certain conditions—especially under high load or time sensitive
> scenarios, firmware may process these commands asynchronously in a way
> that firmware assumes the key is cleared whereas hardware has a valid key.
> This inconsistency between hardware and firmware leads to group addressed
> packet drops. Only setting the same key again can restore a valid key in
> firmware and allow packets to be transmitted.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix group data packet drops during rekey
      commit: 97acb0259cc9cbfbd7ab689e25684f3d8ce10e26

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


