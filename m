Return-Path: <SRS0=hMZx=IQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65088C433E0
	for <ath11k@archiver.kernel.org>; Thu, 18 Mar 2021 16:30:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1DEB64DDD
	for <ath11k@archiver.kernel.org>; Thu, 18 Mar 2021 16:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1DEB64DDD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mitchellnordine.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:From:To:Date:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9uaypvEI4keS2JErM/vc5ZSZFQykFS4l0wAoTGQapjE=; b=J9LZwW/89XvQ9nl3mdNRYseeGq
	NQl2plr03hNVo1Bk9VULwJRmTgIqtb9zl6abna6faVz/frk5xTn+MlZSFk4utkgXMsID2rTN6ubNR
	grb1gGIxCNVFrZIhBJHQOQ6GvvRSn7e3LnSc2vySt+hU5lsNoIP4gILe2eqH3sMk7rZQabqIIjEAH
	ZNE6adnQZ6atku/AATNH56h1+gg1iy1TPjPyqzLp0uicwfYu6eMu2RQSrStkEfCUjbrnJSAlKN6c0
	hXKyRozgoIBRroi+FW+bCncRElCG+y8pqc0EufUwHthrR/xodsAVW6FV7RS2YW6TJJjgVvbnpH8oB
	lFxyKANQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMvXW-005cli-Uh; Thu, 18 Mar 2021 16:30:27 +0000
Received: from mail-40134.protonmail.ch ([185.70.40.134])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMvXR-005clB-Pd
 for ath11k@lists.infradead.org; Thu, 18 Mar 2021 16:30:24 +0000
Date: Thu, 18 Mar 2021 16:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mitchellnordine.com;
 s=protonmail; t=1616085019;
 bh=b+aAYGnze/KRBJMotAaJdmyLHF53JgQMQSnaBvHFzrw=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=BPinz6SJN32Fwwo4OZe53U2EjWDQU8p6UvGHDOaPR+q+h7nMScefeThzZs6gJ2d+O
 10PUoCRLPs3ZRSmxZSwoP+s1l16wZhc6/lhVfMCuEF+Z+Dfqw8g7Ikh4fE3ol/7wUg
 WdegZkGdwU45r1BLxRFrV3V6Tfwwl5d1pMPQQWo0Wj5rbrZyML+26/0lyzEhmn0GeE
 Eh9UtMVggarrykzQc2R2/j2zua7TFCjYOGjlqs+G26tycL/5pxYis/nAH6T+3YeoY9
 doCnXXZfWEbStycFi9mPgG0RLXB08rI1Vq5omPmRe+4ITvBDrmRdaJPprMuTsWBrPG
 tgYjfRHSKl7Pw==
To: Kalle Valo <kvalo@codeaurora.org>, wi nk <wink@technolu.st>
From: Mitchell Nordine <mail@mitchellnordine.com>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Have the QCA6390 patches for XPS 9310 landed yet?
Message-ID: <bP3y5saYYXBGS8eME0-maHlpNyii00kJNgq58St0q7PDo9pXsMd5zmUI-0Jou4dCD91Jf5fjwyPlQb8PaTOGvBBRu0FjYoW1XCjWpzZm-6E=@mitchellnordine.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_163022_397840_D415C7E9 
X-CRM114-Status: UNSURE (   4.13  )
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
Reply-To: Mitchell Nordine <mail@mitchellnordine.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi kvalo and wink!

It's been a while since I've had a chance to check in on this - have I missed any QCA6390 progress?

Currently the nixos-hardware repo is fixed to 5.10.18 along with most of the patches on ath11k-qca6390-bringup, apart from two commits that I'm sure were merged a while ago.

https://github.com/NixOS/nixos-hardware/blob/31f61b90ddb9257b94888ee17ccf96236e180c76/dell/xps/13-9310/default.nix#L14

Just wondering if the rest of the patches or some alternative fixes have landed in a more recent version of the kernel yet, and whether it's worth diving in and updating our nix expr yet?

Cheers,

Mitch

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
