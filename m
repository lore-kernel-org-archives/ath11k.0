Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37C8C3DA42
	for <ath11k@archiver.kernel.org>; Mon,  8 Jul 2024 15:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LJa1GdtDb96XX+9mAWXvil1M4ztqoI6o7e4s4IL0I4=; b=3pnSDRZI084SDjR0ZXA6t0rWH7
	FEQJ7So8nFEcYYcSXJJR/LVALJQ8e/6xTJQSiDEdC47xb+Rd2woT4c62r2rzzCqpkqT18QWW8dR6x
	iFVoOoTbemi8cLP92PVqB4iwtQixv7vyPoRJww6U3WzRxueNshAdY3W0zJZl0RCWir7saX1CfMuzV
	KzeCpbcNTLRJ+R2max0xeqK/b1gRFmjwPmxqpkCAeq3g7/dhf+7gtaSHAveE44JXj9DAU3nRDfWB6
	KixI1yi0DS4dirC1Kbhlfjy91fqPrwzHKTb3U2Bvqua8ZwvAuLpUeAQo8eTRwm6YkeQsxWYaDG7mo
	AvFvaVqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQqEF-00000004Cj4-35ls;
	Mon, 08 Jul 2024 15:24:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQqEC-00000004Ch9-09Jy
	for ath11k@lists.infradead.org;
	Mon, 08 Jul 2024 15:24:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51F1C60EAA;
	Mon,  8 Jul 2024 15:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8B4C116B1;
	Mon,  8 Jul 2024 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720452271;
	bh=RtdMnG2g1v23/KHylu9IMpwhqd2M5PX8r18qm4q0trU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Ec1m7TBNL8CC5nd6cvzARmoeXpap+luakqyUbi0iw82CGwYijgXkly2EEYRy5/rJP
	 QfmXsnv1OdWYnrPXjkUoOFNFapKVuTI1g14GX/IdNRJovm3qH8aWFiHNCXk36a3PIB
	 wsfM05Qke31lsgDDUfJcAZNamBz27yHT59uKFqPCjnJOJU1miMUY4KMAm38icT4FfN
	 7qPof4U1of1epgKEn2A2YnF+SCDuTf+fppP/1ff0NghDJSsqrHLCZ+3q6Nt5f0XmtP
	 s0Aljo3rHk4adGjlScP/uSLPI2y5aIeS3Xie3a8BwJLGzwMSA6yz69Mmd3rQIWnFCR
	 t0M0imDBQOiOg==
From: Kalle Valo <kvalo@kernel.org>
To: Stefan Zegenhagen <stefan.zegenhagen@azg-tech.com>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k: IPQ6018: support for 802.11s MESH
References: <3581dfd05dd3468d97b3fd06072d206732da9482.camel@azg-tech.com>
Date: Mon, 08 Jul 2024 18:24:28 +0300
In-Reply-To: <3581dfd05dd3468d97b3fd06072d206732da9482.camel@azg-tech.com>
	(Stefan Zegenhagen's message of "Mon, 08 Jul 2024 14:44:34 +0200")
Message-ID: <87frsjdhzn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_082432_303049_015BDD0D 
X-CRM114-Status: GOOD (  12.85  )
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

Stefan Zegenhagen <stefan.zegenhagen@azg-tech.com> writes:

> Dear all,
>
> I've got an 8devices Mango board here with an IPQ6018 WiFi6 built-in
> via AHB and running kernel 6.6.35 with OpenWRT patches and firmware
> WLAN.HK.2.5.0.1-03982-QCAHKSWPL_SILICONZ-3.
>
> Somehow I can't get mesh support running as it should. Tried loading
> ath11k with frame_mode=1 which leads to association via MGMT frames
> working fine but afterwards no more frames are received and associated
> peers time out.
>
> When loading ath11k with frame_mode=0 (raw), association works well and
> afterwards I'm able to transmit frames with sufficient rates, but RX
> hardly works and spews loads of kernel messages.
>
> Is mesh supposed to be working at all with ath11k cards? (See below for
> more info.)

We can't give distro support, we only support kernel.org. If you are
using OpenWrt patches you should ask them, we don't know what changes
there are.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

