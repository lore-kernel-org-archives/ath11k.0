Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E255C433F5
	for <ath11k@archiver.kernel.org>; Wed, 16 Feb 2022 10:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CEUC5lqCok/VdPsHBX2o7bwelYaIHbFIXKIqzDFHXO0=; b=sHnrG8HsoVOp93
	Qqg9Bio7q/aKFySiiJw0kHY8kjCPgeVbYIM3vfR1TUnz3apxQWFLrAmUvPNcI/8a8b2w4cNphV7ks
	K67Uh7GP8h9dt5ADhiqa1YMW/ZYy4Gn75VBjLkRKUpwPthJ+k7urCQE0GPWPDUOp3PGJHoZXZSa1c
	gVBcXmSP9Z5fSRNZllYkapcXasEhyqlmU5Rq2r1G9YoW5QW+6GO81mMH3EKFawIGfnZ+d1uwho2EB
	A9GjZ8GzIvyWV75v2WiKFWmTh1LA93FsxaY7WQlx+zuArw1236JMPmnrV8df95lVv93SmW/BEm3Gs
	CzYST9pQmsjy2TkcU5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKHBr-006S8B-Td; Wed, 16 Feb 2022 10:05:39 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKHBo-006S7L-Mc
 for ath11k@lists.infradead.org; Wed, 16 Feb 2022 10:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645005936; x=1676541936;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=T55G1p5GH/mqW/hkJ+YbiFZ3Mg8vvPgF6gUJT8RnjjA=;
 b=luHUhk7vcpg60BVHK3s1rQlelZ9YkdF/otwED3yBFkfuMs5l+rSUwPge
 KntGsDGXCCmmQ0pk8Rn1tAh9eFpmymjjwtaEqq5MGJyn6s7sFbYmm+QKl
 aMZRF6XOiMbwAdZXFG7IL9//clsdYubL85TL8yjQx6Re/8uydrzaa6ZVJ A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Feb 2022 02:05:34 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 02:05:34 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 02:05:33 -0800
Received: from vnaralas-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 16 Feb 2022 02:05:32 -0800
From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Venkateswara Naralasetty
 <quic_vnaralas@quicinc.com>
Subject: [PATCHv2 0/6] ath11k: add single shot/periodic CFR capture support
 for IPQ8074
Date: Wed, 16 Feb 2022 15:35:16 +0530
Message-ID: <1645005922-7252-1-git-send-email-quic_vnaralas@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_020536_811327_4A6E52F1 
X-CRM114-Status: GOOD (  11.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Channel Frequency Response feature is to get the channel state
information from the hardware based on the user configurations
and send the CSI data to user space.

CSI data is further processed in user space which can be used to
identify the motion of the objects.

CFR dumps will be collected from the received ACK's for the
transmited QOS NULL frames for the associated stations. For
unassociated stations CFR dumps will be collected from the
probe response ACK.

CFR format to user space:
 ___________________________________________
| CFR header | CFR payload | CFR tail data |
|____________|_____________|_______________|

CFR header contains the following fields,

* Start magic number 0xDEADBEAF - 4bytes
* vendor id - 4bytes
* cfr metadata version - 1byte
* cfr data version - 1byte
* chip type - 1byte
* platform type - 1byte
* CFR metadata length - 4bytes
* metadata - 92bytes
        peer mac - 6bytes
        capture status - 1byte (1 for success 0 for failure)
        capture_bw - 1byte
        channel_bw - 1byte
        phy_mode - 1byte
        prim20_chan - 2bytes
        center_freq1 - 2bytes
        center_freq2 - 2bytes
        capture_mode - 1byte
        capture_type - 1byte
        sts_count - 1byte
        num_rx_chain - 1byte
        timestamp - 4bytes
        length - 4bytes
        chain_rssi - 32bytes (4bytes for each chain)
        chain_phase - 16bytes (2bytes for each chain)
        cfo_measurement - 4bytes
        agc_gain - 8bytes (1 bytes for each chain)
        rx_start_ts - 4bytes

CFR payload:

CFR payload contains 8bytes of ucode header followed by the
tone information. Tone order is  positive tones, followed by
PHY memory garbage, followed by negative tones. Dummy tones
are uploaded to make number of tones always integer number
of 64. Number of tones is not preamble type dependent.

Each CFR tone has 14-bit I component and 14-bit Q component
and is sign extended to 16-bit I/Q. Two tones are packed
into one 64-bit unit as:

[63:0] = [Tone1_Q(63:48) Tone1_I(47:32) Tone0_Q(31:16) Tone0_I(15:0)]

CFR tail: end magic number 0xBEAFDEAD

Tested-on: IPQ8074 WLAN.HK.2.5.0.1-00991-QCAHKSWPL_SILICONZ-1

Venkateswara Naralasetty (6):
  nl80211: vendor-cmd: qca: add command for CFR configuration
  ath11k: CFR module initialization and deinitialization for IPQ8074
  ath11k: register relayfs entries for CFR dump
  ath11k: register vendor sub command for CFR configuration
  ath11k: Register DBR event handler for CFR data
  ath11k: Register handler for CFR capture event

v2:
 * Fixed warnings reported by kernel test robot.

 drivers/net/wireless/ath/ath11k/Kconfig  |   9 +
 drivers/net/wireless/ath/ath11k/Makefile |   4 +-
 drivers/net/wireless/ath/ath11k/cfr.c    | 817 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/cfr.h    | 304 ++++++++++++
 drivers/net/wireless/ath/ath11k/core.c   |  35 ++
 drivers/net/wireless/ath/ath11k/core.h   |  17 +
 drivers/net/wireless/ath/ath11k/dbring.c |  33 +-
 drivers/net/wireless/ath/ath11k/dbring.h |   7 +
 drivers/net/wireless/ath/ath11k/debug.h  |   2 +
 drivers/net/wireless/ath/ath11k/hal.c    |   3 +-
 drivers/net/wireless/ath/ath11k/hw.h     |   5 +
 drivers/net/wireless/ath/ath11k/mac.c    |  18 +-
 drivers/net/wireless/ath/ath11k/vendor.c | 192 ++++++++
 drivers/net/wireless/ath/ath11k/vendor.h |  13 +
 drivers/net/wireless/ath/ath11k/wmi.c    | 148 +++++-
 drivers/net/wireless/ath/ath11k/wmi.h    |  97 +++-
 include/uapi/linux/nl80211-vnd-qca.h     | 104 ++++
 17 files changed, 1792 insertions(+), 16 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/cfr.c
 create mode 100644 drivers/net/wireless/ath/ath11k/cfr.h
 create mode 100644 drivers/net/wireless/ath/ath11k/vendor.c
 create mode 100644 drivers/net/wireless/ath/ath11k/vendor.h
 create mode 100644 include/uapi/linux/nl80211-vnd-qca.h

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
