Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C20C369AE
	for <ath11k@archiver.kernel.org>; Sat, 12 Apr 2025 04:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMnq/8PkZJ1y+QIAP+XjCJdI4Ir09ftkPYUCiLBTyf0=; b=mwVPn7FdeGWGtYOuaMw/VvTaFC
	FAzTbY0MDtXuCO7XsDGx1Eray9AAMXz5MVxg1URhHvPUG+3qZlEpJpIKvmqNOiW4i7PobZ+YeXWsd
	9nkCQR0ITKy2Cq4RS32c/p60y93UBpkwlTEACc3yjU0fj0j6vVV0tURAt5SnUZm5Xi90J4NX2HzdU
	BHXT2+NpDLwWCmvAApeQQOJHDfRlbTxSKaBuuZBgtkl0/MbS/ab5b/4R6lEXsSXUw+E7mx4cVe2TY
	5zSGSLw/0sygtbTx+bh4x0KarYzI/pe4PnRbx3PxRbANjGb+NvX3cMGYbkRHKNJx9gxbftEXHOlW4
	f7JIFJFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPi-0000000FPPa-02H9;
	Sat, 12 Apr 2025 04:24:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPf-0000000FPMb-2UQ0
	for ath11k@lists.infradead.org;
	Sat, 12 Apr 2025 04:24:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C3jnOb006435
	for <ath11k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMnq/8PkZJ1y+QIAP+XjCJdI4Ir09ftkPYUCiLBTyf0=; b=kkXT1hMk9qa1gQ5j
	LpyFgiEPPR3fXLDa5DcSQCeO9ydP2TVpThFJ/LUQwlcZYp2VR7fMp+RMHkK3QxRX
	1kMxOe/OZG7A4MaevVxmLJ0DS2tqhXSdePrWTcU9AMC4HL/1/3jaJWZiRdSmEpKM
	OtTreRThr4UAQihyDFyWmm/XOwo75OXP6S2fCVDYghS3Ua42256nyEADz8w/VNHR
	BIsmE23koRh4tpck9f3AFVPQjJlAi+MbVDt7pCRTd5zrKAuzIk0kqoCQBc69SHfq
	HDnqYj+vaHC8omIhQAAAq9nzg2nMU3mN5zYo7I9fYVK3qXVDQelpcOOIvvF4QTy1
	qstTHA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69g4uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2240a96112fso37046815ad.2
        for <ath11k@lists.infradead.org>; Fri, 11 Apr 2025 21:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744431853; x=1745036653;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMnq/8PkZJ1y+QIAP+XjCJdI4Ir09ftkPYUCiLBTyf0=;
        b=YIgW/A1ci7r3NIA3H3G1r4dZaGXFucqr4nRCPxlulnVzCvUYTGY+bptvtuYadyeTmb
         96VgHATuMAS2CrtDgJ6+yCWybcZJm0hu4oJnVqm0IYNRU45QlrFkjJJRIbF4fKFQwmBg
         dWaJ0S1dwHcTBxuPnm9OTMkpemhHz2FLFeYoHtYCjWZDnO/AgjA9w7WTqrWYI25sp5VT
         ldz2c5xbu60u9e16IPLRhVRwfr06zt1oLsCk0AH+H2H6rWc7NNmTGfb0ZOKkkWHEV1Po
         STAIj9pUsLhqwUeEnaw6PrMSWDWiKONNxDhhXBTtGXDaXS3vywJ75PU9GxbhlNBNOcTR
         CHXw==
X-Forwarded-Encrypted: i=1; AJvYcCXn6kf47pAncYpy4BIYWx7Erx9KMSALseVtGy7ukkcrk/GxPM/JnKxR3RACEnUjxsBS2Oavnxg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSpDE7fXVqPMMVJeWncYPA2aGhX9Ul9Q00c8FNn1qxfU5HiACe
	XvwTMRPREd0ibkdvREQxzjKsK2yUsGgNs9bRr+mVLc9oS5wPWoFF2TCDYjyrTeC/sWrs1+hQhIJ
	zq52nEKuDDI4m1YTvX/MWDT30IJWB72lwh6QvhXgAFrGQB8/8UutDsrs8z6GW/PXWPT18
X-Gm-Gg: ASbGncvEm+U/hFAzZfVdDLwKPrNzBF+w62KFzid/xsZ5phu1ycgJuQbcWTSMk+8V9bn
	utgOcBXEZx/fkUUBmZBp/ZK7RaYhGFTNNYUvVbRTbqFjaFSsPoLMSq1D/ZTNPIB3irTz8Rn1e/l
	SSD6qY5a9fsQ4jzCy9KZEHOU+c12wAnPhXoIZFpZ8rymHMhVIOJ9vLiwt6ZJUPOKMFYK45CqCM5
	5/gLTbWE/6+1rCizbCJ/s3hPB5j619uygVyvQHCogHilJaO868/fo17oFKcAhiQEkAJwV8jL6ql
	cGdWkAfQNwtTW1ZjQaCvE+cZV07YHqeTDlkfiIwWKDCbIRwi
X-Received: by 2002:a17:903:25c4:b0:224:1acc:14db with SMTP id d9443c01a7336-22bea4c68a5mr60057625ad.29.1744431852870;
        Fri, 11 Apr 2025 21:24:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp3MeDia7eAVUoOuls5eWRymp6ibxhPX7+qdvuGmoD0CWN0GFpaNKGP+44iTG5egAsheFsyA==
X-Received: by 2002:a17:903:25c4:b0:224:1acc:14db with SMTP id d9443c01a7336-22bea4c68a5mr60057405ad.29.1744431852531;
        Fri, 11 Apr 2025 21:24:12 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e643sm6829912a91.12.2025.04.11.21.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:24:12 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250408190211.2505737-2-robh@kernel.org>
References: <20250408190211.2505737-2-robh@kernel.org>
Subject: Re: [PATCH] wifi: ath11k: Use of_property_present() to test
 property presence
Message-Id: <174443185191.2972989.5552642055295334224.b4-ty@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:24:11 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: VX2UQeokEHa9VaXV6JuMeQRtsF5CFH7r
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67f9eaee cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: VX2UQeokEHa9VaXV6JuMeQRtsF5CFH7r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=580 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_212415_804916_B82BF4F7 
X-CRM114-Status: UNSURE (   8.51  )
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


On Tue, 08 Apr 2025 14:02:11 -0500, Rob Herring (Arm) wrote:
> The use of of_property_read_u32() isn't really correct as
> "memory-region" contains phandles (though those happen to be u32s. As
> it is just testing for property presence, use of_property_present()
> instead.
> 
> 

Applied, thanks!

[1/1] wifi: ath11k: Use of_property_present() to test property presence
      commit: d118047f82408201eb433a7ff7d505e72515d7e0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


