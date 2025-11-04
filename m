Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029A2CCFA07
	for <ath11k@archiver.kernel.org>; Tue,  4 Nov 2025 16:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mFND1X/VRImRfWFC66Y712TFqLxcKNdin1F++KljD5M=; b=U5vE8NQC4RRwiSbuFDxQFtE/dA
	03JfJjipIZRC6Ql52hSHQPieEh8KiclsBxfRL6D9rykWQx8MxkJYJ2q5yscktUluJqLSynC5d6uOB
	YK4/inmv07QyZwQbGzYcPU0FdJyxFolca+kkizyjPBDZEUNlTmbrHHpreRWCGwznRKkOG+yFdD7jA
	DNaIuPMcVmwqV7/IrJbED7B84Hz6a723ypiOZKVRVVDHWEvJE9rzkhfBe76BvW+u18W3w7tqCzJuH
	Q6pwycp7hjN9pfxuIgKyqFKnmQ7clcqe7Pcl1WNvMomLPoe9anFUZpAn2rkFfVmCH9wc0kIf8TFvc
	pEc12HEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJrk-0000000CBdP-2mip;
	Tue, 04 Nov 2025 16:26:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJri-0000000CBcF-2X4P
	for ath11k@lists.infradead.org;
	Tue, 04 Nov 2025 16:26:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4CfUuD2048859
	for <ath11k@lists.infradead.org>; Tue, 4 Nov 2025 16:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mFND1X/VRImRfWFC66Y712
	TFqLxcKNdin1F++KljD5M=; b=R6ge4vjnLEKAlkKDqm5c/ePW16kcLlfSo5RYs2
	Dp3AxIcx0+XBjLpnuxGmLnlxjF/ry12iIRrtuCPcy4SSnEZr1w9DQWRvGXBWNg6N
	f/+ofv3QE+JWdT0gOQyGDKhkT8wtVkWLHM55MXQOjAX/QEq9S9PiuWMAy3Eu5MGU
	yRcgI+QQqmwXOKi9kMsoKsV+fuIJuhFtfQ/OcB87D3+wMoxZtXAtalt3nIgXrhJk
	hi1ZNVnNZ7PtK5CHwsCl5ryyk0GFFIyOHG+P8B61xfr81uv0XCo+1x41SN84Qysd
	+IuLEtZ0vn70Xfj1P1hq7Kz4xuHvlCOzsyS/KUQtta1BhTwg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7f251313-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 04 Nov 2025 16:26:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2698b5fbe5bso91764375ad.0
        for <ath11k@lists.infradead.org>; Tue, 04 Nov 2025 08:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762273595; x=1762878395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mFND1X/VRImRfWFC66Y712TFqLxcKNdin1F++KljD5M=;
        b=OWxAPIzFrG1M2aUwYHv6loDxpmYqxOxSrbvkmGuVbrIDmGyWau38EbC14GEfP5KlCN
         WETZ2b21/adfmvxk0i5z071BgKShL8rt82M8JN7ZBtfdbMlebzh1wYFYoTjADVLCBW7f
         ykQUd4AAc8gFy3Vu7q3CoUpCViLkIjS46nvVzNVqv5ZQqTUGoE6Gza6phZwj+A/N9gzy
         2xS1OBiOB5LFxHI+hubA1A9A5kT/7NZO6Bzt2zWhxY8Jjg+hRgcLFvFstbctzdSQX5b9
         5d5e37XnpMm5wkcKZbHVd1E6UPHK8f57eARQnGmF1Z4K5FSFWQKtUwmuO+0fV8BYbUjc
         KPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762273595; x=1762878395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFND1X/VRImRfWFC66Y712TFqLxcKNdin1F++KljD5M=;
        b=HONLh7pVh3xdodlGrWgYuvGbSjhsPLggnou55tBI95wXMz/k2iw1oSyAUMx7FAgyhk
         +u+wnRESm2kNSMORX0LAbxtr8ecaMNI9SSO76blbVP1Qrog0S8qHaYYHDnfwWw5ecFa8
         R3P769QMpBGQ4yqGyplqlV9udWake2FqM5zTbSgNl98DMabVGAG6gfCTsVQ7b23YtCHI
         SsliOBHl+O7Hi7Tt+4YbJj82LREaFTEulQsQ9HfpWskIjYAvGn21yYLsATnbzIbwhSfy
         J4cG5ge/zK8O6o+diPy0gyhZmokV0ktUoGYxcuqmQFcoj95EaK8GBRl5DiNj16ZQQ0dN
         Q74w==
