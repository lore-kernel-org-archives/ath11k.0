Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D65C02199
	for <ath11k@archiver.kernel.org>; Mon,  3 Feb 2025 21:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZEDn3XVEt6akZzZOwx/nZAjeG/MuYCZj63IsLrgaYEk=; b=WmH2osTSJ20ylj5+d9THN6BIFp
	b3LLBoHZ+Na46eufgUcPjkD4cLQxpLL/LUfwbAAjZk0GK/i5/g2aLqU+HD3o/Cg5PZXgYxx96ABie
	VFKKfWXD/1LdzTX8FHMXXBH7ntBUL9EeLzt4HJmnu3H1ZLm4sfT0KzfKnjJc5eSsuwBY2/2eqVX/y
	IgOKFDdOTMPXCpAUI12jOEv7d67gE/0+bfxM80GgxHfH4Y0nyKHJy+CxGWqli7WVNgHXtfF13NSR1
	ZEqiltp/DyDk1Uew/SewcE37PHnl27AD0ZTIu96ggq/OON2PxbyCUILOjxhFzmiHiTXcWi+V7yI/M
	kCcTJYRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4FU-0000000Ghl4-36Q2;
	Mon, 03 Feb 2025 21:44:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4FR-0000000GhiB-0hCZ
	for ath11k@lists.infradead.org;
	Mon, 03 Feb 2025 21:44:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513LckYv029122
	for <ath11k@lists.infradead.org>; Mon, 3 Feb 2025 21:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZEDn3XVEt6akZzZOwx/nZAjeG/MuYCZj63I
	sLrgaYEk=; b=ZvmaUI06rR7bRNd5SvmSsuMWmWpoBYo9YvIG3EzSI76BN4kjFCw
	AWP+Mldenx6Lovr3t3IbLvsbJ2NMVl09UBsqE0kX7sSu+vBU+Y9uyJopGJNTWBh/
	Fnd2W/caboMvF3FdWJoYgSqKpq09Z5WvZo0yiw6omgq5zlVNjwCa2FvMSpn5HW6Z
	FNisD1iW3iYeakW1sqmvTYJWHM6Y5OO7cZXlmwv7f3nLw6GYCOUh+FLbG3IocHdf
	PfQgknFNW9w1MqR0oLDOMH3tmw76zq30fwiapPd6GYO1ZT4S29uav2UaYIY8Suh8
	aqJo3XW8XyGx3yQXkgD0tK+i2qy8cTSGdfA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k5w5r0a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 03 Feb 2025 21:44:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21648c8601cso91241025ad.2
        for <ath11k@lists.infradead.org>; Mon, 03 Feb 2025 13:44:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738619091; x=1739223891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEDn3XVEt6akZzZOwx/nZAjeG/MuYCZj63IsLrgaYEk=;
        b=MKjgY2/40AhnIh3uFOSjFMUmNTQEUnURwx0QE/5xCh1UOMrh/ytZ3Zz5qHfB9LVKap
         PI9N9mug7twnZqKlw0W/aJ0AtUHf3z1e/FacJ+NUCmLqBZbzz/Y8UxPBAvZillDhfpPn
         3YcOrui87SKmUfoW1WwXn71l6h+ix0ZNj44hzP0CiV/oUVF2QFgUoHIivPEgDMMH6MjS
         XpIAYey/3S8rSlIJBRJq4ZqAO+G2SYkGVE2FKEjFJdyEOnLIEEsFRSyAzfnVdKu5DRy1
         ikYm6g8X8b2zaTyqt4EuDzj8P/3/VwgftognaadRy6bxrRcm4LqbfrgqQ4A3OTkezujv
         rghQ==
X-Gm-Message-State: AOJu0Yz0mR3ZLBmg/4kSEiVCc/lHn3D6Rh+LdDAvGNTwEX+6whMKfLmk
	OczKX2oz5p3yaKNjdou+UjsVfouHXkIwKbDBYxPGCpDS1yotmgGZNHJd0OprF/Byc8netr0IPDu
	Eux78mMCt0lB0j8vL6wiwiHbFvvnOOw0l7ZKpsIRZfKe+DJ5vtS/0jgo1+wpO5YIu1ijS
