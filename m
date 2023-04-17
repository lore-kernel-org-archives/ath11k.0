Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34874C77B72
	for <ath11k@archiver.kernel.org>; Mon, 17 Apr 2023 10:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFdQBGBdpjucGILiKzJTY+j7p90+AHkHA1tDN4xFNkg=; b=cw2W0mA846B2L+
	ELVxUonVCCvycJDkDb2rSsNecethP1ZDtClQ39FlI/rv9dK1v7EtuU5RXYfze91v+QlmVTZ779lYy
	NLzDmcH3YorjJR8yU9rbIxioGsOSYvDsUes3ivFrJGyl2BXV0reuWLk5dQPQh8WGvPLW6iUq1M5Dx
	WwPI853g4FY8Pi6iyNy32ftgnYj2vRwMB6zbY0bhc9rjVuFU63oTD3V41X2s+LQwpauWUkEfCHd57
	FaSlNmi4a5mpRXcTaZsnLseHHK8aNm1Cy2Ty6Lhw5MhJZu7wogsV4YsYq8lMG6vvU2hhXZ/IL7nlx
	ugFudNIdY35t/d/tItOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poLvV-00Fht1-2h;
	Mon, 17 Apr 2023 10:17:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poLvS-00Fhsa-2z
	for ath11k@lists.infradead.org;
	Mon, 17 Apr 2023 10:17:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D1C0611E6;
	Mon, 17 Apr 2023 10:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4133C433D2;
	Mon, 17 Apr 2023 10:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681726653;
	bh=/fPCzxyxSiGP6+JHJKOXA+nXbM/XfTTQ4dmQysYc8xM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=AxEDjweu9kmtwN8nD6Zyc7Mkcv1dAB/6Ld/IKmFw4kZoWBEkhDai0HgF2x1Aw7LGy
	 qGwlzNYfBgl29sM3xECPdKGL4HyoEZKjhvzC0t6OXhdb0wIgRd0c8AVV51JAyjDzt5
	 JdE1JJBuPxP4D982s61OWzQG+Y0qvKY0WOGE+OM5tSe9CSK2857oyXEtSRy7FQ3WOh
	 fsUpeHjdDP1V5r3esIb9h5QSeC8d3ck5BHk0gK9WDRh+CtReq/IVpG4Jmn6ilDYW5n
	 VHruYFJ/snxtyU3doYDgaiAVUEXaHtjwd8SsTTaHpwdWBCxYdzK0yQe3hiwK7jFo+Z
	 uekvOq2kmg1Rw==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: pci: Add more MODULE_FIRMWARE() entries
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230330143718.19511-1-tiwai@suse.de>
References: <20230330143718.19511-1-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168172665084.12889.1483774754655787477.kvalo@kernel.org>
Date: Mon, 17 Apr 2023 10:17:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_031735_003327_E5DAC7D4 
X-CRM114-Status: GOOD (  11.01  )
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

Takashi Iwai <tiwai@suse.de> wrote:

> As there are a few more models supported by the driver, let's add the
> missing MODULE_FIRMWARE() entries for them.  The lack of them resulted
> in the missing device enablement on some systems, such as the
> installation image of openSUSE.
> 
> While we are at it, use the wildcard instead of listing each firmware
> files individually for each.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

06c584739692 wifi: ath11k: pci: Add more MODULE_FIRMWARE() entries

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230330143718.19511-1-tiwai@suse.de/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
