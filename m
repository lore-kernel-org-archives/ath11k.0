Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E844BC79FBF
	for <ath11k@archiver.kernel.org>; Wed,  9 Sep 2026 17:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QSy4GkTRDc7cBXy+QCrPJpyuLi1jTY3mCalzG7aIug=; b=n+ZTvlVe1aCRwjCRuZNFWDXkJN
	mJjCJi6vtIvgXYWzV/7cdxP1FIGAUdBBBZNH/xdIGNznIcfx3o2PzQmsrGCsLI7xF7eXrxH+x2Pc+
	grVLjqhPLA6yqR7cbHmSo/t6K9KfQcDjNvsFgHyOusQiCZALq80yg/2Pdl4Twp/sq/+kWZ8W4eZqE
	gUEOF1+ZD4KkT/v9NEW7PoFiGq34crwDoANPjF+jFwxImN+7NGUHvOw5YdcH7/MIsZGJl+SEdJo93
	ksNhKcS2lxBk5Vfriuzz7fbOG22p0P57fUXDZxiK/HpZCg74pfptsTja+0NpvqGZTy2mWla0m0iUm
	kTfmNSjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYK-0000000CYJf-1b54;
	Wed, 09 Sep 2026 17:57:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYH-0000000CYIp-44I5
	for ath11k@lists.infradead.org;
	Wed, 09 Sep 2026 17:57:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7ZM32065338
	for <ath11k@lists.infradead.org>; Wed, 9 Sep 2026 17:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QSy4GkTRDc7cBXy+QCrPJpyuLi1jTY3mCalzG7aIug=; b=N/7nVBE7185U1vcN
	dJ8UAd+EaZw0wHp9BsaFhcRfcm0jOG4qn3lm+d7wMxlEl9UR/G5C8lnSomDOT8vP
	cl2+hjBmXPJVdG6HcmzMr5jfdXt2LOga+saMz8F49dKzmygwRhQ7cd1b/nZPEVvB
	jpEXPrZdFXAp34Ia8IusO9BJuPRCsfMcAxhLfZkCxd0ZkM8k6lWuCSETuZFsPI9B
	LnA3pHAhxs0+/2pm8zDcqH35gjNx2IZfRkM8PonFzR4eOJ/nCB1aLgK26SuppzFg
	p0sEt/hTi33rbXjeIfTyz3FquMBIKOlMT/ruprSNSZ2urLvC0zkmf5pOMk0zA9v9
	JXTC+A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x1p2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 09 Sep 2026 17:57:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso7430374a91.3
        for <ath11k@lists.infradead.org>; Wed, 09 Sep 2026 10:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976661; x=1789581461; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QSy4GkTRDc7cBXy+QCrPJpyuLi1jTY3mCalzG7aIug=;
        b=DUtO4Pxw9sHw+88SQzmACZy49HnpZ6H0SCmcxu5ti6noCR3AnhxeBYL0eletOvbp0v
         bWonvMdexN/hkXWCz5VydsoJUa7KGMKMDDn6zWg/C3hxSMtpeQuJ/yVBpfRNWLGuJAI4
         zzYGWKmaIFJwaARr2KqEpjj+TkVD53TZtKLlBUC1SQ8whX6OcRdrldjh8A1aRtbJp7r3
         r8c+qDRwbaKJxffH9HRXl8b0zNUWpRapKc7R9oi1Tj0hsJPuAVg6NddsL12vJL0G7mfq
         S04YEjWzGj3HhXqyAWMqmJW5+8QWqeI3mAdORvRpSAo/rGwcQgkq6Qx9x+H/A3B86XwW
         y1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976661; x=1789581461;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QSy4GkTRDc7cBXy+QCrPJpyuLi1jTY3mCalzG7aIug=;
        b=WgRhaOe4XiMMKyyQdWu4u/rBZTVWt9Y4+xbTdIaKBDLGwUZ51sKGmcsz1mtAGygA7r
         ZRQIrCG/iYoN14KOHqKSUZ+StyDfwiOBwsEQAGJQ+6rIo9qKucXM8zE0wlpSNVz7ZZFe
         tdhysPMd73mOmUJ1QxBo0S2pwlE9+HvMLdbPe4owk1pNytPH4EnwWKQGCt3iLoTcDrsY
         QIQ1lJSyZfO4NWOED4SetQyUIh6O05FA+Rf6Ytsinmk43wOUsK5E1LA+JTfFN7d9EHP4
         PCQut6NdZuWVtAAMQ6OmL4/97c6jdlTfwmVkSiV5vz5WaJNjNHqh4DrQF4oEMAIkFNqK
         fm8g==
