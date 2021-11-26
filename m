Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE8DC433EF
	for <ath11k@archiver.kernel.org>; Fri, 26 Nov 2021 14:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7o7C9TZw3Q48FUTJHCPDSAtmb5ULblyDkPMW/h1522k=; b=fY55qToUxzE4Do
	txZyKwbl8MdrtZBU3KYUj1ac2iSMQf9I72toh/OTkc7QrgCH/2ocBKS0pKpnxUn9SnNPdw79xTWZ5
	3T9vZdUio0hxaMcx0FQZuDRb+W5lV/OG5+tiqPUbgq0iRQD92EwBlvkSpRWdPaNG0WCGfSNS5r3je
	+jgsXkFlP8JAMBgFSCrU36RRzOZNB/3ZIvuDgslVFKlMB2+I6KK6M1vD6Bc1qWe86Q77IJk2vc+WC
	pJNtGf7e4TZulnsCBTkoJBkCLCOELZI9FmVxS4vcvDVZT0g86bpPPrneu7v0OozQbwFeDaQ93xViX
	hozmAkWwpRzQHNAlC7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqcWY-00Apau-2p; Fri, 26 Nov 2021 14:48:26 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqcWU-00ApYp-BS
 for ath11k@lists.infradead.org; Fri, 26 Nov 2021 14:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1637938099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6waF+zPqjvApkTPABYiHmMu3gEnwghcabMoQVbtRb98=;
 b=1L/NA2vU++mgNn+YgZ5fq7p9Y5gH1T+0LHNSXJDeRI5/NLy0gC/JGeQIV624SR6AohwfFE
 tAzLtAmjnKsk58HAFw/sNZdRlPX8pJB8p4B8lIJi1oTzn0TEZx6qqW3Lf15wt8dmIW++HR
 GomE8YNwR5qpUNPpeO+3dumLnAtenqY=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Subject: ath11k: incorrect board_id retrieval
Date: Fri, 26 Nov 2021 15:48:17 +0100
Message-ID: <1734146.k9CKHTOI9D@ripper>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_064822_620939_2A393B4B 
X-CRM114-Status: GOOD (  13.89  )
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

I've noticed that manufacturers of cards gave me various information what 
board_id they expected a device (QCN9074) is detected as. But ath11k only 
retrieves the board id as 0xff - thus the ath11k driver is always loading the 
wrong BDF. Commercially available boards with a problem like this are:

* 8devices Pineapple
  - 2GHz: 160 (0xa0)
  - 5GHz: 161 (0xa1)
  - 6GHz: 162 (0xa2)
* Compex WLE3000H5
* (maybe there is not a single one which works?)

If I would use these boards in one with a devicetree then I could just 
overwrite it using qcom,board_id (and/or qcom,ath11k-calibration-variant). But 
this isn't the case when I want to use a couple of these cards in a simple x86 
system. All off them (even when they are significantly different) are reported
as

    ath11k_pci 0000:03:00.0: chip_id 0x0 chip_family 0x0 board_id 0xff soc_id 0xffffffff

So I would have to hack the driver to implement my own (pci id? based)
board.bin retrieval code.


So my question would be: Is the ath11k based board_id retrieval just broken? 
Or are these cards broken?


The way the firmware is initialized definitely changed between ath10k and 
ath11k. Previously, the otp.bin took care of retrieving the (pre-cal) data 
from the EEPROM/OTP on the card or retrieved it via driver from the host 
systems flash/filesystem. And then the otp.bin was reporting the board_id to 
the driver. Based on that, the driver was able to select the correct BDF.

But now, the firmware is started and immediately afterwards, it is already 
asked to report the target capabilities. And the target capabilities are 
including the board_id - the part which doesn't seem to work correctly. Only 
after that, the driver sends the BDF + (pre)caldata. So the firmware (if the 
precaldata comes from the flash/filesystem) doesn't have the chance to get the 
board_id [1] from the (pre)caldata. Which sounds wrong to me. But I have no
access to anything which would allow me to check how it should actually work.

Kind regards,
	Sven

[1] i think it was the refDesignId, projectId or something like this in ath10k



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
