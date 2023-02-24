Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D585C61DA3
	for <ath11k@archiver.kernel.org>; Fri, 24 Feb 2023 14:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgn/Yfaxq5wzzrE62My55dwr76vxO4F+eIz+2SgOgh0=; b=jX2IoHZXiF1zjI
	u7qz8K4sNyhoEmYzpeQRPaUUUgFHcUy3xFVBrnUb0nnf3pdZT4Bd6ngBPyUAYegk1Jnhd+jPn5N+o
	uagDzxipmYvIU9XMTz/SVWDuNvRwCR+60Aurjo0xVapKpyTmmGrSLyJ/Wd4qJs9PAq1gLi+Tj6waT
	dH64WkDPIo1z2kra5Y8RMd3THMaiwdxSA9HzWC4JfJy0Z3tPoLOf1XJ44dpI9iAW4+ViJ0Dy6AjcW
	F0lUWUSbIkPuuQkWsPJF3vLkKOzXEKAmUjQIvf1C9bA+EH/967jeMojLaoL8T5qcV5tsaoafuz5kb
	mdWych9nUx/8agsi6T6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZT1-002oyR-AN; Fri, 24 Feb 2023 14:54:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZSy-002oxy-Vq
	for ath11k@lists.infradead.org; Fri, 24 Feb 2023 14:54:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 61D4EB81BF2;
	Fri, 24 Feb 2023 14:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F153C433A0;
	Fri, 24 Feb 2023 14:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677250470;
	bh=1kMgqLhHUiXtC2VnyR4OdoH2n+IV/DAzN4ozBkQZ1+I=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=CSk9nonCNQniRawxp0DZRNdOL4wJwqCVksw889+OP+ueoYNFjvw051TSe+8nZ9sZ3
	 UmL7XFo0y0onve6ZzbjWP2DyqjyFkmWV1o5HICIMvqKtUxXsa+GZihaCuagsUllQDq
	 cg2zos78w+rs/o3s+UL2xumlRUQIptZMObq7yQjguXs8lhPBPsNjg5ORMI0UPEHojx
	 dGAS8EkVErnv2dGi5IBgJ5D9Th8ruzbxqAOykqnG/Qg08fUZVLQWgDFKuJg00mV977
	 tHTvfuPcJzwkhYtXoPvpjgvhanDRndpEO6uzwntWir5xzVXn1ckIls4oI3MItOqNoD
	 Pab/kMBEhRMcA==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 0/3] Enable low power mode when WLAN is not active
References: <20230203060128.19625-1-quic_mpubbise@quicinc.com>
Date: Fri, 24 Feb 2023 16:54:26 +0200
In-Reply-To: <20230203060128.19625-1-quic_mpubbise@quicinc.com> (Manikanta
	Pubbisetty's message of "Fri, 3 Feb 2023 11:31:25 +0530")
Message-ID: <878rgnru59.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_065433_192947_EB0847A9 
X-CRM114-Status: GOOD (  12.30  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> Currently, WLAN chip is powered once during driver probe and is kept
> ON (powered) always even when WLAN is not active; keeping the chip
> powered ON all the time will consume extra power which is not
> desirable for battery operated devices. Same is the case with non-WoW
> suspend, chip will not be put into low power mode when the system is
> suspended resulting in higher battery drain.
>
> Send QMI MODE OFF command to firmware during WiFi OFF to put device
> into low power mode.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
>
> Manikanta Pubbisetty (3):
>   ath11k: Fix double free issue during SRNG deinit
>   ath11k: Move hardware initialization logic to start()
>   ath11k: Enable low power mode when WLAN is not active

Please add "wifi:" to all patches.

And please add "wifi: ath11k:" to the cover letter.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
