Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECFDC636D4
	for <ath11k@archiver.kernel.org>; Wed, 15 Feb 2023 09:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rkrwrHpcFdJnwqxwGt88jgeW0QmBPl2IVgEoDpy4L8U=; b=Us39Liql5gnDAl
	/6DS5a86XBPjU7AkRoNzOKYnTouJCxvSJs94W/COYta0PG0mereuJU+rrtV6pUwX3QPy5DDTu82QC
	x5b2GsLQUT2vmuwuCgKCG57FWheEmmGd3dYiIyhvld6pBkU/w2V3rMaCWN4cvzVDZyrQf2z3klCAw
	Mt8KiUjtV+b0102GmA+mNfOJodYdISuKQrgKgNhJ2vAzURGGqQha7euCX1y3gLt0ept51kxxLL80W
	oRKpkABz6ToQi8UoVl91iWnPhzhPRLn1kXOPugsjg9DXxqWaSN0HDCc5RgyGCsVeFWSUk1XA8yW+H
	lHn62E7MkS0WxQHT3vTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSDub-005IXp-HN; Wed, 15 Feb 2023 09:17:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSDuW-005IVf-6T; Wed, 15 Feb 2023 09:17:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 82777B81F91;
	Wed, 15 Feb 2023 09:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A718C433D2;
	Wed, 15 Feb 2023 09:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676452625;
	bh=2JN9BL2uqV+9tFYoJoTLAzaxp3WSWxoz3z+XyVU9fAw=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=bKREpx9b4YUQqZ2vn8vJ82WJfcMes5/Ll62IgpBwnnxLiZC56dAfr52C7qwzlo8Gh
	 a7Tjr0xqi59WtkkGkg0YNNzxvWU7qvgHXecD0GVJlR0zR8YdFcr+oF0qduHjVtZ+MK
	 P0e0oLef1A9QTwKcIM7saT8He1Uxf+UpvrNFCkE13AGAeQn3LwEyOOi1WixDVi0SSr
	 ZLOsEwsFHLAL6FV8pP0qQVrlsEizbTPPrB/xcPA5B7a25FpgSGGuziffOqYV76TOtk
	 CKaGAHl24/BzuDwo8k+E8afc0ZzYB86TZ3+M0vwZI4y/N9swaqzAE+Sbcxv+vaVroU
	 vCsSNNhMGM45w==
From: Kalle Valo <kvalo@kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, ath11k@lists.infradead.org
Subject: [PULL linux-firmware] ath10k & ath11k firmware 20230215
Date: Wed, 15 Feb 2023 11:17:00 +0200
Message-ID: <878rgzuw37.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_011708_559108_DE25B8D3 
X-CRM114-Status: GOOD (  12.37  )
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

Hi,

Here's a new pull request for ath10k and ath11k. We have new hardware
IPQ5018 and various updates for existing hardware. Especially many have
requested the firmware update for WCN6855 which seems to fix an
important suspend problem.

Please let me know if there are any problems.

Kalle

The following changes since commit a253a3723f8a0ee5bc5d4f551981a651ba660186:

  cnm: update chips&media wave521c firmware. (2023-02-14 12:58:03 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20230215

for you to fetch changes up to c7a57ef688f7d99d8338a5d8edddc8836ff0e6de:

  ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23 (2023-02-15 11:09:53 +0200)

----------------------------------------------------------------
Kalle Valo (7):
      ath10k: WCN3990 hw1.0: update board-2.bin
      ath10k: QCA6174 hw3.0: update firmware-sdio-6.bin to version WLAN.RMH.4.4.1-00174
      ath11k: IPQ5018 hw1.0: add board-2.bin
      ath11k: IPQ5018 hw1.0: add to WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
      ath11k: WCN6750 hw1.0: update board-2.bin
      ath11k: WCN6855 hw2.0: update board-2.bin
      ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

 WHENCE                                   |   27 +-
 ath10k/QCA6174/hw3.0/firmware-sdio-6.bin |  Bin 604416 -> 607252 bytes
 ath10k/WCN3990/hw1.0/board-2.bin         |  Bin 461060 -> 513892 bytes
 ath11k/IPQ5018/hw1.0/Notice.txt          | 4094 ++++++++++++++++++++++++++++++
 ath11k/IPQ5018/hw1.0/board-2.bin         |  Bin 0 -> 524564 bytes
 ath11k/IPQ5018/hw1.0/m3_fw.b00           |  Bin 0 -> 148 bytes
 ath11k/IPQ5018/hw1.0/m3_fw.b01           |  Bin 0 -> 136 bytes
 ath11k/IPQ5018/hw1.0/m3_fw.b02           |  Bin 0 -> 262144 bytes
 ath11k/IPQ5018/hw1.0/m3_fw.flist         |    3 +
 ath11k/IPQ5018/hw1.0/m3_fw.mdt           |  Bin 0 -> 284 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b00           |  Bin 0 -> 532 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b01           |  Bin 0 -> 520 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b02           |  Bin 0 -> 7552 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b03           |  Bin 0 -> 545008 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b04           |  Bin 0 -> 86788 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b05           |  Bin 0 -> 17776 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b07           |  Bin 0 -> 1488 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b08           |  Bin 0 -> 4096 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b09           |  Bin 0 -> 2330624 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b10           |  Bin 0 -> 269028 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b11           |  Bin 0 -> 99436 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b13           |  Bin 0 -> 7024 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.b14           |  Bin 0 -> 1668 bytes
 ath11k/IPQ5018/hw1.0/q6_fw.flist         |   13 +
 ath11k/IPQ5018/hw1.0/q6_fw.mdt           |  Bin 0 -> 1052 bytes
 ath11k/WCN6750/hw1.0/board-2.bin         |  Bin 843548 -> 843548 bytes
 ath11k/WCN6855/hw2.0/amss.bin            |  Bin 4972544 -> 4980736 bytes
 ath11k/WCN6855/hw2.0/board-2.bin         |  Bin 1322820 -> 6158196 bytes
 28 files changed, 4135 insertions(+), 2 deletions(-)
 create mode 100644 ath11k/IPQ5018/hw1.0/Notice.txt
 create mode 100644 ath11k/IPQ5018/hw1.0/board-2.bin
 create mode 100644 ath11k/IPQ5018/hw1.0/m3_fw.b00
 create mode 100644 ath11k/IPQ5018/hw1.0/m3_fw.b01
 create mode 100644 ath11k/IPQ5018/hw1.0/m3_fw.b02
 create mode 100644 ath11k/IPQ5018/hw1.0/m3_fw.flist
 create mode 100644 ath11k/IPQ5018/hw1.0/m3_fw.mdt
 create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b00
 create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b01
 create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b02
 create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b03
 create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b04
 create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b05
 create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b07
 create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b08
 create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b09
 create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b10
 create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b11
 create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b13
 create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b14
 create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.flist
 create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.mdt

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
