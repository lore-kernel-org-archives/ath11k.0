Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7743C55160
	for <ath11k@archiver.kernel.org>; Thu, 30 Jul 2026 03:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9l214qgUdXGA8WVoj0GqLP3Zunwqu6mDgURnXJ+2pGg=; b=lYIInuz814el8+r/omg7eSJWP3
	UHnmjSFCbAoTCTAOiQSDzWAfoG3ywPLz64FR4TJQ56rA3fnjBNHy56fA4xtVMaAe9P8ZOwlkXhnt6
	Cy0IToMR605WiR7VkrBdC4h+mFcQ9BgNPrZg9LFziYvKUa6Xjg9eeZVyoJG6CtIR9PZetRi1SLUU/
	UlFJEp0McbMm+DJb9J0tXdNBtD8bz9iFkIaDKahc4OUCfveeTCKkVqckTW+JgL1kcDmN4J0A5B0yT
	gBdiR9MML2cpS8bJyyn1bqBpLtiL4TSdmK3fHBkTCbtG6D7qZgTmjNvJElP2u2v4mzsqA7J5s2MfM
	/GyW9Xtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHAF-00000009OO1-1vRY;
	Thu, 30 Jul 2026 03:10:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHAD-00000009ONd-2InN
	for ath11k@lists.infradead.org;
	Thu, 30 Jul 2026 03:10:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U2jkZF3713736
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 03:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9l214qgUdXGA8WVoj0GqLP3Zunwqu6mDgUR
	nXJ+2pGg=; b=U15F9i/N1SSt6loXq1vZFNYOtTcZJGwuX+7+u4XCVJxImQdXQ4u
	Kw5js5vgn+WGHw4X7og/BlWjW9K5RbQj3KUJ2IplbWdUDcsq8sDw4AJgbrC433gY
	oZEamkOs/4VI53Z8dCF0VE6nv1FwOQmPxwJoNwopfMzxvd10qhYM8ukqJUJUwWWp
	2Jv64wQNwrKuGcbc1WrErw6IfeZdUZ6myEBMlp5x+Z+Wzjc2cj8ikxbM0XDQZF33
	6tMnkpGpRkQ+pAnLZnWU3Hx01lD+nIDbmAbDdYk95L3pPD3wq3QSFugW7DT+G9H+
	d22SyBNfNJ01ntDLqO7aEyu65w25BkJc45A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqx43g33w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 03:10:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfe48ca1efso23351135ad.0
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 20:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785381027; x=1785985827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9l214qgUdXGA8WVoj0GqLP3Zunwqu6mDgURnXJ+2pGg=;
        b=HT4rM/ndmVx4tcwAU5o56xEJF44YBkpF9ENysD8xVZS4qZensmp5EfXjzM3TNhHlKs
         b20OG7HStT95OnyNAieV6bUeYCTtCWITKCxJSWEFs+/7ZZlwohOfFDgSFJ8T5JVS9UxM
         vJS/b/Ay8PaM/jxVQy8dEjfRSeDvfOHNul3d0JEs2pWC9VfIBZEVRW7L+VXMPsgMwk3O
         r2UDEvKDAd8jR52YQUfFUcsBcfmqrhBiRrESo2X1QNAXaakWB+cytbNGFVqbpn2FfVgE
         Wl6+kHNZ+Xq0qH9A8zWB65idGQ8jxsNdVbMx7nOBCR7hTSPWqR7lXEbBTcKDaWjrHE9K
         AdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785381027; x=1785985827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9l214qgUdXGA8WVoj0GqLP3Zunwqu6mDgURnXJ+2pGg=;
        b=b57nSJ64/MtZR1RV0EgJhq08I+LoT6HLRdXCZSEXLqsNwf6q6qpkkAGrnGDy8Fn0zl
         TiRtlg3LCM+Fxr0N/PY7zFFb5cE3jclKg1tTV2RdSS5WmEVEPlNqGwVEyP2er6hyzh/e
         LtUaH8JVUz3pND5e2Nvv6GfME1G4TZAeWpfPpy1OIJ1lLIgpINwOV9RxiJzud1LSmNjL
         8+X0zzl9cwaSpH6IhLlsQzZI+eEASCglYD9fa0lYpszqzMNyu5Q68KQUBmqySRm8gbKT
         weiTgOyQ3255jsrAXCldShd4zNxgZyWxj8VlBOPAdHO//Nl4EAXuBE39TmIOpemKrSHK
         WFUA==
X-Gm-Message-State: AOJu0YzlhDWBPo0dxrj2jGxmVLs7vdXfQomuR09SDvkAghqzFKslch/3
	YSz9+l1/Ih90WZg9Ol7IUw7pLmLh5DTaysEs6pKqaruGprZ2RebZvTcBUBZTH5NHmsRYVRQSpos
	A3MJuCpWHKcoR89hfzqjvNwcrrurr4uCcRSDc6Sp6qsiffvX6DlUEWe2uOtOk46TM
