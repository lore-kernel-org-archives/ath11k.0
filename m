Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CD2C02181
	for <ath11k@archiver.kernel.org>; Sun, 26 Jan 2025 18:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIMAOucDnoD6b7e/gEVK/KtBPqhW1iRWKSqKeR63TcM=; b=YnYMeAJtgA0v95bmnbMMexr+1d
	qJXN0xxblITQrbHu9Y+/FSK5Fle2IvgfMQZ+BuX5cFw/ErTVBvpSvoNtyiRuYLmDBWGz2Ru7ftWrZ
	yLbljKXAGu0sNojBBfcPXWi7ge/rn0hoeqKPrycSRGziShzlEY/2dGbf/J3Zk95LFDnryO78vmAbT
	5N9QCVcazXWn3DlmtvOWf+oQHQkZC8ks5uNrUZobWON2ANaVukGVp7rc1AcmRxfNxv1vWoOjNi7x8
	6imUSwTjccJQJk1WYCPFEvHK2o1nDrmmwjOsrSb7cn7kqGTucdVsA7xJ8uTVD+GpI9cIrQ/TbvFkV
	qk512tUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7d4-00000000etk-1shz;
	Sun, 26 Jan 2025 18:45:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7d1-00000000epu-26b4
	for ath11k@lists.infradead.org;
	Sun, 26 Jan 2025 18:45:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50QIf1k4002079
	for <ath11k@lists.infradead.org>; Sun, 26 Jan 2025 18:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WIMAOucDnoD6b7e/gEVK/KtBPqhW1iRWKSqKeR63TcM=; b=nS9lXP/dMLlV84Yb
	4TuxMPiePRfnwjTJJ3a/CDCsaBTaLnAz6JgDHU+ZCZ7MxLkG7AYOWY1gnwnJDXs8
	JpqU3P+ZRpbSpWRsxolneGkerQvpIXGlcQYdOy9YAUUyQuK956n8eFxl8TMKT/jm
	jcWi/XuWHlfDgT6ZqCqD9ZJYkaHrCmYCH5EaHQcXV7JxX/CgIjGD41U8GgmSCM/Z
	OnrhKybFYuEVIyCi9vpNWniBt4KG/h6rR6TRk3tYLRFZAcHxFsqcuLIv/nBBvaTx
	FsU1/TnTG3waQVZsCI0j+yfb2WYabhFSx8u2pE9mH14NgvdubivtDcsSGswiInFn
	mjLzgQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cs1pt5sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 26 Jan 2025 18:45:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ee3206466aso8720826a91.1
        for <ath11k@lists.infradead.org>; Sun, 26 Jan 2025 10:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737917101; x=1738521901;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIMAOucDnoD6b7e/gEVK/KtBPqhW1iRWKSqKeR63TcM=;
        b=UNpNddxfLKBw0aieFkNEpHgSoskoy6ThutxZMbZLZc7qYjy85n5qD3YS7luXhXNItK
         uvTP/ZJAcKG6B/tnipsievGO0Wr9I4p7fH4UV3wXWrOjkqwTuZSJVF/94UDmAgKCRRjo
         DNqNRCA/n4N+PMoCvauWsn9XlgHwfem7UsawgsJO5PZKCEzgwi7tFxYx9v9uaKqyBDrX
         u5FVUtaD2WnZ10zye9u5oFhInwfuJzbQ3bu6DbMHPjEaZvucwfQiYpOUg9fh5UYHOg2u
         0HqDbvsTHelIYPWsnQcOxTWNr0kBWii/7uu1UckvfyhBmUI0kpELxymI4Er/CKzlJdyY
         W/xQ==
X-Gm-Message-State: AOJu0YxWsJ2os2ik1HI2gripBMixVLGSINIB7gVkHyJwJMsI9O/SZbUK
	qwf/T1FL0wwBZpEu8OlLfzHsDoKSM5exkb998BOd33nn/xONTOZOrxFCyG/kFrdLtHhw+aRmrWq
	qrWxB7sY+FBYYIGBtK2esvomf8jotghlhTEJNlPAka+6J4KNiuJ2vFyu3HMs1
X-Gm-Gg: ASbGncsxnZtXzkt1U2hY+2HE8lk3a6wq6aVNIMiUh7fct0qx7b9fyhgg7ymRkBILtHM
	4uprQiRMJ/S7iMfC7Nli2/cijD2mv+yDKUXisKcFZeJYFmaXZ4KKG09OF+BeFe+o5NpsLM5jO/p
	3MSQbRF4HtFDXXgWlEMdf3BYnKZUcaC5HeDS/lg9RCM6dVu09q286DzC0z2ZbKqOWSaCdj/NWgB
	ll6Lx4/ZhLyxrBVFATSInWK87t2aDKoNCIG3FEQV4bvyt9plld+JttkLPhb+qrfqaQ6vTo1wbdb
	KDsnIWMouvI5m3qgOXzP3BJMXf07XJxZg3gke26ICg==
X-Received: by 2002:a17:90b:234d:b0:2ee:7504:bb3d with SMTP id 98e67ed59e1d1-2f7f15dfba9mr24210904a91.0.1737917101178;
        Sun, 26 Jan 2025 10:45:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG26oKJjuEA21yrG/PkVI7/SoF6CjcurwEG2SoTEXHxrB1yqeM6UeMNbOvXp+g5ZqT/kJ8Ozw==
X-Received: by 2002:a17:90b:234d:b0:2ee:7504:bb3d with SMTP id 98e67ed59e1d1-2f7f15dfba9mr24210874a91.0.1737917100811;
        Sun, 26 Jan 2025 10:45:00 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa44cb8sm5414795a91.6.2025.01.26.10.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 10:45:00 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: kvalo@kernel.org, quic_jjohnson@quicinc.com,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
In-Reply-To: <20250123084948.1124357-1-quic_miaoqing@quicinc.com>
References: <20250123084948.1124357-1-quic_miaoqing@quicinc.com>
Subject: Re: [PATCH v2] wifi: ath11k: fix memory leak in
 ath11k_xxx_remove()
Message-Id: <173791710012.2935553.8848464110597031122.b4-ty@oss.qualcomm.com>
Date: Sun, 26 Jan 2025 10:45:00 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: 1NUf4wLfxd9O7mR6VfUGGXv5oSgS8ttN
X-Proofpoint-ORIG-GUID: 1NUf4wLfxd9O7mR6VfUGGXv5oSgS8ttN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-26_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=743
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501260152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_104503_666255_04E1552E 
X-CRM114-Status: GOOD (  10.35  )
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


On Thu, 23 Jan 2025 16:49:48 +0800, Miaoqing Pan wrote:
> The firmware memory was allocated in ath11k_pci_probe() or
> ath11k_ahb_probe(), but not freed in ath11k_xxx_remove() in case
> ATH11K_FLAG_QMI_FAIL bit is set. So call ath11k_fw_destroy() to
> free the memory.
> 
> Found while fixing the same problem in ath12k:
> https://lore.kernel.org/linux-wireless/20240314012746.2729101-1-quic_miaoqing@quicinc.com
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix memory leak in ath11k_xxx_remove()
      commit: efb24b1f0d29537714dd3cc46fb335ac27855251

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