X-Forwarded-Encrypted: i=1; AJvYcCURbexg2dUwXTZt/MoZC25YRJzvlLPYF4etWaXooAlnR9s2a0VcXAQg69329R/d+QnAOy2evGA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2RkAs0WkdvRuwzAVHvZNmBIo49lFs7E2qNHAz9qbruiJg2G1c
	iow4HoT/ZMLaFgOPx9k7TUBPp3ktUq28A3ekmxHTTfaWMKfFs+NTDobyELm8eb/OBtgcFhVIBho
	9OEmOopGyWXihUy3MUbz58s6WbM1s+Z0EKUcz1Aiuonez/M2ZgzSM0mu7DB2MCHga
X-Gm-Gg: ASbGnctayHQLvCu8RCUhhXwVtU79SKN861FxnlHjTxhVwDJHu2QpX0pXhD7/+wUeX/Y
	TubfpEP4M2PwrzkcFytt4rn7GFc28BRStbBmfGIp8cxT+W4rxn3ZlLm5VBzgbSGoLVZrCy/xY6e
	FJA5qN9MS0jz3UB0kZF3sXdmUsvHCelIyKr2D4IX8KLmI6SSEbhFxAVkveG7H68/W8SXjeB01hD
	dRTeliPbYn+NGjwIJQpcS86Ccf146jjBaSlf+5JtdnUgAbww1+jJC/79ikOtZa04b+zzGnfW/C1
	R0fpjsM0FwQ5Fu5wldIl1ysp8hs4C79Y+Aig6lnXotXZbk0TMRmGQaQhu02PFSTPKWny1WRWd5y
	Wu2b5tj9+ivQm4DPrSf9XeNFXnazCskpfmKJ8eUvVGY6y
X-Received: by 2002:a17:902:fc45:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-2962ada4d6bmr2508565ad.18.1762273595467;
        Tue, 04 Nov 2025 08:26:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBUwXeVwkSk0IirZkEPPbrkJQYnb/rbwE7ff67TC2LgRxXyedOxM6ikgcQcHtDZv4YQt7Hug==
X-Received: by 2002:a17:902:fc45:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-2962ada4d6bmr2508025ad.18.1762273594713;
        Tue, 04 Nov 2025 08:26:34 -0800 (PST)
Received: from hu-yuzha-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a7a8a9sm31508435ad.107.2025.11.04.08.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 08:26:34 -0800 (PST)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: baochen.qiang@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: [PATCH ath-next v2 0/6] wifi: ath11k: Add single shot/periodic CFR capture support
Date: Tue,  4 Nov 2025 08:26:27 -0800
Message-Id: <20251104162633.3007874-1-yu.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dNyrWeZb c=1 sm=1 tr=0 ts=690a293c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=hBgn-SwW0Swv5iSSo8sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BQNQcaravZ4m2P-OuJb58rd2X7pqz6i6
X-Proofpoint-ORIG-GUID: BQNQcaravZ4m2P-OuJb58rd2X7pqz6i6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEzNyBTYWx0ZWRfX/F1iswk+1Fgr
 JcQjs+3FBmiiutWxfZDvVSk4EEs7gJ7L1304xi0xoO+7974YWhn0sAnArP48o6CoxApxnch/8Ta
 3t+noVn2lKxKAveLEgBOXj0T8dk/mPLeD6PjfapESKHQugZSUnlgcVs8LFanL0YL0ehmYqSWZTo
 VeBqI99o2UANsF+WL8aX7xYhBrAzIYpjC5CcmJpSXlzqi1UxsnkTX8WSmo/GyFOr95khQyBjDb1
 GscOK8AkxRA/JmFWJ25hAD9FdfHyu8aYJ79abeNtplYo+cYIcR4wLYuq3YLvJzuuL7DfQ6fuGz0
 2XdzBC0cqIz0mBtWMbaJ7674UthZDTuQ3SFF3kwDF0izD6vntVtSv4jOWd43ix4RDAhYFbCBNkw
 l+oN0GNChHnhe3PtVZpfUo0Y/VLv/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_082638_785648_93FDDF1C 
