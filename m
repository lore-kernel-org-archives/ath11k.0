Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3C0C433F5
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 13:54:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C282611BD
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 13:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C282611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhNNJ09h1+WZLgdNsjvP1BL+RLrVaSp8FJ23cTm3Ul8=; b=z488Sx+bOU9Es3
	+//AphEEXDq/A/gRrFjpJFsIp9lWlBoHne3NF+AvcowB/kTGNd+oiKWgLSS+1COTnVHGBd7lNv/uC
	I9JlKCu9QsXy9PHp7kPs9ip4InPOPRYJlhQfK9hnV+HCVkzKrj8Bg0J7gzw21fIXtgFrUO1WX9FPg
	v27uDFUueu8g9+LApnk4+1ObIN1k9W5Dt6hF/YS2esyjHsSuGLaePQLmn3M4c+zoNAo3ZcJZdpAYJ
	c8jv9XghuA+VhNLks2sVrW67/4O+kMgIrHAMddHShMJUWb/od5xhs1+xOAzFzlCbYjyMCIJdUklS3
	jgiIVkwT/cuXyVhsJ9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVDYf-007RQ8-5N; Tue, 28 Sep 2021 13:54:09 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVDYX-007R4d-7S
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 13:54:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632837246; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=Xg9M50LR2M8PjOn9o4C3D1UQ4OrdmK9CBl06sbqFgoU=;
 b=lkAMU4cVMk0uqfb7rlkwpwcNMgR8DPxx+wpUebyTl0LZvs3iwVKIarJez6oIG5NhIX8zP2z0
 i3UydDnmx3fpSn2BZm6qL9ARCycMCAApc4wexaavBtyds1ASoGiWCS/4ekN8Nm0MhOkHpaoL
 Fh/NL1+aJufcyjtd3YqiGSYTM7E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61531e68b62327f2cba05984 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 13:53:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 95D50C43617; Tue, 28 Sep 2021 13:53:43 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 73D91C4360D;
 Tue, 28 Sep 2021 13:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 73D91C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] ath11k: Rename macro ARRAY_TO_STRING to
 PRINT_ARRAY_TO_BUF
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210913223148.208026-2-jouni@codeaurora.org>
References: <20210913223148.208026-2-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <seevalam@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928135343.95D50C43617@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 13:53:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_065406_167009_D13A6F3E 
X-CRM114-Status: UNSURE (   8.39  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> Renaming of macro is done to describe the macro functionality
> better as the macro functionality is modified in next patch-sets.
> No functional changes are done.
> 
> Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

5 patches applied to ath-next branch of ath.git, thanks.

9e2e2d7a4dd4 ath11k: Rename macro ARRAY_TO_STRING to PRINT_ARRAY_TO_BUF
6f442799bcfd ath11k: Replace HTT_DBG_OUT with scnprintf
74327bab6781 ath11k: Remove htt stats fixed size array usage
6ed731829cf8 ath11k: Change masking and shifting in htt stats
ac83b6034cfa ath11k: add HTT stats support for new stats

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210913223148.208026-2-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
