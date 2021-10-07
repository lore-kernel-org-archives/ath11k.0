Return-Path: <SRS0=tHTJ=O3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FF7C433F5
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 14:52:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C20856109F
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 14:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C20856109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9eEdWdyYRy21Hq1gPknAWFpdn6dFUXNjQ2Wd/+tnPs=; b=NbeoY6SF9H4EMO
	FeZHieCISSopPeMAYQ/OnAr/o6HSuViRm3LTIUlbpU6B4FznbVa8rQ8bPGNlRjC7VHuQKmnb4qYu8
	eHchE0ChrkG97ZjDPCpfj+hZ74xGxLWk5FsAPNmei8H2O8eyKR9OsOls9OYz2q5pL8DHmKtQP7dHB
	V1c5hYnGXNPqbg520j/1+OSAzSOszOZw+5Yua/DUZ3LUmevManvOc52ypzcWQWoaaGcS3ovhtIvij
	7DQsG859mLu/zGg1WGSFhOQpc7TI+TtHldRVhUUtRqy6+6MoYmxM3ZjPvJeWT3/ddUb1tkrLaejPW
	8oswnOdOvkypgSXUI6jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYUlF-0004ST-Mh; Thu, 07 Oct 2021 14:52:41 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYUlC-0004Rz-Nc
 for ath11k@lists.infradead.org; Thu, 07 Oct 2021 14:52:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633618358; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=viYmgYRwFaqRM+Qbx3Egqzt8j0aj4mHAUmADofZbvKE=;
 b=hc7s5W48mzmTmaUn5Wn2ojIUIFZHv+mSNPmMIh7ne3QsGnUoV4HN9PRDmUQ6pZ6tnHvJMnRV
 JfRyHIZtT09wrktarQMmzqZ1rOmmqpKRW1gj0seqRrkdGh1tPEEXszP+OeKkauYogPUz47nc
 hBb52OsIa/Y6DAPbchP5Z9z4wkk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 615f09b503355859c8266e61 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 14:52:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 35322C43618; Thu,  7 Oct 2021 14:52:37 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 86014C4338F;
 Thu,  7 Oct 2021 14:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 86014C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath11k: Fix spelling mistake "incompaitiblity" ->
 "incompatibility"
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211006083217.349596-1-colin.king@canonical.com>
References: <20211006083217.349596-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163361835071.17431.1471476207950050430.kvalo@codeaurora.org>
Date: Thu,  7 Oct 2021 14:52:37 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_075239_086080_BF4FCC7D 
X-CRM114-Status: UNSURE (   5.38  )
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

Colin King <colin.king@canonical.com> wrote:

> There is a spelling mistake in an ath11k_warn message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

567ec33a76c7 ath11k: Fix spelling mistake "incompaitiblity" -> "incompatibility"

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211006083217.349596-1-colin.king@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
