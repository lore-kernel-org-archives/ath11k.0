Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FF1C433FE
	for <ath11k@archiver.kernel.org>; Tue,  4 Oct 2022 17:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:From:To
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3idiso9NQErJitEIKJJg9/jbL1ZeX/h7zEo5weFOQ78=; b=3kutg5BF1ixbkq
	QBgRhLkj7LcT3ymcHML8I5JjUZ7nJlu+x6r+4sppqqSIWC/UssQ3vFd5BO23Ffhx5L2qPiDT0xRDo
	k+gGthtXaGKvjtisZzyA4XYLW8x/bVfgCuDxRG4/EezjHqrAeKkg95N1JS/ggNjQZzZAtSsQ2XVEx
	n7ekth0Jv7Oz3myrZXq5JE2h2PDv7UEokXQ3CvYSCoI/1HZegE3VWNyIGokDZG3u9vgry9FnrN48A
	2Vn3qOyb6G2ihRoBpasiBbNJPq0AZZMHF54rIAquAM+KXQOK41SBZHjY+9pIe5cU7NvhvTfefbsJG
	UhYNCUsUTe4E+BtbdKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oflNq-00AGJ5-9Y; Tue, 04 Oct 2022 17:07:06 +0000
Received: from mail-4027.protonmail.ch ([185.70.40.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oflNn-00AGIh-12
	for ath11k@lists.infradead.org; Tue, 04 Oct 2022 17:07:05 +0000
Date: Tue, 04 Oct 2022 17:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1664903219; x=1665162419;
	bh=RqOeTc/YYgnufgY59cML1akv6JPv2w8Bezo7NEYb9YY=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID;
	b=J1A6VqQJnix577dl+h+KQ28+BjbvHdYyyGctb/P9pBe7hZv8xw0w7MR/xCgJy7avv
	 p/8UjUQHM+jzJay4IBDjW2JIUXqI2wHLWT+ycjpW9Q7857pV/8bdDBMoKnS2GTxnhw
	 3arDqamemjr1FSnlGsJJKk6yjq+tGrlmQYiFrMw3+eIXX6GON2L+uLyfG7ZOfMf9tG
	 ghqbBO4JOoDEdgbQsAm9ctm62LBFs9gs+LXbQGNM2g0lWKUljWe4rwk/vEmCB4ih9h
	 ORO7jfFA/CpvGZ9ed3UsVDZhX2tG6jyfkihR80G+lhIFZu541C8T+L4fpxTXtVg2Ew
	 TFpyElvMpvDxQ==
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
From: jloretto70 <jloretto70@proton.me>
Subject: Question about WCN6855 firmware versions
Message-ID: <ozkZDmxXw0zoF9CbOu2CoxEILU4fpAb8udwK4yw-Jgwc1z7zvIZD91zIK0rxq-8vri3WDPztrozKOgZvm4-SLnBvOJoVmg_qr3s47YeckL4=@proton.me>
Feedback-ID: 56744452:user:proton
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_100704_541601_8F22F951 
X-CRM114-Status: UNSURE (   4.02  )
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

Hello,

I have a WCN6855 (hw2.1) card and am currently using the latest firmware files from the kernel.org repo which are labeled 3.6510.9 in the commit message. I see that there is a more recent set of files labeled 3.6510.16 in the GitHub repo for this card. Are these firmware files safe to use or is the best practice to wait until they land in the official kernel.org repo?

Thank you.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