X-Gm-Gg: ASbGnctqF2TX6ctMVjC6yC238G04/jiMYzPd8Dq5+Fq1wwrFU4WPATIxXFPjqneAWJz
	MFtn9crvzkLHTRLGE0CXG04Wg1x1OMn1j2IXSy+NbAJfTLXR06bOs5pOsHwP6+YKccpcSGJH4qi
	FptQ4bVUGvNjPQJaZVHkpLLJgazKaYwvFrbdvXz/1nFZ8buOaYFbE6xozYhhrPOntD18//mRZGT
	PJ08eV+csBs/wUmn6f0Jq1+eD/YDkD5tyISKYGwxoYzDfKnRggWOi0OByPDrVluVov2DlCvF3iU
	bF+KqJseeUa1PVDck3qzXQ+Bjt9IotzvlPLY6Z4fgbSc1pay8uGLKpE4h2Fh
X-Received: by 2002:a17:902:ecc7:b0:215:9d58:6f35 with SMTP id d9443c01a7336-21dd7c55feamr355493675ad.1.1738619090870;
        Mon, 03 Feb 2025 13:44:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJSldFMmHAs1GyZjxpsdqWbVw/GYRVeb9lNA6EfYL17e+NvTXnW1K4z1HGv1AicIKVEuGm+g==
X-Received: by 2002:a17:902:ecc7:b0:215:9d58:6f35 with SMTP id d9443c01a7336-21dd7c55feamr355493485ad.1.1738619090559;
        Mon, 03 Feb 2025 13:44:50 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331ce6asm82357895ad.209.2025.02.03.13.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 13:44:50 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v3 0/5] wifi:ath11k/ath12k: refactor tx_arvif retrieval
Date: Mon,  3 Feb 2025 13:44:43 -0800
Message-Id: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DBR07MhQPv4G0iXuULSK5vuW8lKva2rZ
X-Proofpoint-ORIG-GUID: DBR07MhQPv4G0iXuULSK5vuW8lKva2rZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=958 spamscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502030156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_134453_215119_2BCDD005 
X-CRM114-Status: UNSURE (   8.96  )
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

MLO MBSSID series for cfg80211/mac80211, which is in review here 
https://patchwork.kernel.org/project/linux-wireless/list/?series=902914&state=%2A&archive=both,
changes the way transmitted profile data is stored for each link.
As drivers currently retrieve 'arvif' for transmitted profile at
multiple places, MLO MBSSID changes will becomes unnecessarily
bloated with RCU operations for every retrieval. Refactor 'tx_arvif'
to avoid this.

Additionally, fix an issue in ath11k_mac_update_vif_chan() where
tx_arvif is not reset to NULL inside 'for' loop during each
iteration.

v3: address comment from v2 and removed NULL check for
vif->mbssid_tx_vif from patch #1.

v2: fixed kernel test robot error in patch 1/5 for tx_vif.
https://lore.kernel.org/oe-kbuild-all/202501160626.Jbb3GHnk-lkp@intel.com

Aloka Dixit (5):
  wifi: ath11k: refactor transmitted arvif retrieval
  wifi: ath11k: pass tx arvif for MBSSID and EMA beacon generation
  wifi: ath12k: refactor transmitted arvif retrieval
  wifi: ath12k: pass tx arvif for MBSSID and EMA beacon generation
  wifi: ath12k: pass BSSID index as input for EMA

 drivers/net/wireless/ath/ath11k/mac.c | 75 ++++++++++++-------------
 drivers/net/wireless/ath/ath12k/mac.c | 81 +++++++++++++--------------
 2 files changed, 76 insertions(+), 80 deletions(-)


base-commit: 1ed13fdf7d8284742c8ede36dd553387839e5163
-- 
2.34.1


