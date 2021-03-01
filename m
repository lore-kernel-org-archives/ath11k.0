Return-Path: <SRS0=Rum7=H7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92433C43332
	for <ath11k@archiver.kernel.org>; Mon,  1 Mar 2021 10:23:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02F44601FE
	for <ath11k@archiver.kernel.org>; Mon,  1 Mar 2021 10:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02F44601FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pq+K7P+chFoCWkddTWPtKafbtL47jlyNWkaX5HqPF6E=; b=f+pVec/Ou6SK1ypF+Wm91NdoXq
	y15/QwbAzaKKqJ50z2uxegQ0sWC6gWXMJeMhR+dIKjXV6i57QtyPyNuyAGsVjTYcy4WbgtKEzNG4k
	6VGkBuBh8MB/VzGO76YIZsuM/ZDF7LDGdF/rvsSAoD6pvkSrWGmOi/60ZmjEww8jVvDle96yAvRfI
	ZzYaPV4N4sZiBjTKVzwt6aKznSYMUcT2lAlH1voHH2vXTVGW4MO+S6SHWhvECzGHrXTs+lP2xyQEY
	pzqeLuhXiO7uPM3tYKcQirxjzA6kYpbnrU497VcTF8fB6DkSLrjf36f+Ssg37JokKVS6EcYCtObC9
	kfFQ2VkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGfi8-0008Mv-2G; Mon, 01 Mar 2021 10:23:32 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGfeh-0006GJ-81
 for ath11k@lists.infradead.org; Mon, 01 Mar 2021 10:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1614593998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1WD++3/T3bwkBYil1M+kGBkX1PQdNQF3o+qkGMJ4Arc=;
 b=0/PTZz3DaRemSOOWiBX9RT17z4qdVADYOS6O0H8s9xVRjUfam3MguMI0TaZPJG4GbLVUqS
 pXZnDEyf7lZhznYUm7HfIcmVLDiE9HAGWQpofVqetQVc6V1Cjkal2T91WHec9lsanQvCye
 B97Leem7Xbth52shE/tsyuOPW6EmD9E=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>
Subject: Re: IPQ8074: hw2.0: Wrong mac address for 2.4GHz PHY with firmware
 2.5.0.1.r1-00004
Date: Mon, 01 Mar 2021 11:19:55 +0100
Message-ID: <2531348.tr8x5fjkbv@ripper>
In-Reply-To: <4391993.8BYWHWz4yj@ripper>
References: <12396947.EVyyLHbfrO@ripper> <4391993.8BYWHWz4yj@ripper>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_051959_518739_D77C56F2 
X-CRM114-Status: UNSURE (   8.35  )
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

On Monday, 1 March 2021 10:46:56 CET Sven Eckelmann wrote:
> On Monday, 18 January 2021 09:14:54 CET Sven Eckelmann wrote:
> [...]
> > Now with the new firmware WLAN.HK.2.5.0.1.r1-00004-QCAHKSWPL_SILICONZ-1, it 
> > suddenly uses a mac address which is not part of the pre-cal data.
> 
> @Kalle, the QCA firmware team assumes that this is fixed in 2.5.0.1.r2. Could 
> you provide this also in ath11k-firmware?

Just had the chance to test it - just to confirm it before you spend the time 
for publishing it in your repository:

    $ dmesg|grep fw_version
    ath11k c000000.wifi1: qmi fw_version: 0x250b04a5 fw_build_timestamp: 2021-01-22 03:29 fw_build_id: QC_IMAGE_VERSION_STRING=WLAN.HK.2.5.0.1.r2-00013-QCAHKSWPL_SILICONZ-2

    $ grep '' /sys/class/ieee80211/phy*/mac*
    /sys/class/ieee80211/phy0/macaddress:f8:d9:b8:2e:36:c4
    /sys/class/ieee80211/phy1/macaddress:f8:d9:b8:2e:36:d0
    /sys/class/ieee80211/phy2/macaddress:f8:d9:b8:2e:36:c8

So it matches now with the behavior of 
WLAN.HK.2.4.0.1.r1-00026-QCAHKSWPL_SILICONZ-2.

Kind regards,
	Sven



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
