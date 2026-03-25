Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CB0109C057
	for <ath11k@archiver.kernel.org>; Wed, 25 Mar 2026 19:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRX2TeJnAfqK61YrX26wKqVIj6I4aVlTC7JyT6LMrPE=; b=mp37bM1iX3Md6/XwlPSdezG2X3
	nqVEwDCXU69JX4teaYLuWs3VFe5VljBhBHOwniHEzVs6diQDtUvZfMrOnFcBXouw9q7OvWzj/7QMl
	9Ry9j6jhzB+aAusYHG2r/eI5PQKP8MpE+lRTIqOo0dDuHrpKDCBMFcCh02rHvyRWqXktd4R/xfoe6
	2/jSGJPCdvAKLH4eH0ZmMXedPPrwmw3bMe+SXJoyGWiQd8TdsITIDyoXhAG0oNaMK9LPXp+G3cMfK
	kgNfmA7iRYM8h+VexBRk1MxKdckQVHZS9jUnHmzQzRiwQbymmFpFQH1Q2cuyqcpDjyFbdHW3dIvUb
	ni4PondA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5U4Q-00000004AIr-1m6I;
	Wed, 25 Mar 2026 19:39:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5U4L-00000004AHM-2zRc
	for ath11k@lists.infradead.org;
	Wed, 25 Mar 2026 19:39:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH9931258044
	for <ath11k@lists.infradead.org>; Wed, 25 Mar 2026 19:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VRX2TeJnAfqK61YrX26wKqVI
	j6I4aVlTC7JyT6LMrPE=; b=Jke5vlqLOymrsMkJIXGnGSKhUONpLkcA6PDaM0B6
	AWwh5Z9j9fz351ENI0ktAtJl9KNzS3r0sgSMlxlTMFnKsJyfimnyzbC87+2R7g1X
	YWqmDUOr3mQKoG9dUUGB2uXOunzALcWuQHF0wKSPtFtaXuzqkTlE96AWUVX6d12G
	cG+fBupcCN2s3QRBJEs11/xzCKxRT5edwla9jJZkTAhJf7pBdreCsiZ8RZ48Zb+R
	tcLx/TwMuT+WEYtIQFOoapxCo3CoV1gCpjbvBmxMnWqqyrczPcWvWxbZQI4mAx7A
	0mqGfuwWBd4XZGC/okK2znzqDlbwaQbnGt6QyslMRxsfnA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2t3k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 25 Mar 2026 19:39:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b878a8c07so10711771cf.0
        for <ath11k@lists.infradead.org>; Wed, 25 Mar 2026 12:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774467548; x=1775072348; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VRX2TeJnAfqK61YrX26wKqVIj6I4aVlTC7JyT6LMrPE=;
        b=OOx/LeDkTcZyuHV/Qc7dNu3r1K2gojdHg5IUbWsnGH9ozBqeWf8Cu8UxAJgn0PNw2p
         UOF01ed3mU7Oquq5yN6Me3SKRDJ/jpvEuj0yk9QjOBRz7GnsADbz7oHboSELm3mH4ml7
         saMkIxiQ6F8O9dqDWT6CYVeWLXzPJo/jYIRpE+r1k4xNyKmp14SfryRZsU2IFNfEOnMG
         MH29B3efi8o/RxhJBmkTYywwWiuJ0FjpfLd8IAARd64Oz/snK2XdO0pG+ObRGrUM5y4C
         YE2rUh5oWOf2zrxybzMBaLsSx79OZ3WxGLPWMuTKwh6rqarghO2YOu5wpnrYadi8TZLg
         /WGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774467548; x=1775072348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRX2TeJnAfqK61YrX26wKqVIj6I4aVlTC7JyT6LMrPE=;
        b=sgXhOYvWwSxfjj6tpIa52TWoy8cbkX2uHj17qwjT5qloIky9+qGbi7ZA3TeswySu4m
         Es+bsUbsGgEK2XCO3bThRZ6bcPzEkiTLR0svIfKliMuB4a6r/DKTdrShryGhqjtU9/hy
         ZxS1sgceQkb+djuELMVCVc8GofMt2e5z76UamFm05m7gufFs6rTmZDeEnes4+53BkY2K
         U8lE6U9ENhYDLER58cNw7YgIwEgv25uTqjVzp8u/40bqzjLSclz9u9wskZGwn/cAOw/V
         6bXX/6kmFhr1StbyXeXGBfjtwg4PTO3RDKDkw50WJWJe5SFCaVwzqunKOQMrpQ1vVr2C
         2jWg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ/AtPvi+Vd35le1pJ45fLx0uegOfZHKKmQUCtBtWN9tGY9ohSeb9gGdfJOQ3qStO7ydTNQV4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqmHGcY4uXhNObm19SwlsuhghMNymcAyM28PN0JkfQtwV2PXLW
	7ML8ymKGbMd2upJtKDrIc5GO4YBu2CnfZtQsqa1aLUZxZDqngBzzXW28TaAcd4u72zF7bm7GNlL
	a8UyTXUOIIPGSODTRW02afRXjud1q8LKH7bmYZkfZMSFt98h920+MaXMIm6cadG3a
