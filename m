Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616C4C54E90
	for <ath11k@archiver.kernel.org>; Wed, 21 May 2025 21:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r/3UXMfb2V9/v+GzxFHw9E85/8iy/iR2RpL42+vKz6w=; b=bGpiIDshnqOsjZavnJRN08tlWt
	Nbg8b8mQbBP2Zdir5iBtRhLldCc1R/XVEitSXrTQbPL8gyr5/mhmolgaon+obwmrdlvv9604Bj/DG
	WXI5H4LSPUlsoICE+dHwmiqA2+gK2JbFhH1yewMlMt0rUElRNIZ1YSA2Ctl1AuKp/vHf+E0d0qQXd
	Ie2ePOum5jw+ADUD5iZ27X54v2TWIWOJtcBiVVQasdsuXy/owNxYcc3cyzFbdnXqWcjZbvlIOzljS
	oYu6sUZoSmmMMtDNlxtEKzuN+NJ3jAsm7Aa7kuDxUqvRbjU3mRCm58oUXLcg8mFYDv21aw4FoBltP
	J7v5SWvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHrDh-0000000Gsb2-1tXy;
	Wed, 21 May 2025 21:43:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHrDe-0000000GsZv-31OA
	for ath11k@lists.infradead.org;
	Wed, 21 May 2025 21:43:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIRP4n029159
	for <ath11k@lists.infradead.org>; Wed, 21 May 2025 21:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r/3UXMfb2V9/v+GzxFHw9E
	85/8iy/iR2RpL42+vKz6w=; b=XcKW2Jr0btNQoXWXue/2dhDd30xmh5mJq2JwIF
	/bS/z0C6ntI0/frtZNc1MoP/eDEyTy4U8Ti9f4AhqRsXimecgdsaQeLZVN+lLKCN
	f8ykyOwfvzFytgPMbvaRYd87AV63fwRV7Vaf3L7sEHXMQlICttffqli+ZI8u4Oee
	otdy4dSMOuX/Gjq4b1oCMEEExlw2rfwhKkl0GhwvRto4nq83xKcdlHPJp1e3vj3T
	B+pIUV7Vs7as68VSd/vVjB3DMLDLudiq1MnY7f04DVmdYUrI+3Zbh/huyouTcHdQ
	ri7la+SQ7KAR1za9R/++HOL/7EFSfLOR33AHSbTRHwgtZc7A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf44bqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 21 May 2025 21:43:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3108d5123c4so1055091a91.1
        for <ath11k@lists.infradead.org>; Wed, 21 May 2025 14:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747863801; x=1748468601;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r/3UXMfb2V9/v+GzxFHw9E85/8iy/iR2RpL42+vKz6w=;
        b=uT/XvrVdhLq2UNxRT4JNfOBdPQuIgCpIcwPAQAS41LGdolOkCULyPdBQHVLkNnZgDS
         2zni2pIo51FLGIM+TFP5GypXi4ihKWM6B8LB8VLJnrHi4MILGw5l6KwnQYYad0lisUYj
         kDgDOf8cbT7Ks0OlR+wQWH/kVgvO4tVO1S4//Rke/FRQ7BH/IrGNP6a2rGWUwbrl9sjJ
         t4qllY5BMUScu96ztcsD9JFIQOHcfezZ/BiX6CZ78ZRSK/ItT8vawh4GN+VHdivFBZjh
         Nrbwl+24IwQEWELN+QByTwQGgEidjIllDzp1Z7RRSOOoeQKqTGkF6wZTzMfEBfVXUu0Q
         D//Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIqfWaYuAFjCVb9ueGPQjt80AxX1y0e6A0pkxRu0mH7imryju71Huc2+I7rBR8Cao79TT3DCQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLuQiuxG6LlvY5CViLHFGP4NuhLO9teUbACKuWL7fZMo7NfDgM
	qKzNwN++xLrZ9SaJTL5dGBe5n47vzflsyvjDIk1hwYphC4yidaDc8P6OQc0MYK5RDl0Tz0nfDhc
	nMr7G8rRqB1O3QK6wTw6+P9M2nSztCZyQ5zbPcEEv28buBGP/CDUXeKWQX3BLxdhq
