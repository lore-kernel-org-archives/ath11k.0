Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E5CD79742
	for <ath11k@archiver.kernel.org>; Sat, 31 Jan 2026 06:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfLFnX/pj06+42VOeKs579fAr4gQfJugqfCbVka7R48=; b=GxKYqkujU0xFkAJykXZEIkF1DK
	Q7T5dSkJVu+MwmAvN/w+wlUauu1gzhQSRVXdKxyTEdPOOcrCj2/z9VvnYMsoDcrWK4CVsL1P20R0A
	mUBD1Va9uoZGmT21spjZUFX7gYuXpcSnnp8vgKLHTisnfSM1FhXbc/+RKglHdeM2zmZJgvQWUbABN
	gqcqUwheyINA8Xj6daRqNNZv0n+BSwEOfEzVZIjbCCOszBzQDPcoYZm6gu1dmkcWHHK8SRSNR/4w1
	qVOGwxestLFeu23DRAVb3yPOLjaqFwg1DUN4V9ZDc4IUNYSnJDycWFQdEVmy+5KWgalHTatvhtcN9
	cDjloPvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm4eN-00000002Mrb-0bse;
	Sat, 31 Jan 2026 06:40:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm4eK-00000002Mqa-3Bjn
	for ath11k@lists.infradead.org;
	Sat, 31 Jan 2026 06:40:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4U1e2447257
	for <ath11k@lists.infradead.org>; Sat, 31 Jan 2026 06:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zfLFnX/pj06+42VOeKs579fA
	r4gQfJugqfCbVka7R48=; b=gqe1TvuTQykpAnbs5syhyV19Zb0JB4DvSwyMCrZ1
	rXFdenj1qvete+UFM6GVhAF+ZGfa3lT0a2MxDs/bgjDM+FNN88BVqwFf3CsWVHmB
	Y57Rmn8/QONQhuLFez1LyzSnZYKngkJPMRQxgigpHjWJCnsdNqPoL5yhGSur58eB
	9d1bKnId1uQfRwR2iZbBOZ+T1gR3/EGdBBUsPs9hC/BQKWmL3rb0AaqDeDIKT/zj
	8Jq80h2yHDSudSYnPzQ/bXTZmvfGRk8+gjLj8XPpoj6+ckV2kX2H0lCRCCVQFExh
	P8YhLPBZTVrQXwKjfMq3GTiiZvHV7bChU/87fDDnRvuA9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arrr944-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sat, 31 Jan 2026 06:40:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f07fbd0so1211409885a.2
        for <ath11k@lists.infradead.org>; Fri, 30 Jan 2026 22:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769841602; x=1770446402; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zfLFnX/pj06+42VOeKs579fAr4gQfJugqfCbVka7R48=;
        b=AsuhfqT5aTOrkyK6gkFiEW2tOeKYLVZSUC4JPeevLXElTpVindghYtXLAzemZAhpZx
         3kLULCmokgLrJoJwt3aw6ijj0G1i4uUnHWRdEnLHvFO1OGc1Hnsn2zm3PKzgt2bTw1dZ
         U4/8UNCFFtsowVjXB3CLr8rVIwP9B0pWx2cuUePtuXin/OnocGOFmVGW7QEu6SeJECT9
         c/HU+iEaNVceVs592y21fVo8pt6TBPWt+RApnAqow90ilN2VcSVFtuFBgXlxGDlt9UtG
         xeqtI3GVK4lJjJ3zVvbI+ErOidrb4O1WzEMRg9A9o9CJHwtyjSP/6Gi8pvKRsmfSsOmk
         HpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769841602; x=1770446402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfLFnX/pj06+42VOeKs579fAr4gQfJugqfCbVka7R48=;
        b=NVyKJ4JbfuEK3L1UZU8TBpIf5dIIR50smVHBfbybCpCK3a+SKvWv/5wolmKnRqAbMU
         HEOH+xJkhr5WJe9DaAW0hLDy28PSnAc2paO6OMxacLJqKFBLDtIMVilg5MOA01D3MKyF
         0JYWSEVcDhJ+pgTBlqlS86mG5yk8RqTR91BmL2nnNJAawZGtUrLD9viIKjU5Bv7RH1+9
         X0J1BntzT/OWD4ATR3rH4GgXjWgGo3PpZQIRUtK4ipm7f3tfmRX7V+Wxz2L7GDL5NhsQ
         4ndJwvjas0rPkXzh9smg38HE0F8/opzP4Pxp21Ls4bSVt877nTu2x92aSidAXEFi6pN/
         W4wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIB/GRYez1gRFZcmQs8TPiPDfVRn6z8kknBvLRKntWt7yLZTeCdqOZ/g6mgXEfDQcqGSTMSSI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5QfqIGcS+cR0/6/k9id8WXO/Fl5CYsZcjH57wDafrZ0gMWs9m
	aVbTAQOi1JxYtcJVsfAVYKr+x114IF5pApF36dpNqH4a4ugOX6Bj8jU+WNBvdG//ex2d4buZrq8
	9Rj0dYufq7MVOYPbYZROkZKB8/CTdWChZRag/CM++g86AGEwPoPtE4ZSwwtaBYkj0