X-CRM114-Status: GOOD (  13.13  )
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

To enable/disable cfr feature use command,

echo <val> > /sys/kernel/debug/ieee80211/phyX/ath11k/enable_cfr

where, val: 0 to disable CFR and 1 to enable CFR.

To enable CFR capture for associated peers,

echo "<val> <bw> <periodicity> <method>"
 >
/sys/kernel/debug/ieee80211/phyX/netdev\:wlanx/stations/<mac>/cfr_capture

val: 0 - stop CFR capture
     1 - start CFR capture
bw: CFR capture bandwidth
     0 - 20MHZ
     1 - 40MHZ
     2 - 80MHZ
Periodicity: Periodicity at which hardware is expceted to collect CFR
dump.
     0 - single shot capture.
     non zero - for Periodic captures (value should be multiple of 10
ms)
method: Method used by hardware to collect the CFR dump.
     0 - from the ACKs of QOS NULL packets.

To enable CFR capture for unassociated clients,

echo “<mac address> <val> <periodicity>”
 > /sys/kernel/debug/ieee80211/phyX/ath11k/cfr_unassoc

Mac address: mac address of the client.
Val: 0 - start CFR capture
     1 – stop CFR capture
Periodicity: Periodicity at which hardware is expceted to collect CFR
dump.
     0 - single shot capture.
     non zero - for Periodic captures (value should be multiple of 10
ms)

To collect the cfr dump,
cat /sys/kernel/debug/ieee80211/phy0/ath11k/cfr_capture0 > /tmp/cfr.bin

Previous link:
https://lore.kernel.org/all/1645005922-7252-1-git-send-email-quic_vnaralas@quicinc.com/

Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>

---
Changes in v2:
 - Update related comments. 
---

Venkateswara Naralasetty (6):
  wifi: ath11k: Add initialization and deinitialization sequence for CFR
    module
  wifi: ath11k: Register debugfs for CFR configuration
  wifi: ath11k: Add support unassociated client CFR
  wifi: ath11k: Register relayfs entries for CFR dump
  wifi: ath11k: Register DBR event handler for CFR data
  wifi: ath11k: Register handler for CFR capture event

 drivers/net/wireless/ath/ath11k/Kconfig       |  11 +
 drivers/net/wireless/ath/ath11k/Makefile      |   1 +
 drivers/net/wireless/ath/ath11k/cfr.c         | 994 ++++++++++++++++++
 drivers/net/wireless/ath/ath11k/cfr.h         | 301 ++++++
 drivers/net/wireless/ath/ath11k/core.c        |  41 +-
 drivers/net/wireless/ath/ath11k/core.h        |  19 +-
 drivers/net/wireless/ath/ath11k/dbring.c      |  50 +-
 drivers/net/wireless/ath/ath11k/dbring.h      |   8 +-
 drivers/net/wireless/ath/ath11k/debug.h       |   8 +-
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 143 ++-
 drivers/net/wireless/ath/ath11k/hal.c         |   3 +-
 drivers/net/wireless/ath/ath11k/hw.h          |   5 +-
 drivers/net/wireless/ath/ath11k/mac.c         |  17 +-
 drivers/net/wireless/ath/ath11k/wmi.c         | 147 ++-
 drivers/net/wireless/ath/ath11k/wmi.h         |  97 +-
 15 files changed, 1819 insertions(+), 26 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/cfr.c
 create mode 100644 drivers/net/wireless/ath/ath11k/cfr.h


base-commit: 059ca8fd692b67a77fb89e9d4e8f57cf08e32b08
-- 
2.34.1


