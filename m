Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FC7C433EF
	for <ath11k@archiver.kernel.org>; Wed, 13 Apr 2022 08:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sWNz+tjQXMcDWAPVd/wXeiseUeTYcpAj7bEKtWj/XE=; b=gVxs4n1mkExEPX
	+lJODQoygBxsQaCI7AjIPnMih2V9tzJZjbXB58SjQcJKsqAotHMXjzECXT3XuC/GBhBdGha/7L4S8
	txSuqKD8b+jNnpcI9y8WIYCYGcIDIlwaMz2i++zFvNxTFUr5kyMQl3jpI7L+ns4ttCG+WBTWWIiWQ
	NjnIqfm1+VS7QKcsTPzEYjqAgZZYQ+uSMdlph7F8hUT8uOO+SiYXON89CuJYAp0lojAC9o4QDDyby
	1KlUysZCBVrsVPnbJWdQqUs9ZLADbjg3jxkO9HF3fyWgWxFRwoXpcP2XpL05t7KuVaW34pezxy841
	jQ6iT6ARf0hUPQhLpjAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYTD-00065H-Gr; Wed, 13 Apr 2022 08:35:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYTA-00063Y-8B
 for ath11k@lists.infradead.org; Wed, 13 Apr 2022 08:35:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6D27FB820FD;
 Wed, 13 Apr 2022 08:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916C2C385A4;
 Wed, 13 Apr 2022 08:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649838917;
 bh=O2FGXzaHcgsMdw2YOZyd3pEFqud0Qrr4TlAakh3gCPY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Ev9Rk7mKOXZgb2DWeHPrcOF9tXks/Le1HCl9D50dhwT0hYT5REutFKXXAhscPjCMt
 3GOVQeST6KJQshbSR9VjDyDBNbDULHI8yD0d8r+O2MWwhFPRgEEUfstR+2+9MFd/ES
 fGJJp2F7ayKjZIUF6XDkioCRv4Loy6vOFrvviJSpMFHmJ5LTBHstKWITaUOA8IAc8C
 /ewOTd2dz498Qh+55He6lK8m5AFUQeBtW81uJu8hbA1FmLXxp1EV9WXVd6ReO4DxfW
 pAMuH1jEaFsf1qUnNEv5Fjgv/3el78kB1RRaUDn21hR5n8M9+9XCENiQQthJnyBCCY
 IovkdPlCWRWWw==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k-firmware: QCA6390 hw2.0: add RB5-specific BDF
References: <00ece2e5-7bcb-0b2b-23d2-e25cf4c9d13e@linaro.org>
Date: Wed, 13 Apr 2022 11:35:14 +0300
In-Reply-To: <00ece2e5-7bcb-0b2b-23d2-e25cf4c9d13e@linaro.org> (Dmitry
 Baryshkov's message of "Fri, 18 Feb 2022 08:15:19 +0300")
Message-ID: <878rs9mldp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_013520_526579_DBEAD9DA 
X-CRM114-Status: GOOD (  14.42  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Hi,
>
> We'd like to ask for inclusion for the board file for Qualcomm
> Robotics RB5 Development Kit.
>
> Following the questions from the ath10k wiki page:
>
> * description for what hardware this is
>  - It an QRB5165 (a variant of SM8250) based board.
>  - It uses qca6391 chip as a WiFi and BT radio
>
> * origin of the board file
>  - It comes from the BSP package distributed by Linaro
> (http://releases.linaro.org/96boards/rb5/qualcomm/firmware/RB5_firmware_20210901-v6.zip)
>
> * ids to be used with the board file
>  - bus=pci,qmi-chip-id=0,qmi-board-id=4
>
> * md5sum of each new board file to add
>
> $ md5sum *
> ac812072da8de6bd4de257cf5bb870c7  bus=pci,qmi-chip-id=0,qmi-board-id=4.bin
> $ sha256sum *
> 8cc579b1f8b874e64a8518d7eb6a702aa7bab65744261f0feb1671e5436c5e55
> bus=pci,qmi-chip-id=0,qmi-board-id=4.bin

Added, thanks.

https://github.com/kvalo/ath11k-firmware/commit/9412445dcb3d4a27bd7742112eed2444ed0d4e86

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
