Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C3AC6FA82
	for <ath11k@archiver.kernel.org>; Thu, 22 Sep 2022 07:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SdYsQraYW4Ei7HJEAtOPk696bflepGgViNM/tTk1Jws=; b=wS2J6soClrx04o
	qIWWZz2ZNUkzQp2eIUNPdlCBnsdYvj2yk6PHaTe9gkoMNtPWc7XgNV4ADg3R+8IOdUlU4SG9Kw/c6
	7A4xXcIyZTZJiX3l66vvtD4d/dcoASLSoFn0o2a7EP59/9OYwjdhl4uSnNDSnqsA2QlV8IyfCfRQh
	5IykS/kZR+D96HfY7+d4gsqSuLetAbwm8A7WeaBvdRTNJGpteJ9JO7K+vykYSn6lLVQDmvZodLMcf
	mMujTXgsUq31FcHyazd2T4GMa5KHf7isgJf1USiraveA4eKH+TmzEKfJ9va0mGKcLopEayQFOnSrq
	B3eDUgTXh/OGgpw7zd9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGiR-00DsXB-4V; Thu, 22 Sep 2022 07:33:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGiN-00DsUm-8K
	for ath11k@lists.infradead.org; Thu, 22 Sep 2022 07:33:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5887DB834B9;
	Thu, 22 Sep 2022 07:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CE1C433D6;
	Thu, 22 Sep 2022 07:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663832020;
	bh=NtUVFVS5gh4WMHKUCifTp8QSCyfeIHcPPtmlPDPG3rk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=GE1T3ylpsFIUxunffMTpo4ZXVMFDqwREAQDJOBIBadBe8YVH2DvUlSSvMaHRCcWqK
	 qghnYDZpPfLMIsfy1/g2BKlPAUJ9ZrKGxtuROucXAEJ0obfQrqnPzWrE5iTchTuMUQ
	 ae6/Fw0DVKWVBUjGa8r997PM73wgdtOp8gIjYSrWppcz3zWOgv3dxZmoVtiZLVSjG3
	 w7JUtv98DRiwLx7Sx8Xa9zB2vrerh3ZniXI9T4Omf90BjJmIQQC03PGU43M+bUJBdU
	 5hMR4rgdKqUK/s5xx83S9W71eaZLgFIE7mfu6YngkHPeqQETB5aauDY8MIolCOjSpz
	 8RcTKp8zIVPbQ==
MIME-Version: 1.0
Subject: Re: [PATCH v3] wifi: ath11k: retrieve MAC address from system
 firmware if
 provided
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220920003117.841442-1-junyuu@chromium.org>
References: <20220920003117.841442-1-junyuu@chromium.org>
To: Jun Yu <junyuu@chromium.org>
Cc: ath11k@lists.infradead.org, quic_jjohnson@quicinc.com,
 linux-wireless@vger.kernel.org, Jun Yu <junyuu@chromium.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166383201294.5334.14513414529811662280.kvalo@kernel.org>
Date: Thu, 22 Sep 2022 07:33:38 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_003343_476652_098CE485 
X-CRM114-Status: UNSURE (   9.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Jun Yu <junyuu@chromium.org> wrote:

> Devices may provide their own MAC address via system firmware (e.g.,
> device tree), especially in the case where the device doesn't have a
> useful EEPROM on which to store its MAC address (e.g., for integrated
> ahb WCN6750).
> 
> Use the generic device helper to retrieve the MAC address, and (if
> present) honor it above the MAC address advertised by the card.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Jun Yu <junyuu@chromium.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

176239a9a2e3 wifi: ath11k: retrieve MAC address from system firmware if provided

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220920003117.841442-1-junyuu@chromium.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
