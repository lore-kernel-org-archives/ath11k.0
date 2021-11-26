Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AABC433EF
	for <ath11k@archiver.kernel.org>; Fri, 26 Nov 2021 10:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NvOF85nnStGKC19M4YF/tK07JL056P03dhNY5Wx7AWI=; b=4A75H/tBvIAGc6
	PSJSv9VvKI6EoR6wFOpjrm2T6b97AHoq7LFM8g5TOIqpx9N0dwlnHlxDVpsdRKcKqVQG8z71cpA/z
	u+w3OUEDLQUghKGoSydvNsdndMNCXnN77t9ABTBOzS/fvard1MWUYBSAKaqeSJT04oIWxbRbMAI+j
	i+SdRSH87/E8Nag9PP7utknn5dD3P74aY+0QZiduMK3Eql1ZB2CHySEU7X0PoP8TYewwbO7yrmnSu
	fyZ2/WRl7dO7CifVO3sG9FIrMyC1n+xoPoPdmsB3ko7Lsjn7aCA/DHJXBXtUUku0mC8OwHm4oRZlr
	1AIwvNei0XfhPaXpTIww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqYqb-00A6Nu-C9; Fri, 26 Nov 2021 10:52:53 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqYqY-00A6Jp-2D
 for ath11k@lists.infradead.org; Fri, 26 Nov 2021 10:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1637923964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bSnXsxwb+gy1W/+vQK1jvpC2Bp2mf3UF+9Aza3cq0w0=;
 b=jSjgxiFx8LtK5IC8QeMCyOMEU8XUxCFASfYBC/6+oEBV9tHAWruib+8UOjEyg2mXdulQgu
 FkOI5quyNU6FF1g0YP8upwXEAGjmwyHHk1aBVY3S1D9RLdX3/+fsxXIIoc5JsJBm1DfScN
 dT+CknhSij3FJDKF/s75NXHorySl0Sk=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, Lavanya Suresh <lavaks@codeaurora.org>
Cc: kvalo@codeaurora.org
Subject: ath11k: QCN9074: Incompatible board-2.bin for 6GHz
Date: Fri, 26 Nov 2021 11:52:42 +0100
Message-ID: <2091899.pNsEtq2SQc@ripper>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_025250_478886_6D45DE49 
X-CRM114-Status: GOOD (  13.79  )
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

I wanted to use an 8devices Pineapple6 device on x86. But the board_id of this 
card came always in as 255 (and not as a valid 6GHz capable board_id). I've 
contacted the support and they told me to use the QCA BDF with the board_id 
162 for this card. So I've downloaded 
2.4.0.1.r1/WLAN.HK.2.4.0.1.r1-00019-QCAHKSWPL_SILICONZ-1/board-2.bin [1], 
extracted it and moved it to /lib/firmware/ath11k/QCN9074/hw1.0/board.bin. 
I've also added the (not yet upstreamed) 6GHz regulatory support to 
ath11k [2]. But to my surprise, the WMI_REG_CHAN_LIST_CC_EXT_EVENTID never 
came in. Instead, a WMI_REG_CHAN_LIST_CC_EVENTID was received. This resulted 
in a output like:

    ath11k_pci 0000:01:00.0: No reg rules available
    ath11k_pci 0000:01:00.0: failed to extract regulatory info from received event
    ------------[ cut here ]------------
    WARNING: at drivers/net/wireless/ath/ath11k/wmi.c:7255

The warning from ath11k (which breaks the device btw) is from

    if (!(reg_info->num_2g_reg_rules + reg_info->num_5g_reg_rules)) {
    	ath11k_warn(ab, "No regulatory rules available in the event info\n");
    	kfree(tb);
    	return -EINVAL;
    }

I found out that this is actually caused by the BDF. If I've extracted the 
board.bin from the TIP board-2.bin [3] (which seems to come from the QCA 
ATH.11.4 CS release). With this version, it seems to work fine. I haven't yet 
found out what the relevant change is - but if someone has hints then this 
would could be interesting for other devices which should be added to things 
like OpenWrt.

Maybe Kalle Valo could upload a new board-2.bin for QCN9074 hw1.0 which has
the problem solved.


And it would also be nice when the authors of the 
WMI_REG_CHAN_LIST_CC_EXT_EVENTID support would send this stuff upstream. I 
just find it interesting that the assoc patches are already part of
upstream [4,5] - even when the reg support is still missing. There are a lot 
more patches in there which are missing upstream.

Kind regards,
	Sven

[1] https://github.com/kvalo/ath11k-firmware/commit/ae4f4f64ed14097dc24a8d686fa60e932cba4868/QCN9074/hw1.0/testing/2.4.0.1.r1/WLAN.HK.2.4.0.1.r1-00019-QCAHKSWPL_SILICONZ-1/board-2.bin
[2] https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/tree/mac80211/patches/302-ath11k-Add-support-to-parse-new-wmi-event-for-6G-reg.patch?h=NHSS.QSDK.11.4.0.5
[3] https://github.com/Telecominfraproject/wlan-ap/blob/main/feeds/wifi-ax/ath11k-firmware/files/QCN9000/board-2.bin
[4] https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/tree/mac80211/patches/206-ath11k-add-6ghz-params-in-peer-assoc-cmd.patch?h=NHSS.QSDK.11.4.0.5
[5] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c3a7d7eb4c9853bb457b792cef42ddd4a029a914
[6] https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/tree/mac80211/patches/302-ath11k-add-177-channel-to-5G-channel-list.patch?h=NHSS.QSDK.11.4.0.5



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