X-Gm-Gg: ASbGncvJV0hx2VtQpU3C0++1F/ZJ8Rft1bE6oS/LlqkpV4xd9HHv4oEGlJVqQo5EwbY
	5juBb2GEIo13ZylZYzHdglaQ0GEViaUrQrVrAvaBS18Aqayco8u689XPfV8dszvIBRJZV4GSoRd
	Dae4TRVoe68lYT0yLcO7jSEAr0EbBZCm0pPmJiP9WZg8KLeEkfRzzOzgOuBw6Jfi38/DE6VuKXf
	gGYrVrS9hmL7KtTSnQbme5c5aa4yArb3bA60dwYQi3rHipbbHXmzoa0fnXdOqpqnZoj3TZlVdvT
	K/+5mN2Ri9RpgYVKSyog50HsCeyjx+NcMU/M5xBoBpFwBVkq
X-Received: by 2002:a17:90b:1946:b0:310:c609:5d1a with SMTP id 98e67ed59e1d1-310c609663bmr916776a91.14.1747863801076;
        Wed, 21 May 2025 14:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEICPvVoHfG5rjo9uhkVj1agHjn28ykLeVhDszBE75AMJNR7yPFf8HzY23pfsdGzpp2iPLMdg==
X-Received: by 2002:a17:90b:1946:b0:310:c609:5d1a with SMTP id 98e67ed59e1d1-310c609663bmr916745a91.14.1747863800540;
        Wed, 21 May 2025 14:43:20 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365134e5sm4142241a91.42.2025.05.21.14.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 14:43:20 -0700 (PDT)
Message-ID: <8fdeef8c-b2ea-4f1c-8eb3-e600e5140f24@oss.qualcomm.com>
Date: Wed, 21 May 2025 14:43:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20250521
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIxNSBTYWx0ZWRfX2reFot7AJChj
 oN4L5pHLrAU2YZYixMzAvbYBDJOqqDq14OX25yaOsjtmCvWfmEOK8BrQO8qs7UGuvJRodldyjPA
 7u0wL5lV0q0YhR6TP93tiDvXaccQE6dTklbhg/MtwAlM5KkPxiThDVL+Hi/8k6+UOBwul/+2WOo
 wSabfMMDANrWtJuska1fz7laNbsAtmu3Fdz5Ep1m6lqqtQuD8oo8egzge0j0AisFhhr+uJNK5mk
 99zqDd9Ez8rTqB9ZQMBkJ+oXm+sZ0hji6dUYep/sht7PnSf5ZckQMJjT9s8nm0FskVuGerr+qUR
 XqqLyHgKp4lvd3vlZSsQ+9AtTnagsdnXybLD6LM4QYZUmHL7lnOibw3IOMpx0lROMfcCtNs/1We
 GH/vO/d5SxBuLSMfjnHiUtI0h1S8Nze/X8p44uOELy/a+A0fePTyPyUOQOERYEZ1paeJA5jk
X-Proofpoint-GUID: 08E4W2TDhtHLHSCaVkMgwhrqj-iSqzaf
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682e48fa cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=FKcf5NbGizdFyegkQZ8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 08E4W2TDhtHLHSCaVkMgwhrqj-iSqzaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_144322_771267_B42F204A 
X-CRM114-Status: GOOD (  13.42  )
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

