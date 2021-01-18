Return-Path: <SRS0=R0Ww=GV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA51C433E0
	for <ath11k@archiver.kernel.org>; Mon, 18 Jan 2021 08:15:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF4422525
	for <ath11k@archiver.kernel.org>; Mon, 18 Jan 2021 08:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FF4422525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VTr9nRB9TEuOn/odMP/rbt+QfwZfFerwPijiNTUne1g=; b=rlJ/hylDhfePccFd4UHDJeQbMJ
	15KsP8PgG+pmtj9wlPB6OXb0QUVS7Lnav/QkeYQEgnCRi/3FV2kKkI10HzmELGgWRLYtKuhvEHV1b
	OKArTXx3wIqH5/BM0BCV8SMJ/KPifwJlPbtH9QkL5vKJzBFpyV/XggpodTz5Pv/l5U+SajRs2YdUz
	E482kij9DzIGX+oiEHZIk/K8JTGhNwWKWs7kZPT36W9e90km1ghQynthFOgpV6XnTRH2daCbXPSEy
	VTMPhAVefL9gS3DXYfrKtxTGmMFP8vajXL1gbgWejk+y0ognPXAheG40To7bATGK75IYWdVGkSPMu
	GLfG64dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Pgl-0007JK-9T; Mon, 18 Jan 2021 08:15:03 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Pgi-0007IZ-Fg
 for ath11k@lists.infradead.org; Mon, 18 Jan 2021 08:15:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1610957697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lL2v/KdKl2B/+D9+u2EhHo/xekuluFsHt63W0Q+j++4=;
 b=LVMO+08vonjN2YAWlFqhieVjVBkdEf3oFRSB+/jXsTOFMUidNpY0d9yr4nbUPh2E5wQQFp
 6h12gMeJ+FuzEuheXCTV+eJT3yIeoOhCdodGmazpOx/sUph9nK0rn/66s3KTSuGf8AA8i+
 mUnohOUO/tGdKmnDg4RQAUAP8dohtAM=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Subject: IPQ8074: hw2.0: Wrong mac address for 2.4GHz PHY with firmware
 2.5.0.1.r1-00004
Date: Mon, 18 Jan 2021 09:14:54 +0100
Message-ID: <12396947.EVyyLHbfrO@ripper>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_031500_751796_97291EA8 
X-CRM114-Status: UNSURE (   4.15  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
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

[already send this last week but mime messages seem to be blocked on this ml]

Hi,

I have here a device which was previously using the firmware 
WLAN.HK.2.4.0.1.r1-00026-QCAHKSWPL_SILICONZ-2. It has a ath10k radio for 
scanning (phy0), an ath11k 5GHz radio0 (phy1) and a 2.4GHz radio (phy2).

   /sys/class/ieee80211/phy0/macaddress:f8:d9:b8:2e:36:c4 (ath10k)
   /sys/class/ieee80211/phy1/macaddress:f8:d9:b8:2e:36:d0
   /sys/class/ieee80211/phy2/macaddress:f8:d9:b8:2e:37:c8

Now with the new firmware WLAN.HK.2.5.0.1.r1-00004-QCAHKSWPL_SILICONZ-1, it 
suddenly uses a mac address which is not part of the pre-cal data.

   /sys/class/ieee80211/phy0/macaddress:f8:d9:b8:2e:36:c4 (ath10k)
   /sys/class/ieee80211/phy1/macaddress:f8:d9:b8:2e:36:d0
   /sys/class/ieee80211/phy2/macaddress:f8:d9:b8:2e:37:d0

This odd behavior causes layer 2 (mac) address conflicts - which should never 
ever happen.

The device was just performed a cold boot and I have no idea why the firmware 
reports this mac address. But the caldata is attached for further inspection
to the next mail (which Kalle has to approve manually). 

It has following set

* first mac (COMMON_BDF_HEADER.baseBdfHeader.macAddr[0]):    f8:d9:b8:2e:36:d0
* second mac (COMMON_BDF_HEADER.baseBdfHeader.macAddr[1]):   f8:d9:b8:2e:36:c8
* number macs (COMMON_BDF_HEADER.baseBdfHeader.numMacAddr):  2
* mac flag (COMMON_BDF_HEADER.baseBdfHeader.nvMacFlag):      1

Kind regards,
	Sven



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