X-Gm-Gg: AR+sD1182u7MevkeoJDSxHi4oxoWAyxwGxyIcIKw2uu4nNSRvGDm0BneUMxFIm97SXF
	OY1roCP+lcWErgnu9/wf/2R9Ptzy++pj+PA9PTSIXko+2/XlJWPZrw/NSpOA4pGYbvLDxsNiu0r
	2KlmjNWASt+mh3LiF7RysiRTIVyKqAgQWdhiWIfV3Wg8sWC9XBp4J5n8xOdQD6CAuBzw7Kmkw0f
	g6+eqVExF3PKUDFW9TN5n6ldzeAbGZwb6F2b98fgqf6fFGV/wL6kM0DU2uHc5pTSZe6SywX0ARJ
	YMkIkXOaziaBgZFy/Qp6mFlFUJ9XvLyDrdd9PEJqqYl2vQxMpuA6OKjt6rQj9CfzGc8fC6WOO9O
	RzrHsRLxB2VFIst4vVvZEfZbGopYdGStkhKqrbImgQeRoulCuOuXB7VmkozU=
X-Received: by 2002:a17:902:ecd2:b0:2ca:ce91:f027 with SMTP id d9443c01a7336-2d035cd98c5mr9333355ad.36.1785381027518;
        Wed, 29 Jul 2026 20:10:27 -0700 (PDT)
X-Received: by 2002:a17:902:ecd2:b0:2ca:ce91:f027 with SMTP id d9443c01a7336-2d035cd98c5mr9333055ad.36.1785381027098;
        Wed, 29 Jul 2026 20:10:27 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c2e5b2sm18928035ad.74.2026.07.29.20.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 20:10:26 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [RESEND PATCH ath-current 0/3] wifi: ath11k: fix QRTR readiness related WLAN initialization failures
Date: Thu, 30 Jul 2026 11:09:45 +0800
Message-Id: <20260730030948.147892-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YGf4stJeN9LkRZoi0gMEnXBmYOR9ze5p
X-Authority-Analysis: v=2.4 cv=H+jrBeYi c=1 sm=1 tr=0 ts=6a6ac0a4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Hy-6OMvPWsRTGNkc5tYA:9
 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAxOCBTYWx0ZWRfX1yHBGSc7sxe1
 urp3yCW8W4LNMagW+5Lp3mj/b7s4JwNCah78bTs3V8FYFhQzOc+EXu1LDFgGe517SPgqqDzc6Ic
 ty+GzAVVSaEUEQSImGdJN2hlUsWI4P4YPdF2duPqeS/GZVbbQaQ3VIY8EJj2jrKaCOOb8QUe2VQ
 er2+v7Tfw3NIkAmhGNJmqRFJ5arhODlnZcvZDeZeSQDGHuIC85zIokEfBddTf6PvFXYmADAps2Q
 +WQr6pW6i8iW9xg3Ot/bsKYG5DOGnWX9mE7FXVdAuXR8MeqpAYMByZH/YsjhsiynxIkjH9mcNwx
 vVoeXJVtoLqTTfQQB1Yu4VJlUE2YDZIbNAC7J2efiLkZNXfx9er+i8LhyfuQ2RkOpvofHceuWal
 VjMXPHIgwU1LafajKDCSsGsV2aUznveh6A3kN0TRqfTruyDLY6Mmr5nYd0DeGF/H4rqaQqMXKyn
 551lLl4nLeFZcNVjDWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAxOCBTYWx0ZWRfX/GuNteiEFxT7
 eiPWwRNg3D9/5gZ4IPSKG45YQMDUgxw0IpDVPQQPrS9EnRCu0xRsdqnaPWGEduXLcp6xl8XL1b7
 cx31bF1XrqBPPOt5lQ8LRJ7OMQ0oAT8=
X-Proofpoint-ORIG-GUID: YGf4stJeN9LkRZoi0gMEnXBmYOR9ze5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_201029_750093_661D73FB 
X-CRM114-Status: UNSURE (   8.39  )
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

On WCN6750 platforms, QRTR SMD may not be available when ath11k starts
during boot. If QMI messages never arrive, WLAN initialization can stall,
leaving firmware running but no wireless interface created.

It also hardens the cleanup path to avoid crashes when deinitializing
partially initialized devices after QMI setup failures.

---
Miaoqing Pan (3):
  wifi: ath11k: fix sporadic WLAN initialization failures
  wifi: ath11k: fix NULL dereference in ahb remove when QMI init
    incomplete
  wifi: ath11k: unregister PM notifier on QMI init failure path

 drivers/net/wireless/ath/ath11k/Kconfig | 3 +++
 drivers/net/wireless/ath/ath11k/ahb.c   | 8 ++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)


base-commit: 6776197cc88d0d397084bc47bca7e983017cecc2
-- 
2.34.1


