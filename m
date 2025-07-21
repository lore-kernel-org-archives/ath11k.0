Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7E8C83F26
	for <ath11k@archiver.kernel.org>; Mon, 21 Jul 2025 23:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UD7kEq3kjBGfnHnxGteIlKswmtx+ENzmKSEZ2T3PVsk=; b=KstLXfpwR2Ga7Pwlai1AAGN7KP
	WSySAx9+TKzmUEy3wzqG2eDp6G7nlwqV0Ot/KohZGsD1TC+hrAk8ehDtK58fszbaKNPg1bcxlyrG1
	mcK244hBWMECxN6eWvvhK1nnIePds/7edWQkaDT5VW905zBZQB0uDSphFCACeYh8261ikJsZEEbW6
	qBDm6gbWkggmo47mIpMSLug1GtSueN6pG767MesP8OOrcu5yAca3rTFoic78P/p+q5gNH+kF9LR0V
	A+ZvUNpEEEwC0HPM9OigDC9Xwt/L45PLw4JGyyxlVOI5e/09WAf1LuRjI5yVRWA4TbPXYYT5DAwhr
	fj1/HbxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udzgy-00000000rt5-3PLM;
	Mon, 21 Jul 2025 23:13:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udzgu-00000000rrH-3t27
	for ath11k@lists.infradead.org;
	Mon, 21 Jul 2025 23:13:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LIe25H004441
	for <ath11k@lists.infradead.org>; Mon, 21 Jul 2025 23:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UD7kEq3kjBGfnHnxGteIlK
	swmtx+ENzmKSEZ2T3PVsk=; b=YVhPaw6Eq2LWfMDalc5SgS7VFDIgwsQfLQ8eAy
	EjLsEdgz6wzaoGl9MDe8RgRiGfEHJYNfmy0Mdd2IbE6BOtc7RdNDJXOFU86VbVhs
	KexuOG9YFpotEBQXvVlj+Hz9NDy8p2oStxpzRweoUNcfOHIGb0wJQi8zLkGp0QY6
	ejKaKCnP4B1IOBF5E/HUkGtMtsRaaDYYVLsRowdZboxmpq/AX1oIcfSmT2qpognl
	LhLlUzoK+i+qOxhnHwGapgxFiEFJa4b1cGpwG5SaNKBLR+R9AiwKYHA/jFT9dXwo
	ifG+YHC4oIEDlX6Jnd/+yje+CYJOgcCnzojeGecIIDt2pyCA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045vwrd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 21 Jul 2025 23:13:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2363bb41664so38220945ad.0
        for <ath11k@lists.infradead.org>; Mon, 21 Jul 2025 16:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753139583; x=1753744383;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UD7kEq3kjBGfnHnxGteIlKswmtx+ENzmKSEZ2T3PVsk=;
        b=M/Bjv5j6EiLjhMtrn8L5NdXvf8JeaKbyGGBrBuFK7Wf24tN1pJ+baB4U2wE/+tNDLu
         epmSgz5tp/UmLRr/fUOgGbs22sGUfQcFVCBHshOYyOv7fcp/RdH9wjJwZ+bVCgrJehmj
         t/dx1DRSjoU9X3g3amzl+kY1RDk3XgW02jbcsrIaJfL0jP30BtThqVqRUSJYOH0+rt4w
         qkEnZhc6WPEHMoCxS48X16+UCaxPiTX1IHAR6mXJOeKoCXJ99eZSTsYki+on6qDKepDz
         mb+uHCv+MLECX1KcExRJp4MY4sZxSMMsF1wZIIk00Fiev3f+kY+5IPUyYsAIW6SR+hqs
         6vzg==
