Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376CDD5B161
	for <ath11k@archiver.kernel.org>; Sun, 14 Dec 2025 02:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aH8VFuNHZzzxxgVJ76CVEsKdT0fPzmeMSK5/kOVfaco=; b=znCLu3VXIA05R1KWnq5K7qrUSr
	porKSL1ERFuvFxjcMXnX6fCans1Uzn2T1MgThpQogZvuM2OLJ73szZzZbmp2JrDZf+rBabyUGzuaa
	0Bfpn8ICwfYpUUd3temsEyWIbA1fkBbZXBWgYM+1MYrAlVSZBMlRywOtSquo4HQJZj6frCuhCaEDc
	HqiwIMcA7pdk2ERxsrAa7bqxjBOxKjlgFkPz3JaMa+s2orzOEiVqiiTNCWoByqzuSLvmpbiIYYtD5
	1ke5ll+uzmR1oxaiE7wrk5XsCdIY2TDJ7EdqElYpubRVWDRz5GCaP5Tm83wJWThJiESFi8ukeKRJh
	xrHSU0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUcEe-000000027RE-1uhG;
	Sun, 14 Dec 2025 02:53:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUcEa-000000027Qm-3Rx7
	for ath11k@lists.infradead.org;
	Sun, 14 Dec 2025 02:53:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BDLZP3u319117
	for <ath11k@lists.infradead.org>; Sun, 14 Dec 2025 02:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aH8VFuNHZzzxxgVJ76CVEsKdT0fPzmeMSK5
	/kOVfaco=; b=cdizD84ZXFf3mFCJUxnmt9E8b5HrgpyYJcqkmBavTaMnQduwp3q
	Dejmzv7QsWY43tgDz/8uiExP9hG7JC3Xwa0uFyS6vwsSCwNjMYP4I/BnaC4jS95F
	qchbEdlvblQpLYMAtsVhWYuoFG9r33vJL3aN2yI1HC1U+QJySz9WmAPRHmmpTnVS
	b62k0ucpPV4CsbGy1OTV+Whg77REi0rog+chEu6F6M1yHSMXO5N4xmDqBtKd7dTq
	DZezlw2wp93OnIapAGqbVhjtlTOf9DBQrt+EmyrS16lKJDdjbj/MaFeuT5ezcA6V
	IAXYyYiXTO/IAjyfvLbY7YHPyDS4DXLUWYQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11ds9c9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 14 Dec 2025 02:53:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0d058fc56so2539685ad.3
        for <ath11k@lists.infradead.org>; Sat, 13 Dec 2025 18:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765680798; x=1766285598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aH8VFuNHZzzxxgVJ76CVEsKdT0fPzmeMSK5/kOVfaco=;
        b=crE2f+QBpOTGodQFxU/nqGii0UYXA8mG3l/O7HVD708b15jcJ1/53Av9oSph2zVw2Z
         d7ds9lTbca5mbIuYLpuxctLA/6XzOUe82NVxGpGWfAUNtdJ4IC91HREqYNJFUGFUandv
         rDifnk8Q/zQIOiZlNkeIK4FnhNCIFBK2iPQSB7Ind8OGP+Izjx1Fj5z7U+doG8Vl01Gn
         dhEUYnewZlbnfBAWs8rddfPiMN0d1oy0Mt42e5sI+KEJzHHsRdqhWza8T4DO6aUXl/WD
         V/L/N//auKGFDvEYwnWkaqlALUIv4dgOxyKAj+bQds/cXVtjuXEN7qNfAF9On+bwroMh
         Zbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765680798; x=1766285598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aH8VFuNHZzzxxgVJ76CVEsKdT0fPzmeMSK5/kOVfaco=;
        b=fugog+dDNFh4kCDbQjwsTZItwh5/9DBQL98BBNjgiKsTddvZka8ISR0ZWd2wU1VKyY
         crt6BQfdbFwvFCG2FavoIcRYwo8TTDErn6bumHCkzNbPL0nfqUs7V/nChXZ/240GLI0z
         5WBlEc4laj0ve+z7NTfUb0wqa/sbKaDQTHD0Hq30t6S29dI48TH5N2eJP/HMXQHj6xY1
         CZOp6iMwSXJ+5RpM4OHNDAPzzmMt+N2QfuHQYqu8hNA8HfszKI9X7Who5zUJfaKjDUeC
         m/xno9XxeUuDLhtY9qwJr+z0G7fHh7NpqQOt4F0s8wuVQ+JY2ciPI+UNG+iCIOvanHUn
         8XZw==
X-Gm-Message-State: AOJu0Yz7fphn48jZpcj6sp83Z+YwbvezrMsCZm7IbDpiZRyf7PcsUOag
	AuhONJ+WaNeKkgNv+sMW/niwP8b9H1OT5WtOpT0vV02p2+cl7UyS0zn/PXNX93mYjIUFg7/YSil
	4+prjGbUtJLxBhfG4B/Vv17h0i1mIjHeT3bChIRgN3HGfteidkQuEVQIDCnu3hvnL
