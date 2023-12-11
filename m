Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B7EC4167B
	for <ath11k@archiver.kernel.org>; Mon, 11 Dec 2023 16:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cxw4DUP9ZwH7Kkhsc9vnZbGp+73eT/u8vhKE2UAckcE=; b=GIDQLOBEqr8mC8A4Sm9yyWGH/t
	CkfVTIvai44of7L03waLcxHcsJeuaEF+kWTs41PKlUKmFNxrcQwKRBouKFJiaEqe2UunznGK7V/hz
	CwOhyHaI0AYSwnKgJCdVU1ACCIXJ3snLmzK6Z7caozO4aKEFHWNHJv9GgPTRHIVuDiVrFp5ygUIkD
	GRD2FXb/68W/oPg1prgwoB3CAiKG+bxK70aEh7bVT+Yv+QaWkvs/oG/BqenPRj1A1UV236jf+nHRO
	O5DckFvE5f4VYDV06k7VGIjtp4LYNWNuA0ybYaKTfp2WBR9KAL7TAtEP69Gw2jWvRwkdf8TygP07n
	cKBleUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCj2X-005lK9-2F;
	Mon, 11 Dec 2023 16:21:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCj2P-005lGP-1h
	for ath11k@lists.infradead.org;
	Mon, 11 Dec 2023 16:21:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D0756B80E6F;
	Mon, 11 Dec 2023 16:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E7BC433C7;
	Mon, 11 Dec 2023 16:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702311703;
	bh=IsVcmVaOq6dhAIFUxQQ76EOSwAHDoENQEc5t9GpD53I=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=M5pdaw53YwXDdJkbaF2ma6rhy7kbWINRxABirP8b9yKmW1O3ZMdnV/DM0dZSOYEf2
	 HuP49VSDRfhGNsmprPq49jhv0XMnQUCQAa3q9SQgwSqcTphMi2y2Q39tDveGGjTfdb
	 LuEG7FaKZ4cy9Ep3JcBGI76fmIpQ/jh8xzkPW4Y1KPJIe/LCAutfkdO0uRwbHDdO7+
	 KyUmY0UOD/nBWQDID7grCyj6RHJ+odET0I+SSe6nLM+QSh96JitvGA9smvDjPvt7y4
	 U8B3vJFpmHqXyKNNDx9hvXIoJ+HsZ0bVNrSkWGNlZKWGuvb4VptdFcAjsQuva3KwPU
	 8JPSW+yDeHdYw==
From: Kalle Valo <kvalo@kernel.org>
To: Jonathan Silverblood <jonathan@silverblood.se>
Cc: ath11k@lists.infradead.org
Subject: Re: Steam Deck OLED
References: <474422d679cfcf33eaa4129fd7491512@silverblood.se>
Date: Mon, 11 Dec 2023 18:21:40 +0200
In-Reply-To: <474422d679cfcf33eaa4129fd7491512@silverblood.se> (Jonathan
	Silverblood's message of "Fri, 08 Dec 2023 07:50:16 +0200")
Message-ID: <871qbspv57.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_082146_147395_772BC106 
X-CRM114-Status: GOOD (  13.96  )
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

Jonathan Silverblood <jonathan@silverblood.se> writes:

> I'm trying to run my preferred flavour of linux on the new steam deck
> oled and the wireless/bluetooth is not recognized.Based on some dmesg
> output and casual searching I suspect it's the firmware files that
> don't know the specific configuration used in this device. I verified
> it was working on steamos before I re-installed, so I thought I'd send
> my dmesg output here and see if there's anything else I can do to
> help.
>
> ath11k_pci 0000:03:00.0: chip_id 0x12 chip_family 0xb board_id 0x309
> soc_id 0x400c1211
> ath11k_pci 0000:03:00.0: fw_version 0x110b196e fw_build_timestamp
> 2022-12-22 12:54 fw_build_id
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> Loading firmware: ath11k/WCN6855/hw2.1/board-2.bin
> Loading firmware: ath11k/WCN6855/hw2.1/board-2.bin
> Loading firmware: ath11k/WCN6855/hw2.1/regdb.bin
> Loading firmware: ath11k/WCN6855/hw2.1/board-2.bin
> Loading firmware: ath11k/WCN6855/hw2.1/board-2.bin
> Loading firmware: ath11k/WCN6855/hw2.1/board.bin
> ath11k_pci 0000:03:00.0: failed to fetch board data for
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=18,qmi-board-id=777
> from ath11k/WCN6855/hw2.1/board-2.bin
> ath11k_pci 0000:03:00.0: failed to fetch board.bin from WCN6855/hw2.1
> ath11k_pci 0000:03:00.0: qmi failed to fetch board file: -2
> ath11k_pci 0000:03:00.0: failed to load board data file: -2

The board file for your device is missing from board-2.bin. Could you
please file a report to bugzilla.kernel.org so that it's easier to track
the issue:

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

