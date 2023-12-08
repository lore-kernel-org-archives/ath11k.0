Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA9CC4167B
	for <ath11k@archiver.kernel.org>; Fri,  8 Dec 2023 05:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:To:From:
	Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RlGO75cVyyO6/egfGnXxOs869qnVKisPyuOwGEPh2Zk=; b=tWAnPHZ7kzbVjsCHkFVUNcNUKR
	JxuOK0V2Z6xJx4jy/Q9jbAd2LbvrF8IkYjIaxO0lGhTMm6EpINqacpLJpxqpNk0DjO4B3hlb+CJad
	LGV7pKiJkcaNxn5TiDtQi1e8Wm4dlchYuTbos2wlQFbW1FlNWxU/Y5N6uEIoMCMWK+z4fixwxTtQI
	XWTX6bCs4gQb/9x7fVTqTyKfImbuPsjm1rjC66dGO4rgJNlumoWcHELZFIYw9JpuzpahxbZKjaTbi
	xSN5ClTGaIH6t4vlRwhH4rBvhy6s3uWRag8w2eNWAKO07UEp8Rk8Yy+Hgm14OHKlHst7nWpUGDu4q
	KP9dgoXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTl7-00En8d-0u;
	Fri, 08 Dec 2023 05:50:45 +0000
Received: from mailgw3.alcom.ax ([194.112.1.144])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTl4-00En8D-0f
	for ath11k@lists.infradead.org;
	Fri, 08 Dec 2023 05:50:44 +0000
Received: from smtp.aland.net (smtp.aland.net [194.112.1.117])
	by mailgw3.alcom.ax (Postfix) with ESMTPS id 8CE4054C4A
	for <ath11k@lists.infradead.org>; Fri,  8 Dec 2023 07:50:33 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailgw3.alcom.ax 8CE4054C4A
Received: from mail.monsterbitar.se (213-204-48-48.bredband.aland.net [213.204.48.48])
	by smtp.aland.net (Postfix) with ESMTP id 878EE3065505
	for <ath11k@lists.infradead.org>; Fri,  8 Dec 2023 07:50:33 +0200 (EET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 08 Dec 2023 07:50:16 +0200
From: Jonathan Silverblood <jonathan@silverblood.se>
To: ath11k@lists.infradead.org
Subject: Steam Deck OLED
Organization: Monsterbitar
Message-ID: <474422d679cfcf33eaa4129fd7491512@silverblood.se>
X-Sender: jonathan@silverblood.se
User-Agent: Roundcube Webmail/1.3.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_215042_421729_358DAEC4 
X-CRM114-Status: UNSURE (   7.35  )
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

I'm trying to run my preferred flavour of linux on the new steam deck 
oled and the wireless/bluetooth is not recognized.Based on some dmesg 
output and casual searching I suspect it's the firmware files that don't 
know the specific configuration used in this device. I verified it was 
working on steamos before I re-installed, so I thought I'd send my dmesg 
output here and see if there's anything else I can do to help.

ath11k_pci 0000:03:00.0: chip_id 0x12 chip_family 0xb board_id 0x309 
soc_id 0x400c1211
ath11k_pci 0000:03:00.0: fw_version 0x110b196e fw_build_timestamp 
2022-12-22 12:54 fw_build_id 
WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
Loading firmware: ath11k/WCN6855/hw2.1/board-2.bin
Loading firmware: ath11k/WCN6855/hw2.1/board-2.bin
Loading firmware: ath11k/WCN6855/hw2.1/regdb.bin
Loading firmware: ath11k/WCN6855/hw2.1/board-2.bin
Loading firmware: ath11k/WCN6855/hw2.1/board-2.bin
Loading firmware: ath11k/WCN6855/hw2.1/board.bin
ath11k_pci 0000:03:00.0: failed to fetch board data for 
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=18,qmi-board-id=777 
from ath11k/WCN6855/hw2.1/board-2.bin
ath11k_pci 0000:03:00.0: failed to fetch board.bin from WCN6855/hw2.1
ath11k_pci 0000:03:00.0: qmi failed to fetch board file: -2
ath11k_pci 0000:03:00.0: failed to load board data file: -2


Here's the lspci output as well, just in case:

03:00.0 Network controller: Qualcomm Technologies, Inc QCNFA765 Wireless 
Network Adapter (rev 01)
         DeviceName: Broadcom 5762
         Subsystem: Qualcomm Technologies, Inc QCNFA765 Wireless Network 
Adapter
         !!! Unknown header type 7f
         Interrupt: pin ? routed to IRQ 67
         Region 0: Memory at 80000000 (64-bit, non-prefetchable) 
[size=2M]
         Kernel driver in use: ath11k_pci
         Kernel modules: ath11k_pci

// Jonathan