X-Forwarded-Encrypted: i=1; AJvYcCXLCsHKmO/IJXf7GvKp7X5ZKLXj8JuXbOsBSGbBqFWgHDXtcOl4rP2SA/ySyJO7eceF6deY/UI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxoTUx8lMxEQpAyve/jACLTKzo47Dvo76AGhjqNy5fxas6RfUWx
	0UbV88QDt3qlafw3GOG1xdgjGq8vtMleOhnR/q9MGChlf4BwpECSoAhu9EoJ45+hyhbP2Lmd7bK
	pB6GU4ActoYgo8OZ70RDMjGRe7akK4gWDgdGEYuvsi8vgQONCwZlysKN2uLL9+Kw3
X-Gm-Gg: ASbGncvYiP/PkKFrk0Vo8A18I1I95Ix5JSBH/aG20V1YQCdiO2ypNY8wJcd3HaqtJbO
	UF9T9owQM5v7ju+80sIyCimw3/PjR6Dmy62Ak4EyP2UNF0jvgHligqRvejmQ1vjXgNWVkJGedjc
	llwISuuQox/9CQ/Ofmoz/uHkLUVTfXjbXq1PlsiLfor1xRtX8xEZzk4ey/YPopczfJ4PJrxEtbU
	uRPX0Bgp4JOvk6Ky/syVIgcoOmku7PsVkzganc0kAZH2CW+zP5vr1VWU4C9hsiGUSOBjEfWhB9h
	q+RgebnJkl4LesYfQTwjXAYrq64Z+0P+4KgoPYZR8rTWMPMQiAfV4TpB7rvEbFYELarfXI+o6tc
	E
X-Received: by 2002:a17:902:f650:b0:234:24a8:bee9 with SMTP id d9443c01a7336-23f8abefcd0mr16030755ad.4.1753139583041;
        Mon, 21 Jul 2025 16:13:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiXOoyw/3pUDeyM5jLlBxiHNJ7SLqzHGpr9fe0bHIzEuRwklScSGuJbZLYz8JuGnIgdx3dRQ==
X-Received: by 2002:a17:902:f650:b0:234:24a8:bee9 with SMTP id d9443c01a7336-23f8abefcd0mr16030495ad.4.1753139582478;
        Mon, 21 Jul 2025 16:13:02 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3d4esm63646405ad.23.2025.07.21.16.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 16:13:00 -0700 (PDT)
Message-ID: <124a13a2-e727-46db-b1cf-d370088b7fbd@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 16:12:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20250721
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687ec980 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=cecSKI3_BKC6A8wipHcA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: emqcrHWvhOGRSb_X-2Vu0X6KOwapaWK-
X-Proofpoint-ORIG-GUID: emqcrHWvhOGRSb_X-2Vu0X6KOwapaWK-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDIwOCBTYWx0ZWRfXwpXKyTkEp+oz
 tihHGEN/IeovHIJ/a7SSoDQJwbvwdNOqGK/VpSRmoRLmeiFzAl9djTBmpx9D7rfdaLTdaBZgy9J
 8ph06j4bVU7YTJvJGBSLI1Au9mDYj00ojiARjmE2+NVg0dEsLayUjfmrlYEev5DXBlxX58RtaDH
 f3B68wc22v1q81G338cpk3boFH5UoPhRM5HmWY2QnfHG+m+PqDDcYGk2/Xkz54xySOUUCxwyi/3
 6UyfClXuxNmOownegmcYiiyyP/iBjIEGUGGYfrTplQogdQr/28njVRt63pTls10mVPGoEATQSgy
 gbC5S3P5NGbUDfWJnQ/0khSw3ypOfHcjvLLNBbm/kJrUY7Sz6vu3ctYgEoMtBwNKTwea64r98q2
 uA3OToHR1Vu0s672bNNpqnkZRVFoRghhpRmhBUPCDtCaGyyjq/MHlJr17G2CAcwZPrgk3x6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_161305_019009_22DBC585 
X-CRM114-Status: GOOD (  15.05  )
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

The following changes since commit 28aa52b6189f1cc409f96910c63fa1b99370b99e:

  Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2025-06-26 10:40:50 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20250721

for you to fetch changes up to 4a2bf707270f897ab8077baee8ed5842a5321686:

  wifi: ath12k: Correct tid cleanup when tid setup fails (2025-07-21 14:34:01 -0700)

