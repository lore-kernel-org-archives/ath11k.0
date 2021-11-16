Return-Path: <SRS0=S5NU=QD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F75C433F5
	for <ath11k@archiver.kernel.org>; Tue, 16 Nov 2021 13:38:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 499AA61B44
	for <ath11k@archiver.kernel.org>; Tue, 16 Nov 2021 13:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 499AA61B44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=familie-heinz.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uSTHbNAhk48mvVdn4ipSOGY2VZysa318g+5277RdrHg=; b=Ngpt827AKE3JBs
	1Xuyfz1PzLL38k9rTlA5ooPbRnuYNfqGFwhsW3mbzj3UdM6bVZ/jUlnUy9TgP+SHYYAYd0ozCfbK0
	6KQn6Sv5aefgF/IJHJdA2XICMIoFMUElKr+O7A4lVPIjpkbJ1FhhfHqRuGON0rAJ436zJRRBwUrfX
	AealsAJizbmCYoDQoAVJdaR6KkMCFCLkUF5EVPYAkFCiBJW2hw92nYcAZhnznnTMSO3J8yrT4ddxX
	0hTtNUGTd5kxkbzk0RO0HUqVsGSabdZjvl6gKSjYrYfNx9a/k5UQnHWhWSb6NqXtz6ADgWuH40Uyj
	vdkB38FZtArtlRYL3LAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmyev-001oUU-At; Tue, 16 Nov 2021 13:38:01 +0000
Received: from mardihas.de ([157.90.160.214] helo=mail.mardihas.de)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmyes-001oU3-OS
 for ath11k@lists.infradead.org; Tue, 16 Nov 2021 13:38:00 +0000
Received: from egalite.localnet (pd9e62930.dip0.t-ipconnect.de [217.230.41.48])
 (Authenticated sender: mh@familie-heinz.name)
 by mail.mardihas.de (Postfix) with ESMTPSA id C1A3D1F437
 for <ath11k@lists.infradead.org>; Tue, 16 Nov 2021 14:37:53 +0100 (CET)
From: Matthias Heinz <mh@familie-heinz.name>
To: ath11k@lists.infradead.org
Subject: DBDC on QCA6391
Date: Tue, 16 Nov 2021 14:37:50 +0100
Message-ID: <2295426.Z0lnmcgGnI@egalite>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_053759_001595_6598DD7E 
X-CRM114-Status: UNSURE (   3.13  )
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

Hello ath11k team,

I got a Compex WLT639 for testing purpose. It runs fine with the ath11k driver. 
But the chipset is said to support dbdc. How - if possible at all - can I 
enable dbdc mode?


Best regards
Matthias





-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
