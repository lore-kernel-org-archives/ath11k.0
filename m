Return-Path: <SRS0=NPuH=H2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78619C433E0
	for <ath11k@archiver.kernel.org>; Wed, 24 Feb 2021 06:53:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F14CE64E2B
	for <ath11k@archiver.kernel.org>; Wed, 24 Feb 2021 06:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F14CE64E2B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hhZl3IpCwOhOJpJ/STxNTH0BUPdMNbznoe28PdDxhHQ=; b=xKrUN/z3N8V0diS1CwNFdYGAH
	/uGbVvUmVuFveZ9OqbT4eNned+babq7LvCip6XHtvM4utQ47W0YaI4aqcMx73gDy09dFKwaFFxwCm
	viIzcEEm/E+eJRCq/nhPRh/22t651Z0B1ZUNmZlHmYpcluoTSSHz+cVBLXqsqOWNl7Z3B6nVhJi36
	omzXYROmdjzgdf7f2JbKCw6voKc8o9jhwRPZpW2UwMKtwF5OBoY+gMw98MeTxPgQyJ0eTdE6wEvFF
	nIdnSQXuuyVOz3qYEQVoS0y0CuZ0kbNp1+ClsussSD/nHTQiBf/1ioSJCAXzC2XtgzdLYTL6UR8PG
	5aNpFqwxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEo35-0005Ov-G4; Wed, 24 Feb 2021 06:53:27 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEo32-0005KE-8r
 for ath11k@lists.infradead.org; Wed, 24 Feb 2021 06:53:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614149604; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=MHS+FWRAMrdC80h0tzPcGk54lO0X0VMJLwQu1YDgv9I=;
 b=l6RYsGStZVX1Lw1qbfxwQv31cjZkncN55CiFYbTHuJktIvm7KazW1vfY8XSUm3KpTyH1Xtcg
 BiwgPb+FVmyPE99+TMWd+45W2SBXgkAZc/gCM8dpFFGOmNLMam/hPSoDHNGtD/U/Qmf/sL/M
 lizv33/n8/FOzK2QiikE6mC1Cok=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6035f7e3090a7742879839bb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 06:53:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A493CC433C6; Wed, 24 Feb 2021 06:53:23 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B9A9C433CA;
 Wed, 24 Feb 2021 06:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B9A9C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix potential wmi_mgmt_tx_queue race condition
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1613630709-704-1-git-send-email-miaoqing@codeaurora.org>
References: <1613630709-704-1-git-send-email-miaoqing@codeaurora.org>
To: Miaoqing Pan <miaoqing@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210224065323.A493CC433C6@smtp.codeaurora.org>
Date: Wed, 24 Feb 2021 06:53:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_015324_439703_4A8AD27B 
X-CRM114-Status: GOOD (  10.57  )
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 Miaoqing Pan <miaoqing@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Miaoqing Pan <miaoqing@codeaurora.org> wrote:

> There is a potential race condition between skb_queue_len()
> and skb_queue_tail(), the former may get old value before
> updated by the latter.
> 
> So use skb_queue_len_lockless() instead. And also use '>=',
> in case we queue a few SKBs simultaneously.
> 
> Found while discussing a similar fix for ath10k:
> https://patchwork.kernel.org/project/linux-wireless/patch/1608515579-1066-1-git-send-email-miaoqing@codeaurora.org/
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Miaoqing Pan <miaoqing@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

3808a18043a8 ath11k: fix potential wmi_mgmt_tx_queue race condition

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1613630709-704-1-git-send-email-miaoqing@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
