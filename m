Return-Path: <SRS0=NPuH=H2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66399C433E0
	for <ath11k@archiver.kernel.org>; Wed, 24 Feb 2021 06:38:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F04E964DCF
	for <ath11k@archiver.kernel.org>; Wed, 24 Feb 2021 06:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F04E964DCF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Iwk8GPU6Yz5Nx++/lA/s8NuOerSH8vU0rNXKBWKPijI=; b=GPYs0IesmclIaZdCUILZnObSf
	KyPf+xvGmKogeGzsAKdKj1ZFMVdmES37FW4F69+2wmo1prF7jZlJp9qo2pwBVrS3VHdrqxmIdCltr
	41gg9nzjDPfsn66MIH/bqJXyMc3xkFhZF9mk4S5yFlfGrbQMWL0tLWfBViqodkJBthL1+SkxDPqsB
	8UF/uqdRulK36q6vT0qf/OCt5e0yVWHKUQyjiWC7vmxuR9eZO48m5d0k9xte4XyNqJNmTOqNd7O/M
	Th2/hkir5NvDHIfC+Kl1IhjFZXPb77y+UVY9mv+aULvyHWqtGyQJ5ytKCYbJUQrPa5NJpL1J3S1I+
	hfmYdnW4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEnof-00042F-O6; Wed, 24 Feb 2021 06:38:33 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEnod-0003zN-RC
 for ath11k@lists.infradead.org; Wed, 24 Feb 2021 06:38:32 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614148711; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=8Pydcp9COoIGHDaoT0QgAMFt7/h/mut2grD4T9bcAEo=;
 b=H8I/+YQByoNamCJOxXPFSBd/6Rxj6HLYYS5s/7pPcTkfE3iJ+TFcOrxSLsekWAtOAbYysnp7
 BibBPxeF/xsLamtS39Q4f9xLBmDkpK64Y8N40nFFvjTWyECRHkuHEIDE8F7JezwRN82IYDia
 4Gste+IvhHqzrRTKDGjWJWXQfHQ=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6035f4674511108a815991e4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 06:38:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9C5C1C433ED; Wed, 24 Feb 2021 06:38:30 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 59EF1C433CA;
 Wed, 24 Feb 2021 06:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 59EF1C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 5.12] ath11k: fix AP mode for QCA6390
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1614006849-25764-1-git-send-email-kvalo@codeaurora.org>
References: <1614006849-25764-1-git-send-email-kvalo@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210224063830.9C5C1C433ED@smtp.codeaurora.org>
Date: Wed, 24 Feb 2021 06:38:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_013831_982916_47B5E000 
X-CRM114-Status: GOOD (  13.63  )
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> Commit c134d1f8c436 ("ath11k: Handle errors if peer creation fails") completely
> broke AP mode on QCA6390:
> 
> kernel: [  151.230734] ath11k_pci 0000:06:00.0: failed to create peer after vdev start delay: -22
> wpa_supplicant[2307]: Failed to set beacon parameters
> wpa_supplicant[2307]: Interface initialization failed
> wpa_supplicant[2307]: wlan0: interface state UNINITIALIZED->DISABLED
> wpa_supplicant[2307]: wlan0: AP-DISABLED
> wpa_supplicant[2307]: wlan0: Unable to setup interface.
> wpa_supplicant[2307]: Failed to initialize AP interface
> 
> This was because commit c134d1f8c436 ("ath11k: Handle errors if peer creation
> fails") added error handling for ath11k_peer_create(), which had been failing
> all along but was unnoticed due to the missing error handling. The actual bug
> was introduced already in commit aa44b2f3ecd4 ("ath11k: start vdev if a bss peer is
> already created").
> 
> ath11k_peer_create() was failing because for AP mode the peer is created
> already earlier op_add_interface() and we should skip creation here, but the
> check for modes was wrong.  Fixing that makes AP mode work again.
> 
> This shouldn't affect IPQ8074 nor QCN9074 as they have hw_params.vdev_start_delay disabled.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Fixes: c134d1f8c436 ("ath11k: Handle errors if peer creation fails")
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to wireless-drivers.git, thanks.

77d7e87128d4 ath11k: fix AP mode for QCA6390

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1614006849-25764-1-git-send-email-kvalo@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