X-Gm-Message-State: AFuF++nZ1+5J+9sKEF+d7S+Nty04TWokSDd+QEGv56LU5kK0MEtBwvOh
	QelP2QD53Ke7Y3pS7trT+/iv85xouDXUAQE6aAXYyjzd/oU8jIw1gn426GoqaAHb2WyzfR9M13I
	6Pd/466fJQX2MOg9dl3CD8/0w0VEAeWyafuJySUBavEbGcLCXkqWLZsjgKm2DIJug
X-Gm-Gg: AYBFou1jUyXGrEAsVKs3RA261uZB6CHu3rdL/jDBAOKXxTtQ3mPKsONVo2GP648TV8C
	fRSkWkQJSCG2sMZkHvzcy6NOwoAhy3jq2ozHdn6Xzu7Ln4D9r+FkqASV/FIqlCk/pPBs8hUJA4u
	Jj9hmFpkrIuBjyi8QUgWLOtt7KwlST4/3OzFfTK39nY7eawqXZ3IW+KmLD5+YTWeLRhfMIbvX3p
	5J0Too04K49a+u98vbcTyVk1TQQbCVeKY/6C7+5Aop/z5396Fpe30niodB1R6tt55cX2b81UUzz
	MMQyIxSEdz1GHuJsxq6fo5SqaX0bGsKNZ0CIulLClu0P3K8LtxDwmwwmzMLBNV9aM7x10Akg4C1
	E0ssz9H506PoI6mlWXeT7cEoWCFmCqAIgo99OgiSdcaAKeh4Ci0NV+qQ=
X-Received: by 2002:a17:90b:17d2:b0:380:f389:447b with SMTP id 98e67ed59e1d1-39b2613e70emr50029992a91.11.1788976660683;
        Wed, 09 Sep 2026 10:57:40 -0700 (PDT)
X-Received: by 2002:a17:90b:17d2:b0:380:f389:447b with SMTP id 98e67ed59e1d1-39b2613e70emr50029929a91.11.1788976660086;
        Wed, 09 Sep 2026 10:57:40 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm14478225eec.8.2026.09.09.10.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:57:39 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org, Nicolas Escande <nico.escande@gmail.com>
Cc: linux-wireless@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20260813-ath11k-locking-v2-1-f4113a0bd0f4@gmail.com>
References: <20260813-ath11k-locking-v2-1-f4113a0bd0f4@gmail.com>
Subject: Re: [PATCH ath-current v2] wifi: ath11k: fix locking problem in
 ath11k_dp_rx_tid_del_func()
Message-Id: <178897665895.2048605.3669624011112275824.b4-ty@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:57:38 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: U0eEVemclDYn5v4Q5d7STmKjhdr_9788
X-Proofpoint-GUID: U0eEVemclDYn5v4Q5d7STmKjhdr_9788
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX8ExX+qVnyPfA
 nJfM8g0XZuU/gfMpd/Nfdh6+lK2szbsUyznbmJ0KMpGaiGbhy4zBqKtF8S5wLaquYfOSHdospai
 1hmgWvXY56dJHd69QMyqZ8o4tex4s3w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX3J5QcP2HBjeb
 oWL2vFe3eXmJSD8GJsAOlHXb/j1DhtN4ZY92xAHunTaklgRDnLDSHDXq0+AluYEqwDnjgyBnl9Y
 A4FhgawjdrZFOEEmtLHQNpU1hAg5z67VMKGooXMm+8HDNVn2d4sXo9mTfZDbJWBuLmfjdPgIbzt
 ALwcohbeJ30rW8OMeAzBnLesmzh5My9+PyFP3uw5BjuT8GVWFM3Ngzb8iBfM5OSTQzgJedcNBkT
 F0egLonybhpVkuY1rja5wUePVtj6ifER0y8DlsXobRKpX2UMrS8xXBM9NrUIZloqeXrVeyHfTdF
 8l5Uy1LDL2+NxHVLju3zpXNX9hcwBNNZe72DMCoFZ7wK/dZGTu2Qe7ucLGMTw2jTBp6ahkHKK5o
 tFpQIVxml9T82UilkNdNnnyvPSCqO4Es3zcQP1Bpnk+AO+4BlRWNMm5R6ZB5D/akUsOb5OJ32lL
 Sa1mqkzujkH34jkcxhQ==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa19e15 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3DUWDGROrjpMhqWfQrEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_105742_020202_A4F244EF 
X-CRM114-Status: UNSURE (   9.64  )
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


On Thu, 13 Aug 2026 14:15:28 +0200, Nicolas Escande wrote:
> In this function, we iterate over dp->reo_cmd_cache_flush_list using
> list_for_each_entry_safe(), under dp->reo_cmd_lock for concurrent access,
> and for each expired entries we :
>   - drop the lock
>   - call ath11k_dp_reo_cache_flush()
>   - kfree() the entry
>   - retake the lock to keep on iterating
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix locking problem in ath11k_dp_rx_tid_del_func()
      commit: c7555d47b1d051e0406474349deccf74b491ae01

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