X-Gm-Gg: ATEYQzxpt5ePShyLjh4TV5Bm/kxlDvlRIm0RNkAtY/8W88Y25vTKfWLOX2HGLAfyPIP
	dG5laHxKVItO0imeqRvQIKMbqOJkZOOGfQKTqmDGSiCF0EOlN9lcsbaX0aSqn+TOiHfbYESsEXa
	KSEdO0/BDx/RIrWZFkSqvT22RNlg14mx1y6/T+3yoo8spCnn8j4l6QbZLAgrBwjG1iqSiLRvySH
	BaBPwLzIi8ernZjN6DkQOxoFLsf61+JSj4JhKS/R6gIR6SQFJB1f3FPGn3uRV5VtpRbgsHRo9Cj
	hZWDrHM+nybRk8Kh9xBSVBQU+81isKWSl+DhCDEm7nhCiKff35zd+dQppso7eA9VqR06EttgozA
	9y9fL9T6wEZ5DADeLrKMhWUblfLl50PGjlTkr0IFw8GwooqfV8c2QeLCoduHIWX4wTSJwAR/0Qo
	3q/73IptF0voG44o3xAx76FnTmj6NbhKQErng=
X-Received: by 2002:a05:622a:1f9a:b0:509:120d:4311 with SMTP id d75a77b69052e-50b80e66563mr73669881cf.60.1774467548234;
        Wed, 25 Mar 2026 12:39:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1f9a:b0:509:120d:4311 with SMTP id d75a77b69052e-50b80e66563mr73669501cf.60.1774467547795;
        Wed, 25 Mar 2026 12:39:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a068f8c7sm91843e87.65.2026.03.25.12.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:39:06 -0700 (PDT)
Date: Wed, 25 Mar 2026 21:39:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260325
Message-ID: <4zrp3tlsqytyuxau5qk4hnlsht24f6vlgv7pyhb5y5cswgn4c3@4imh6ktclmfd>
References: <32af006e-265f-4239-9b5f-be3d52996e10@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32af006e-265f-4239-9b5f-be3d52996e10@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE0MyBTYWx0ZWRfX8yZlWaY/0qYG
 1StJUk5950lJ424mZPYWGjsYTTAZM9UAwE6iy4onUiOTC2yno3VMNhIoh4kzMjysgpxeJiTkloI
 MM57FrW4hvtvowZ4cqGRitv3Yoap8/XxpgicZ3BHaJ3RaFm3s7pvEw8kqAHY+qojrkUo5ePIp31
 k+K8Ajdfq7uj3N/CVT/1/A3RHDV81V8qF7qXEIgHIDUJnxAwwnFiVXk4RDymUjAWI3aD3OHpDO6
 2s98pxp1AZfGq6xUzss5Olx5TvdeCCt2Q0FMxKTaahy+y16qKU76RLzk0QqQKxceYaaF9GCKO8I
 EmYoiReflkD8T9F4mT4qDOTYWPcAFy6dzkH8hAMdn9LI9yLV4NtxwwoMrYDkI67nCN/I27Qf3mV
 +mlO4DeyUXdtIZlF4l8fxFkpMUtW5XX6TccAu9PMrKRgJqypWBEejLVY+IAu6YjNs0nY1QiGJMt
 zmUuCgyz7kxK6T1gvMw==
X-Proofpoint-GUID: s4zBW7Pc94iYMin0hOAj3LFdPEqFPJc9
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c439dd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=p0WdMEafAAAA:8
 a=FOHEAjDUwq7NbCT47RAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: s4zBW7Pc94iYMin0hOAj3LFdPEqFPJc9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_123911_097017_9171669E 
X-CRM114-Status: GOOD (  13.38  )
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

On Wed, Mar 25, 2026 at 11:00:04AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> No updates for ath10k or ath12k
> 
> For ath11k:
> Update QCA6698AQ and WCN6855 firmware to address a WoW page fault issue.
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/974

> 
> Thanks,
> /jeff
> 

-- 
With best wishes
Dmitry

