Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB87C02181
	for <ath11k@archiver.kernel.org>; Wed, 22 Jan 2025 18:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ifh75hX2lDUmB9dFOnBj3FdN+GD/9aeLONvHygEbjfs=; b=PX8/KuLDggPLOfpxBvlfdn0kns
	6yLNWT7K+oy2PQedmcbOJjWDaDaB1zOoIYmPid4NUd30ct3Pm8+gYqBDm+K/aYGjt3FPI6Nw6zgR/
	yIbJvaGibXb98xGG5w4cabKKN14LPK98K8Bkq3XJEGUmLIRg6RZjjjNDUWdcjj43NNViHqzR1kneD
	i1ELwNkc05P9utyFdHg+K8GKq26qeA3n45DIOiB3IWfZ/hTG2FtXvMUPDlJOTDY1OJR/eUu97+cq5
	Wa3W4LZFP6zceWyyLT8XKvqD4dCeVur79FTldtBkVZ0UVMxdEDbbto1g//2crTo65jS3g8ZD3M8Nm
	JLGebBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tafaQ-0000000B0EJ-0TeS;
	Wed, 22 Jan 2025 18:36:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tafaN-0000000B0DL-4ANm
	for ath11k@lists.infradead.org;
	Wed, 22 Jan 2025 18:36:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MFv13O008221
	for <ath11k@lists.infradead.org>; Wed, 22 Jan 2025 18:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ifh75hX2lDUmB9dFOnBj3FdN+GD/9aeLONvHygEbjfs=; b=Zsy3acQ9mHIOW3ON
	EHUEXr8Q7Ue9DQ+K6OVIqu4j2Dq1tgpg40ki84QqJRA8HKpfU5DKdE06u+DqOWDf
	0xOELGhoMsT4xgO1y0RiBBgeoN1aP4dQndD2lXuGc6DOAeQ/uCWtjPwgn2TCBP90
	1ORxlCrE4es/iNZLuia9dginCOCzVclyYYJcGCp8P7vaHoc+MeOH9Vtk/Rjqkv5J
	k4vyGi2R/ls8V9bZ7p1m8ZChAvYOgfwaTmdfWe9el5EY2eS5Qo9OYGNTg7wsoiiz
	YBmYbWLhOIZrCDz6Oo7sZpiUHsOTM8OXxkgXKnZMSnm2EQ7jie271JaYFZ3u6YG9
	rjWXRQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44b3ry8cy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 22 Jan 2025 18:36:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21681a2c0d5so131325265ad.2
        for <ath11k@lists.infradead.org>; Wed, 22 Jan 2025 10:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737570972; x=1738175772;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ifh75hX2lDUmB9dFOnBj3FdN+GD/9aeLONvHygEbjfs=;
        b=GYZ/rn8t4ALsYTkxSE2BCZKGKgIFwueMg9HQ24UAioqMIfVn8dmQx44qQ57YuTlLfn
         fauZE1QrPd2z3pmHtnthht9w3H0iN3BS6vTxr9+ydPcA0qB1gbsDkNn1QXMtKnbb2m1R
         04/ppXMoBBGO0xoa9fOfDkYfNhgJ4q106lekUaqtDAIRYz5ggkZldrt3Xj6Cb1lQDO4a
         Pa4JVgD6YUvak6V2dUUvnQxA5i+6RHRTho2i5JwJny79DzaHioFz2n+2CZcNff+NHK5a
         JrPwr60rEELMsGo3d2YqEnAGX9/IzczKPW14yrKFJpjWckft/SrlBAUA+qvX3Z8MslBC
         QIZQ==
X-Gm-Message-State: AOJu0YzIavZiKSZbhdR7pPrLeK8kDcK7ENymCOpbSxgc5zumX0Tc/ijM
	PMcLLXVdcHLdDqxgpA2nzKSqJhwTuhPNmONjxbUbVN1sfe0z1EWcazmWM2ikt20OAXn4C35gjgD
	/TmdQIubZIXvZXNNaYPZks3u6w80j650PpHFTHv2Wgnt0ULV+3GPud42N4VA6o0h5c1o9
X-Gm-Gg: ASbGnct2ziJxE2MtQKh6uZLwZI0nl0W119DJnKL4mObdgFEK5RZp9r7488GHwsooa8Y
	WpoeMuNfwiOj8BYrXqomaSqXwAyNLCIEiM6qezZRuvWOBECSX8Q9oV/aEwwnmOkwGuy85vt8KDw
	8jii6teWRMoEEbU/V1oYOQmvH+ATAZ9jkmSiTecDn13J14QZzPJ/RDdxeablXvki3DJvIUIK4/N
	sYUvhszq1IeRZHDCZtA6xi0tkhZRd3E10rXXzx3Olk0f2/CZqdhlQQajLIZHru7zpBlBBD153EI
	A9OqZ84idCC8uJd0OQQrHM/MvOr4fbw=
X-Received: by 2002:a17:902:db07:b0:215:b9a7:5282 with SMTP id d9443c01a7336-21c3554b516mr326385605ad.26.1737570971782;
        Wed, 22 Jan 2025 10:36:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJk4lkbhg1zi42E+3HMeeuOQx7Gaa8QOqAQwV4V+aMmvsIiARfP5nBTwWoWHUpUnw2yuKJFw==
X-Received: by 2002:a17:902:db07:b0:215:b9a7:5282 with SMTP id d9443c01a7336-21c3554b516mr326385305ad.26.1737570971438;
        Wed, 22 Jan 2025 10:36:11 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2cea1fdesm98146145ad.26.2025.01.22.10.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 10:36:11 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org, P Praneesh <quic_ppranees@quicinc.com>
Cc: linux-wireless@vger.kernel.org, tharvey@gateworks.com
In-Reply-To: <20250119164219.647059-1-quic_ppranees@quicinc.com>
References: <20250119164219.647059-1-quic_ppranees@quicinc.com>
Subject: Re: [PATCH 0/2] wifi: ath11k: Fix SWIOTLB issues with DMA buffer
 allocation
Message-Id: <173757097077.4048395.12517127367376011901.b4-ty@oss.qualcomm.com>
Date: Wed, 22 Jan 2025 10:36:10 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: csOrcpI_xMV0Hdn0BF7UY7_6DpN4MMp_
X-Proofpoint-GUID: csOrcpI_xMV0Hdn0BF7UY7_6DpN4MMp_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_08,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 mlxlogscore=791 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_103620_039295_62494BB4 
X-CRM114-Status: GOOD (  11.76  )
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


On Sun, 19 Jan 2025 22:12:17 +0530, P Praneesh wrote:
> This patch series addresses issues related to DMA buffer allocation in
> the driver, specifically targeting systems without IOMMU that use
> SWIOTLB. The current implementation leads to "swiotlb buffer is full"
> errors and driver initialization failures. The patches aim to resolve
> these issues by replacing the flawed buffer allocation mechanism with
> the appropriate DMA API.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath11k: Fix DMA buffer allocation to resolve SWIOTLB issues
      commit: 1bcd20981834928ccc5d981aacb806bb523d8b29
[2/2] wifi: ath11k: Use dma_alloc_noncoherent for rx_tid buffer allocation
      commit: eeadc6baf8b3dcd32787cc84f0473dc2a2850370

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