----------------------------------------------------------------
ath.git patches for v6.17

Highlights for some specific drivers include:

ath9k:
Add AHB "of" support

ath11k:
Support device-specific firmware override
Fix potentially reordered access to device memory

ath12k:
Add more Wi-Fi 7 functionality
Add more statistics to DebugFS
Support different memory profiles
Support 802.11 encap/decap offload to firmware
Fix potentially reordered access to device memory

And of course there is the usual set of cleanups and bug fixes across
the entire family of "ath" drivers.

----------------------------------------------------------------
Aaradhana Sahu (6):
      wifi: ath12k: Block radio bring-up in FTM mode
      wifi: ath12k: Add a table of parameters entries impacting memory consumption
      wifi: ath12k: Remove redundant TID calculation for QCN9274
      wifi: ath12k: Refactor macros to use memory profile-based values
      wifi: ath12k: Enable memory profile selection for QCN9274
      wifi: ath12k: Use HTT_TCL_METADATA_VER_V1 in FTM mode

Aditya Kumar Singh (4):
      wifi: ath12k: fix timeout while waiting for regulatory update during interface creation
      wifi: ath12k: add support for Tx Power insertion in RRM action frame
      wifi: ath12k: advertise NL80211_FEATURE_TX_POWER_INSERTION support
      wifi: ath12k: Add num_stations counter for each interface

Baochen Qiang (3):
      wifi: ath12k: remove unneeded semicolon in ath12k_mac_parse_tx_pwr_env()
      wifi: ath11k: fix sleeping-in-atomic in ath11k_mac_op_set_bitrate_mask()
      wifi: ath12k: bring DFS support back for WCN7850

Colin Ian King (1):
      wifi: ath11k: Make read-only const array svc_id static const

Hari Chandrakanthan (1):
      wifi: ath12k: Fix station association with MBSSID Non-TX BSS

Hariharan Basuthkar (1):
      wifi: ath12k: Send WMI_VDEV_SET_TPC_POWER_CMD for AP vdev

Harshitha Prem (1):
      wifi: ath12k: update unsupported bandwidth flags in reg rules

Jeff Johnson (4):
      wifi: ath12k: pack HTT pdev rate stats structs
      wifi: ath10k: Prefer {} to {0} in initializers
      wifi: ath11k: Prefer {} to {0} in initializers
      wifi: ath12k: Prefer {} to {0} in initializers

Johan Hovold (10):
      wifi: ath11k: fix suspend use-after-free after probe failure
      wifi: ath11k: fix dest ring-buffer corruption
      wifi: ath11k: use plain access for descriptor length
      wifi: ath11k: use plain accesses for monitor descriptor
      wifi: ath11k: fix source ring-buffer corruption
      wifi: ath11k: fix dest ring-buffer corruption when ring is full
      wifi: ath12k: fix dest ring-buffer corruption
      wifi: ath12k: use plain access for descriptor length
      wifi: ath12k: fix source ring-buffer corruption
      wifi: ath12k: fix dest ring-buffer corruption when ring is full

Kang Yang (1):
      wifi: ath10k: shutdown driver when hardware is unreliable

Karthikeyan Kathirvel (1):
      wifi: ath12k: allow beacon protection keys to be installed in hardware

Maharaja Kennadyrajan (2):
      wifi: ath12k: Add support to TDMA and MLO stats
      wifi: ath12k: Add support to RTT stats

Miaoqing Pan (2):
      dt-bindings: net: wireless: ath11k-pci: describe firmware-name property
      wifi: ath11k: support usercase-specific firmware overrides

Nithyanantham Paramasivam (3):
      wifi: ath12k: Fix the handling of TX packets in Ethernet mode
      wifi: ath12k: Fix TX status reporting to mac80211 when offload is enabled
      wifi: ath12k: Advertise encapsulation/decapsulation offload support to mac80211

P Praneesh (1):
      wifi: ath12k: set RX_FLAG_SKIP_MONITOR in WBM error path