X-Gm-Gg: AY/fxX7el3YDdv4AGBXDOdb4fnqiChHAxKI4dwqXFXSxx9kMMjxZ3fhzeVqeSZ6NCRH
	D6E9DUBkeZZg//ZZozp5nX7NYa90tpcteGfcchDnN/0Jjzu4eNkEMiB7u/z/j3OEfdOCUeGctyt
	c8erKaMuPvBHIMb2DgLCU/bx1B6RJABJ5G4SYW0PzrRTXlvvTAWGR5JMFdfp95VC1qC8IPP2G8y
	finLTwynfb9hqm5nj3QhPtDSqa7DyxMf50POBN2F1q6lOa4vlDSwuBQBzV2ecbWy+6f530LjCrM
	ENndq+AN/IvB10ktwmWTFV+BPuVtuyELM+2TpTvLtbNfoGVQStYg7beTrKRvWXMcQnK35BERVY4
	/a27Jfx2c1N0LyjEjE9xHUxkMKiBDPGYbo3DZAVBp/DsfA8xYkBE9Eleo/2+8vSCz8P3X
X-Received: by 2002:a17:903:41c2:b0:2a0:9923:6954 with SMTP id d9443c01a7336-2a099236ad5mr32744565ad.27.1765680798507;
        Sat, 13 Dec 2025 18:53:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuk7ieLO0eMdTzrYSJ4YJIVDoooCUAXe6905vxnet9/eygsLEDZVvbYuTQMTm6OPuQCO86gg==
X-Received: by 2002:a17:903:41c2:b0:2a0:9923:6954 with SMTP id d9443c01a7336-2a099236ad5mr32744315ad.27.1765680798056;
        Sat, 13 Dec 2025 18:53:18 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea01723bsm94148115ad.62.2025.12.13.18.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 18:53:17 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krzk@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v2 ath-current 0/2]] wifi: ath11k: add usecase firmware handling based on device compatible
Date: Sun, 14 Dec 2025 10:52:28 +0800
Message-Id: <20251214025230.716387-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: doyUT_QfVKiB47mYx5GwLrYn5LdpMzFM
X-Proofpoint-ORIG-GUID: doyUT_QfVKiB47mYx5GwLrYn5LdpMzFM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE0MDAyNSBTYWx0ZWRfX38lj+dGRFZtH
 NJarIjjGyNeicIqxNRSoN6GJdy7SvVMdWuMy4tjiHB6FUk/St/nnbd1J6myMt2PvmYZZpFA6nqN
 4YoGGs4q+jpwQG6TlJMbqMr/dxPE04MlgO/4ykd69DEyIrHiUmDD4soKSEUy97eTKKgZdhWxHt9
 5D9XAklFOGxMz+EBsQ5X4l2tg3KtHp9EEzYqO/AzrbXGM/POpwjWJniNDtNjbf7nfqzFq14rpNr
 5lw0/B8FWYRvv7u0Lk9GdTaKP8j64knLABSTTXMq1KErNEdMDN70L1pPipykPAS8Vwwdx7RSeYz
 00AObGA/vKA4n9+yWl0cfb61FiRcB0WEE1dSkaCZQJuc9q33vvNAlUa70siVaT0Yraq4ocEy6Ps
 NQpB/MtkFXhICVT5241UEA3HkCLbxg==
X-Authority-Analysis: v=2.4 cv=cfLfb3DM c=1 sm=1 tr=0 ts=693e269f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ibBZ5ciJxtvWWn4BFuIA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512140025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_185321_008096_361EF9EE 
X-CRM114-Status: GOOD (  10.81  )
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

The 'firmware-name' property was introduced to allow end-users and
integrators to select use-case-specific firmware for the WCN6855.
But for M.2 WLAN chips, there is no suitable DTS node to specify
the 'firmware-name' property. In addition, assigning firmware for
the M.2 PCIe interface causes chips that do not use use-case-specific
firmware to fail. Therefore, abandoning the approach of specifying
firmware in DTS. As an alternative, propose a static lookup table
mapping device compatible to firmware names.

The driver has removed all support for firmware-name, and no upstream
Device Tree files reference this property. Therefore, this patch
removes the property from the binding and marks it as obsolete.

This is a DT ABI-breaking change, but safe since there are no in-tree
users.

---
v2:
- Drops `firmware-name` from completely.
- Updates the commit message to clearly state that the property is
  obsolete and the change is ABI-breaking but safe for upstream.
---

Miaoqing Pan (2):
  wifi: ath11k: add usecase firmware handling based on device compatible
  dt-bindings: net: wireless: ath11k-pci: remove obsolete firmware-name
    property

 .../net/wireless/qcom,ath11k-pci.yaml         |  6 ---
 drivers/net/wireless/ath/ath11k/core.c        | 37 ++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/core.h        |  7 ++--
 3 files changed, 39 insertions(+), 11 deletions(-)


base-commit: c99ebb6132595b4b288a413981197eb076547c5a
-- 
2.34.1