The following changes since commit 68b44b05f4c880c42109a91d2e0e7faa94f40529:

  wifi: mac80211: handle non-MLO mode as well in ieee80211_num_beaconing_links() (2025-05-16 10:51:44 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20250521

for you to fetch changes up to 886bb3624e4c9914a943b63fcfdf30b8d2f2b66e:

  wifi: ath12k: fix regdomain update failure when connection establishes (2025-05-21 14:01:06 -0700)

----------------------------------------------------------------
ath.git patches for v6.16

ath12k:
Add monitor mode support for WCN7850.
Enhance regulatory support including 6 GHz power modes.

In addition, perform the usual set of bug fixes and cleanups across
all supported drivers.

----------------------------------------------------------------
Aditya Kumar Singh (3):
      wifi: ath12k: handle scan link during vdev create
      wifi: ath12k: Use scan link ID 15 for all scan operations
      wifi: ath12k: fix mac pdev frequency range update

Aishwarya R (1):
      wifi: ath12k: remove redundant regulatory rules intersection logic in host

Aloka Dixit (1):
      wifi: ath12k: pass link_conf for tx_arvif retrieval

Baochen Qiang (18):
      wifi: ath12k: fix a possible dead lock caused by ab->base_lock
      wifi: ath12k: refactor ath12k_reg_chan_list_event()
      wifi: ath12k: refactor ath12k_reg_build_regd()
      wifi: ath12k: add support to select 6 GHz regulatory type
      wifi: ath12k: move reg info handling outside
      wifi: ath12k: store reg info for later use
      wifi: ath12k: determine interface mode in _op_add_interface()
      wifi: ath12k: update regulatory rules when interface added
      wifi: ath12k: update regulatory rules when connection established
      wifi: ath12k: save power spectral density(PSD) of regulatory rule
      wifi: ath12k: add parse of transmit power envelope element
      wifi: ath12k: save max transmit power in vdev start response event from firmware
      wifi: ath12k: fill parameters for vdev set TPC power WMI command
      wifi: ath12k: add handler for WMI_VDEV_SET_TPC_POWER_CMDID
      wifi: ath12k: use WMI_VDEV_SET_TPC_POWER_CMDID when EXT_TPC_REG_SUPPORT for 6 GHz
      wifi: ath12k: fix regdomain update failure after 11D scan completes
      wifi: ath12k: fix regdomain update failure when adding interface
      wifi: ath12k: fix regdomain update failure when connection establishes

Christophe JAILLET (1):
      wifi: ath10k: Constify structures in hw.c

Colin Ian King (1):
      wifi: ath10k: Fix spelling mistake "comple" -> "complete"

Dinesh Karthikeyan (1):
      wifi: ath12k: Add support to simulate firmware crash

Johan Hovold (3):
      wifi: ath11k: fix ring-buffer corruption
      wifi: ath11k: fix rx completion meta data corruption
      wifi: ath12k: fix ring-buffer corruption

Kang Yang (14):
      wifi: ath12k: delete mon reap timer
      wifi: ath12k: parse msdu_end tlv in ath12k_dp_mon_rx_parse_status_tlv()
      wifi: ath12k: avoid call ath12k_dp_mon_parse_rx_dest_tlv() for WCN7850
      wifi: ath12k: add srng config template for mon status ring
      wifi: ath12k: add ring config for monitor mode on WCN7850
      wifi: ath12k: add interrupt configuration for mon status ring
      wifi: ath12k: add monitor mode handler by monitor status ring interrupt
      wifi: ath12k: add support to reap and process monitor status ring
      wifi: ath12k: fix macro definition HAL_RX_MSDU_PKT_LENGTH_GET
      wifi: ath12k: use ath12k_buffer_addr in ath12k_dp_rx_link_desc_return()
      wifi: ath12k: add support to reap and process mon dest ring
      wifi: ath12k: init monitor parameters for WCN7850
      wifi: ath12k: use different packet offset for WCN7850
      wifi: ath12k: enable monitor mode for WCN7850

Lingbo Kong (1):
      wifi: ath12k: Abort scan before removing link interface to prevent duplicate deletion

Miaoqing Pan (2):
      dt-bindings: net: wireless: ath12k: describe firmware-name property
      wifi: ath12k: support usercase-specific firmware overrides

Mohan Kumar G (1):
      wifi: ath12k: Send MCS15 support to firmware during peer assoc

Muhammad Usama Anjum (1):
      wifi: ath11k: Fix QMI memory reuse logic

Muna Sinada (1):
      wifi: ath12k: Prevent multicast duplication for dynamic VLAN

P Praneesh (2):
      wifi: ath12k: Fix invalid RSSI values in station dump
      wifi: ath12k: fix memory leak in WMI firmware stats

Rajat Soni (1):
      wifi: ath12k: fix memory leak in ath12k_service_ready_ext_event

Ramasamy Kaliappan (1):
      wifi: ath12k: update EMLSR capabilities of ML Station

Rosen Penev (1):
      wifi: ath9k: ahb: do ioremap resource in one step

Thiraviyam Mariyappan (1):
      wifi: ath12k: Enable AST index based address search in Station Mode

Toke Høiland-Jørgensen (1):
      wifi: ath9k_htc: Abort software beacon handling if disabled

Vignesh C (1):
      wifi: ath12k: Fix scan initiation failure handling

Vinith Kumar R (3):
      wifi: ath12k: change soc name to device name
      wifi: ath12k: Add device dp stats support
      wifi: ath12k: print device dp stats in debugfs

Wen Gong (1):
      wifi: ath12k: read country code from SMBIOS for WCN7850

Yingying Tang (2):
      wifi: ath12k: Reorder and relocate the release of resources in ath12k_core_deinit()
      wifi: ath12k: Adjust the process of resource release for ahb bus

Yu Zhang(Yuriy) (1):
      wifi: ath11k: support DBS and DFS compatibility

Yury Norov (1):
      wifi: carl9170: micro-optimize carl9170_tx_shift_bm()

 .../bindings/net/wireless/qcom,ath12k.yaml         |   6 +
 drivers/net/wireless/ath/ath10k/ce.c               |  28 +-
 drivers/net/wireless/ath/ath10k/hw.c               |  62 +-
 drivers/net/wireless/ath/ath10k/hw.h               |  34 +-
 drivers/net/wireless/ath/ath10k/sdio.c             |   2 +-
 drivers/net/wireless/ath/ath11k/ce.c               |  11 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c            |  25 +-
 drivers/net/wireless/ath/ath11k/hal.c              |   4 +-
 drivers/net/wireless/ath/ath11k/mac.c              |  42 +-
 drivers/net/wireless/ath/ath11k/qmi.c              |   9 +
 drivers/net/wireless/ath/ath12k/ahb.c              |   5 +-
 drivers/net/wireless/ath/ath12k/ce.c               |  11 +-
 drivers/net/wireless/ath/ath12k/core.c             |  37 +-
 drivers/net/wireless/ath/ath12k/core.h             |  72 +-
 drivers/net/wireless/ath/ath12k/debugfs.c          | 263 +++++++
 drivers/net/wireless/ath/ath12k/debugfs.h          |   5 +
 drivers/net/wireless/ath/ath12k/dp.c               |  66 +-
 drivers/net/wireless/ath/ath12k/dp.h               |  28 +
 drivers/net/wireless/ath/ath12k/dp_mon.c           | 816 +++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/dp_mon.h           |   3 +
 drivers/net/wireless/ath/ath12k/dp_rx.c            | 172 +++--
 drivers/net/wireless/ath/ath12k/dp_rx.h            |  10 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c            |  66 +-
 drivers/net/wireless/ath/ath12k/hal.c              |  42 +-
 drivers/net/wireless/ath/ath12k/hal.h              |   4 +
 drivers/net/wireless/ath/ath12k/hal_desc.h         |   7 +-
 drivers/net/wireless/ath/ath12k/hal_rx.c           | 102 ++-
 drivers/net/wireless/ath/ath12k/hal_rx.h           |  12 +-
 drivers/net/wireless/ath/ath12k/hw.c               |  12 +-
 drivers/net/wireless/ath/ath12k/hw.h               |   1 +
 drivers/net/wireless/ath/ath12k/mac.c              | 674 ++++++++++++++---
 drivers/net/wireless/ath/ath12k/mac.h              |  43 ++
 drivers/net/wireless/ath/ath12k/pci.c              |   8 +-
 drivers/net/wireless/ath/ath12k/reg.c              | 407 +++++-----
 drivers/net/wireless/ath/ath12k/reg.h              |  18 +-
 drivers/net/wireless/ath/ath12k/wmi.c              | 231 +++---
 drivers/net/wireless/ath/ath12k/wmi.h              |  64 ++
 drivers/net/wireless/ath/ath9k/ahb.c               |  13 +-
 drivers/net/wireless/ath/ath9k/htc_drv_beacon.c    |   3 +
 drivers/net/wireless/ath/carl9170/tx.c             |   3 +-
 40 files changed, 2751 insertions(+), 670 deletions(-)

