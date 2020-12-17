Return-Path: <SRS0=ZjKK=FV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643F7C4361B
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 06:49:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18A7823426
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 06:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18A7823426
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Be0eCfenjrG3PO/z2Lw3HUNZqtYGLu8lWnZc1utMXA=; b=mmxYj8YRkinET77ZslMhD7BeL
	E/jG6KZsGhssVZ94qLy8ZqBaGjo2IrWOkV0TScUm1n4HHCCEHxmwI3I/qh/Aw2nSW5xzTGeHrFbXK
	CIQ2un6sxMMdrNtd1DdrYKAbROapUuIw3xqEiU3sjT6f5ExB2q8zz9JDeyIkoZ981Pel9U9Ify7SM
	y+DdpU3UcKoJk8lsBo6sYnBDleUBcaTGhwtILqYRD6VnwlVz1ABDFJ0zd4AGkj2PNNBkAbCs3zWkC
	eN+BE+NCnO8qTM0rHqkUxgCHKrCtMQ6hunCsmDzWVBx9Zdr+uUf/4u/azeGxmdsi61gvbZel5sQqr
	ctoc7H5PQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpn5x-0001lj-H5; Thu, 17 Dec 2020 06:49:01 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpn5t-0001cx-0J
 for ath11k@lists.infradead.org; Thu, 17 Dec 2020 06:48:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608187738; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=IZ5gIE7BXGUIj9BGo/lIosGYRz5aQPB7biVl5MRFOW4=;
 b=rugr+C3G0+BPTkB7P5ZnLTumWVW4j9/ttJ296EUP/l+aNBC1gHemeOV2qAkBEJu/lXgonlcy
 gkkAeeO/0YC/mk1kcxaDGitEaGU7mIOk2ggXQ+LKehuZkxGSidfmgRGKgEugggWpuib0alra
 MjaI/I9/RbZ+J6ScD0AZbNY9KWc=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fdaff490564dfefcdce246e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 06:48:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EA33EC433ED; Thu, 17 Dec 2020 06:48:40 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 561EAC433CA;
 Thu, 17 Dec 2020 06:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 561EAC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: Fix error code in ath11k_core_suspend()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <X9nF17L2/EKOSbn/@mwanda>
References: <X9nF17L2/EKOSbn/@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20201217064840.EA33EC433ED@smtp.codeaurora.org>
Date: Thu, 17 Dec 2020 06:48:40 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_014858_918656_A5CED7B1 
X-CRM114-Status: UNSURE (   9.36  )
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
Cc: kernel-janitors@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "if (!ret)" condition is inverted and it should be "if (ret)".  It means
> that we return success when we had intended to return an error code. This also
> caused a spurious warning even when the suspend was successful:
> 
> [  297.186612] ath11k_pci 0000:06:00.0: failed to suspend hif: 0
> 
> Fixes: d1b0c33850d2 ("ath11k: implement suspend for QCA6390 PCI devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-current branch of ath.git, thanks.

9b09456258ea ath11k: Fix error code in ath11k_core_suspend()
30d085039314 ath11k: Fix ath11k_pci_fix_l1ss()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/X9nF17L2/EKOSbn/@mwanda/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