Pradeep Kumar Chitrapu (8):
      wifi: ath12k: push HE MU-MIMO params to hardware
      wifi: ath12k: push EHT MU-MIMO params to hardware
      wifi: ath12k: move HE MCS mapper to a separate function
      wifi: ath12k: generate rx and tx mcs maps for supported HE mcs
      wifi: ath12k: add support for setting fixed HE rate/GI/LTF
      wifi: ath12k: clean up 80P80 support
      wifi: ath12k: add support for 160 MHz bandwidth
      wifi: ath12k: add extended NSS bandwidth support for 160 MHz

Qianfeng Rong (1):
      wifi: ath5k: Use max() to improve code

Raj Kumar Bhagat (2):
      wifi: ath12k: handle WMI event for real noise floor calculation
      wifi: ath12k: use real noise floor instead of default value

Rameshkumar Sundaram (1):
      wifi: ath12k: Fix beacon reception for sta associated to Non-TX AP

Rosen Penev (4):
      wifi: ath9k: ahb: reorder declarations
      wifi: ath9k: ahb: reorder includes
      dt-bindings: net: wireless: ath9k: add WIFI bindings
      wifi: ath9k: ahb: replace id_table with of

Saleemuddin Shaik (1):
      wifi: ath12k: Add support for transmit histogram stats

Sarika Sharma (8):
      wifi: ath12k: Add memset and update default rate value in wmi tx completion
      wifi: ath12k: fill link station statistics for MLO
      wifi: ath12k: add link support for multi-link in arsta
      wifi: ath12k: add EHT support for TX rate
      wifi: ath12k: correctly update bw for ofdma packets
      wifi: ath12k: fetch tx_retry and tx_failed from htt_ppdu_stats_user_cmpltn_common_tlv
      wifi: ath12k: properly set bit for pdev mask for firmware PPDU_STATS request
      wifi: ath12k: Correct tid cleanup when tid setup fails

Sergey Senozhatsky (1):
      wifi: ath11k: clear initialized flag for deinit-ed srng lists

Sivashankari Madhavan (1):
      wifi: ath12k: support average ack rssi in station dump

Sriram R (2):
      wifi: ath12k: Add support to enqueue management frame at MLD level
      wifi: ath12k: Validate peer_id before searching for peer

Sumanth Gavini (3):
      wifi: wil6210: wmi: Fix spellings reported by codespell
      wifi: ath10k: Fix Spelling
      wifi: ath6kl: Fix spellings

Tamizh Chelvam Raja (2):
      wifi: ath12k: fix endianness handling while accessing wmi service bit
      wifi: ath12k: Add support to parse max ext2 wmi service bit