X-Gm-Gg: AZuq6aL3jIYeZgBysjT1z2hN11aytoP/Xvb5sWr083YlFy6jN4/2Z+K5agkXkjyMJ+O
	gWkhjYxEvBWj7S5ZhPFEV7HrJ1IJSNshWbRDVvFEqQvcT7bckAp98eR5XHyermMEE0jFeU/MMAK
	CvmcQQqayAnK3aRu29GH1T+qX4Ui47xPjkp1AHLa/1COARQyK6LJVsKucFY7d9lQS7ZX8sjGcng
	hg/f/QvsSkY2VHw0+2hNds+9MDYpO9KTrHxzZvE6PdARXP7C+aOdrSIbmdQECi8XWB4YAiUMYJ2
	eEknQT5TLBKqGM797WGEaF3RXRHT5HTA3k0FfRpa9uR7ztEdjZEE9MS+l7I+AE2WKLVO1Unv0Zv
	n2aBDDSexJ5z6ZVJpjb+VYOH50Kp57PZipC0WlaJ/JNkFtOu+mcRt5cfxFldTPYhR0mDyVMpYal
	GFzfBEfHc60EsXAaNI4SeiGzw=
X-Received: by 2002:a05:620a:f10:b0:8c7:10cc:758e with SMTP id af79cd13be357-8c9eb2d3ca0mr723604385a.45.1769841601707;
        Fri, 30 Jan 2026 22:40:01 -0800 (PST)
X-Received: by 2002:a05:620a:f10:b0:8c7:10cc:758e with SMTP id af79cd13be357-8c9eb2d3ca0mr723602685a.45.1769841601226;
        Fri, 30 Jan 2026 22:40:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c621basm18212161fa.13.2026.01.30.22.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 22:40:00 -0800 (PST)
Date: Sat, 31 Jan 2026 08:39:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260130
Message-ID: <34lnv35rbicqk6duyqhhidunulcipttsj6ryvzw6embgablnpl@gh3wtsknmcma>
References: <ecf412bd-7bd3-42ed-bea4-d7aa837ddcae@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecf412bd-7bd3-42ed-bea4-d7aa837ddcae@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CvYaugL44o6swhT_W5y9Td2TTcEK5dtU
X-Authority-Analysis: v=2.4 cv=FNYWBuos c=1 sm=1 tr=0 ts=697da3c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gcp-Y-p2_AVPb3T4FLMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA1MyBTYWx0ZWRfXxwbygat/Tvkp
 qPZfQdomzsY9qbd/Kzm0dyClNrjNK0GTTgtTjR//l5GjkI2n5ciN3kb+4y6RQzJFSJFm5gZJwfS
 /bt/qQUuHMEKcVMW+CQPao8k/OdkQC3p4FmoBZ8ssmlQmG3pbxSdYY3jYFLEI3wj+DlCbZdk9wl
 NSDuEF2S2O4wTYWAuUZT9MHPZDnNU0RTuPiaX4cs8TsySVeEukZvfAn22UAEucV6CJvrONV0f3Q
 ZuYf0z6IHS4hCwwf80KqE+0SQ01mZ7jb51/WlAzbuKHqntkGCTEi9/uvr5fMm6QE8qOisRhwrFl
 b56O3RXGWXAUf6Xs826LRy18kUhYti/UQFvZ/2ccnEHUjmwWFkAiTpqf2aHrUVepuNrT0l19+my
 NKLcwFOY0JPe6jookl7DQ6ygOkIBfwgrVG3Gxn6bR8iRL2PivMG482aOb28dIXB14EnPYSVme48
 xRHis9mssTF0m7wMopw==
X-Proofpoint-GUID: CvYaugL44o6swhT_W5y9Td2TTcEK5dtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_224004_916668_0463CD4F 
X-CRM114-Status: GOOD (  14.03  )
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

On Fri, Jan 30, 2026 at 12:29:48PM -0800, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> For ath12k:
> 
> Update firmware for QCN9274/hw2.0.
> 
> Update board file for WCN7850/hw2.0 to support:
> bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,qmi-chip-id=2,qmi-board-id=255
> bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8004,qmi-chip-id=2,qmi-board-id=255

These two were not a part of the previous upload, but... They again have
board-id of 255 (unprogrammed). Why is there no calibration variant?

> 
> 
> Please let me know if there are any problems.

-- 
With best wishes
Dmitry

