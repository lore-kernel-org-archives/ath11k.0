Return-Path: <SRS0=Y6aC=HN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4968C433DB
	for <ath11k@archiver.kernel.org>; Thu, 11 Feb 2021 18:28:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8893464E5F
	for <ath11k@archiver.kernel.org>; Thu, 11 Feb 2021 18:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8893464E5F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ffI/yiS6Vvk2H7WmXf+TQ+RpX3X9EZMqYjw7dBuLocM=; b=DBxldhgiKwEvX+vviuH1maZvc
	PmUmcOO1CC5J/dBP8jv/S1kSUro/YD4Oh3VZSbib23ecjb750mmxfyR6aeHin69vc7bC2fA/YmOvR
	8KDbl+y1dz4oANvB4KNTuzCKLnMlxel71Ra/XvF4tZa0/f1zJeHJZhDCBSrbWceNpx6FsSOFV2bUX
	hBjF+FBB326qguRxl+VGSQTfg2S6MECmvAK+cIT3neSrb9WsIXJK+3YotgiZ62HBwYCWV7ZOiiyH9
	/mClprSq72/sM2zhi+dqgGSkPJ1CSo3u01VC7pWOJTJxvirOK7tbW6kAXcDHX/2SSFs1d5UzGiNl8
	+roRCEwmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAGhF-0002Xh-Nf; Thu, 11 Feb 2021 18:28:09 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAGhD-0002L0-I3
 for ath11k@lists.infradead.org; Thu, 11 Feb 2021 18:28:08 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613068087; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=UCr6Qu1x/KXzCEWz+hUPApQ3MY+GL7n0llb08Ju0pBk=;
 b=CkgthsV14eHu9S28HxQoDSONkVEw8lxutWLsiHv2wpoesHHE+NHbZ85ci/ZyNjxtuxo9zv8w
 B/ThV6s1t5cnXekSNVNfuQplJgvTL/Dc9ji/F0Vi6NFmOzk9xhB99aIoVNIZ2EiTeF8Pd5gB
 exBVk1Xfzb7wnocpmKFGQENkRkw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 602577364bd23a05aef3ac24 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Feb 2021 18:28:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 023E8C433C6; Thu, 11 Feb 2021 18:28:06 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D3323C433CA;
 Thu, 11 Feb 2021 18:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D3323C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: qmi: add debug message for allocated memory
 segment addresses and sizes
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1613041549-7265-1-git-send-email-kvalo@codeaurora.org>
References: <1613041549-7265-1-git-send-email-kvalo@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210211182806.023E8C433C6@smtp.codeaurora.org>
Date: Thu, 11 Feb 2021 18:28:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_132808_019913_8887A5EE 
X-CRM114-Status: UNSURE (   7.36  )
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> This helps debugging firmware memory allocation problems.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

d5395a548659 ath11k: qmi: add debug message for allocated memory segment addresses and sizes

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1613041549-7265-1-git-send-email-kvalo@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