Thiraviyam Mariyappan (1):
      wifi: ath12k: Clear auth flag only for actual association in security mode

 .../bindings/net/wireless/qca,ath9k.yaml           |   18 +-
 .../bindings/net/wireless/qcom,ath11k-pci.yaml     |    6 +
 drivers/net/wireless/ath/ath10k/core.c             |   50 +-
 drivers/net/wireless/ath/ath10k/core.h             |   13 +-
 drivers/net/wireless/ath/ath10k/debug.c            |    6 +-
 drivers/net/wireless/ath/ath10k/debugfs_sta.c      |    7 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c           |    8 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c           |    4 +-
 drivers/net/wireless/ath/ath10k/mac.c              |   15 +-
 drivers/net/wireless/ath/ath10k/pci.c              |    3 +-
 drivers/net/wireless/ath/ath10k/wmi.c              |    6 +
 drivers/net/wireless/ath/ath11k/ahb.c              |    2 +-
 drivers/net/wireless/ath/ath11k/ce.c               |    5 +-
 drivers/net/wireless/ath/ath11k/core.c             |    9 +-
 drivers/net/wireless/ath/ath11k/core.h             |   13 +-
 drivers/net/wireless/ath/ath11k/dbring.c           |    3 +-
 drivers/net/wireless/ath/ath11k/debugfs.c          |   38 +-
 .../net/wireless/ath/ath11k/debugfs_htt_stats.c    |   15 +-
 drivers/net/wireless/ath/ath11k/debugfs_sta.c      |   11 +-
 drivers/net/wireless/ath/ath11k/dp.c               |    2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c            |   45 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c            |   15 +-
 drivers/net/wireless/ath/ath11k/hal.c              |   39 +-
 drivers/net/wireless/ath/ath11k/htc.c              |    2 +-
 drivers/net/wireless/ath/ath11k/mac.c              |   28 +-
 drivers/net/wireless/ath/ath11k/pci.c              |    4 +-
 drivers/net/wireless/ath/ath11k/spectral.c         |    3 +-
 drivers/net/wireless/ath/ath11k/wmi.c              |   12 +-
 drivers/net/wireless/ath/ath12k/ahb.c              |    1 +
 drivers/net/wireless/ath/ath12k/ce.c               |    5 +-
 drivers/net/wireless/ath/ath12k/core.c             |   80 +-
 drivers/net/wireless/ath/ath12k/core.h             |   44 +-
 drivers/net/wireless/ath/ath12k/dbring.c           |    3 +-
 drivers/net/wireless/ath/ath12k/debugfs.c          |    8 +-
 .../net/wireless/ath/ath12k/debugfs_htt_stats.c    |  564 ++++++-
 .../net/wireless/ath/ath12k/debugfs_htt_stats.h    |  207 ++-
 drivers/net/wireless/ath/ath12k/dp.c               |  138 +-
 drivers/net/wireless/ath/ath12k/dp.h               |   43 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c           |   29 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c            |   72 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c            |  155 +-
 drivers/net/wireless/ath/ath12k/hal.c              |   40 +-
 drivers/net/wireless/ath/ath12k/hw.c               |   55 +
 drivers/net/wireless/ath/ath12k/hw.h               |   32 +-
 drivers/net/wireless/ath/ath12k/mac.c              | 1669 +++++++++++++++++---
 drivers/net/wireless/ath/ath12k/mac.h              |   17 +
 drivers/net/wireless/ath/ath12k/pci.c              |    6 +-
 drivers/net/wireless/ath/ath12k/peer.c             |    5 +-
 drivers/net/wireless/ath/ath12k/peer.h             |   28 +
 drivers/net/wireless/ath/ath12k/qmi.c              |    2 +-
 drivers/net/wireless/ath/ath12k/qmi.h              |    6 +-
 drivers/net/wireless/ath/ath12k/reg.c              |   31 +-
 drivers/net/wireless/ath/ath12k/wmi.c              |  359 ++++-
 drivers/net/wireless/ath/ath12k/wmi.h              |  165 +-
 drivers/net/wireless/ath/ath5k/phy.c               |   12 +-
 drivers/net/wireless/ath/ath6kl/core.c             |    2 +-
 drivers/net/wireless/ath/ath6kl/hif.c              |    2 +-
 drivers/net/wireless/ath/ath6kl/htc.h              |    6 +-
 drivers/net/wireless/ath/ath6kl/htc_mbox.c         |    2 +-
 drivers/net/wireless/ath/ath6kl/htc_pipe.c         |    2 +-
 drivers/net/wireless/ath/ath6kl/init.c             |    4 +-
 drivers/net/wireless/ath/ath6kl/main.c             |    2 +-
 drivers/net/wireless/ath/ath6kl/sdio.c             |    2 +-
 drivers/net/wireless/ath/ath6kl/usb.c              |    6 +-
 drivers/net/wireless/ath/ath6kl/wmi.c              |    2 +-
 drivers/net/wireless/ath/ath6kl/wmi.h              |   10 +-
 drivers/net/wireless/ath/ath9k/ahb.c               |   60 +-
 drivers/net/wireless/ath/wil6210/wmi.c             |    2 +-
 drivers/net/wireless/ath/wil6210/wmi.h             |    4 +-
 69 files changed, 3532 insertions(+), 732 deletions(-)

