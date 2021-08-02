Return-Path: <SRS0=055j=MZ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B835BC432BE
	for <ath11k@archiver.kernel.org>; Mon,  2 Aug 2021 14:07:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62FB760555
	for <ath11k@archiver.kernel.org>; Mon,  2 Aug 2021 14:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62FB760555
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BjFaZD1OiJKn2MT3Js3KgqWZgJoJzpUfGADJAEFwws=; b=2OH19Yxamqtrjn
	PuYCWAA7pqXv/jN4x9suAaJv2UFrs9kdTQg3SJnR9GsWHpLjHkGjE4Puwt7dUMJECMBTvv52/VgCN
	cdPGOEr0v8kzFr7Ws5rKtAEuCuiCoz2flsq4IAjsLkYH5wNzNrW6hIscrd0CpNrtmtdOqwhR/ce4s
	yylDCzy1mMj98Igx1s+ByTJsJZs1jFwMOQ4MEcIjDmVnYwWmjyf3moZ0qlya7muKhb/vLJZ6K7i/J
	RsSWjB4d09iT/OCRoIhjgMfNuf/nzX1PbNN3hbfmAQ8q1SLpLxE3SYgwjqqwticcbjJ7CrDOFn0m1
	nk/KO9my2+hTx6Z5Hq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAYbU-00GXqa-73; Mon, 02 Aug 2021 14:07:40 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAYbH-00GXoi-Ec
 for ath11k@lists.infradead.org; Mon, 02 Aug 2021 14:07:39 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627913257; h=Content-Type: MIME-Version: Message-ID: Date:
 References: In-Reply-To: Subject: Cc: To: From: Sender;
 bh=MofJhAAJfHVMjB9W6pqT0ulj4z1FuTUwXg9CHHklmzo=;
 b=PssdzaJwooGPNxQh2lzf28T9jpTqJCsGeF+q/mMC6tsh4VT92HZOOn5Y7827X2yGbRMsrcLv
 fuASIiJ6PXyqSMP4YKskEp7LGbxJb+rgt8ypP/Bj2+PqEk4oEr3DwlOlAn8l4PeyaPBprVoK
 ijkF5arKUnwxGPJ9Cn8wuyWPPSM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6107fbd817c2b4047d23b147 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Aug 2021 14:06:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9F7B6C2ACBF; Mon,  2 Aug 2021 14:06:15 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 78B7AC2ACB8;
 Mon,  2 Aug 2021 14:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 78B7AC2ACB8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: wi nk <wink@technolu.st>
Cc: Mitchell Nordine <mail@mitchellnordine.com>,
 "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: Have the QCA6390 patches for XPS 9310 landed yet?
In-Reply-To: <CAHUdJJWAbwnjUgSXEwVCu7TL6byD26FxZyMN4ZaR4o1eHQypYA@mail.gmail.com>
 (wi nk's message of "Fri, 30 Jul 2021 22:08:17 +0200")
References: <bP3y5saYYXBGS8eME0-maHlpNyii00kJNgq58St0q7PDo9pXsMd5zmUI-0Jou4dCD91Jf5fjwyPlQb8PaTOGvBBRu0FjYoW1XCjWpzZm-6E=@mitchellnordine.com>
 <87y29nefm7.fsf@codeaurora.org>
 <CAHUdJJWAbwnjUgSXEwVCu7TL6byD26FxZyMN4ZaR4o1eHQypYA@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Mon, 02 Aug 2021 17:06:08 +0300
Message-ID: <875ywodjqn.fsf@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_070737_940320_FE6E7D52 
X-CRM114-Status: GOOD (  10.07  )
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

wi nk <wink@technolu.st> writes:

> I've been running 5.12 and 5.13 without WIFI issues. Occasionally I
> still have bluetooth problems and the i915 drivers are causing video
> artifacts randomly, but the wireless connection seems pretty solid at
> this point.

I also see the random video artifacts but reverting this commit (ie.
adding back the tigerlake workaround) fixes the issue:

f9c914a5b946 Revert "drm/i915/display/fbc: Disable fbc by default on TGL"

I have not reported this bug yet to i915 developers, it would be great
if someone else could do it.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
