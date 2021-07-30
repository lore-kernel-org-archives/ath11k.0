Return-Path: <SRS0=zwws=MW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551D5C4338F
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 20:01:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 184CC60EB7
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 20:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 184CC60EB7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDhxatjTscd2YDa3un/UdALwov9JWDtC27KkAFxPxe4=; b=dZaXzmsRcnqfvU
	bxdNC7MTd0bvhpv9MxpgKFMYUviZt0KbHHSnIFdkl+vCnSLyv/jZVT4+CJDUzrJC1dJD7KrsCXFpI
	vv6reQF8qr8UJyAvXb1T8NRwdCSAC9avz3b+SeqMOD9rJ3Qtaub25qsN4Zl6r8/IUoRzkRctDoQDW
	qbaVyz2lvRQZShS8wVoJnL7kEJdOAi5mDAwHcKWG4UKqqW46RyUrtDZs1X5XEIU3IqYh1Z9r15Hh1
	oM6zy8RC9ZFB3LgMhFY3b6thPlALYFpXAcZNP6f8DfDz8ESiwgVdkWOivgJ+HVpw29rX3hikzhYfS
	dx4Di4UQVqqivADyvfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Ygv-00ABTF-FQ; Fri, 30 Jul 2021 20:01:09 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Ygr-00ABS4-Az
 for ath11k@lists.infradead.org; Fri, 30 Jul 2021 20:01:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627675266; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=duJSLC6ov4Eaz1LQV0Go5JO5CWXRxwosUBhtlDbauqg=;
 b=vxHthygY580qo5VW/QJgwXWZUqqZc/J4+oyQVa2yNt0mgMg+HCeoQcNSjA6b3csDLSBLiGyP
 9SMrP3hMd4QNKx95WQkP0QYxsJOPVFTtYq+bhPaWQO6i8xnRvHYq4Vb5VtDv5XTUQrX++Eu+
 L104PqFkP/sGpsWnrhzJbB/fyCY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61045a7617c2b4047df34730 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Jul 2021 20:00:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B0857C433D3; Fri, 30 Jul 2021 20:00:53 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 521D5C433F1;
 Fri, 30 Jul 2021 20:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 521D5C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Mitchell Nordine <mail@mitchellnordine.com>
Cc: wi nk <wink@technolu.st>,
 "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: Have the QCA6390 patches for XPS 9310 landed yet?
References: <bP3y5saYYXBGS8eME0-maHlpNyii00kJNgq58St0q7PDo9pXsMd5zmUI-0Jou4dCD91Jf5fjwyPlQb8PaTOGvBBRu0FjYoW1XCjWpzZm-6E=@mitchellnordine.com>
Date: Fri, 30 Jul 2021 23:00:48 +0300
In-Reply-To: <bP3y5saYYXBGS8eME0-maHlpNyii00kJNgq58St0q7PDo9pXsMd5zmUI-0Jou4dCD91Jf5fjwyPlQb8PaTOGvBBRu0FjYoW1XCjWpzZm-6E=@mitchellnordine.com>
 (Mitchell Nordine's message of "Thu, 18 Mar 2021 16:30:15 +0000")
Message-ID: <87y29nefm7.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_130106_163284_ACC7C640 
X-CRM114-Status: GOOD (  15.71  )
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

Mitchell Nordine <mail@mitchellnordine.com> writes:

> Hi kvalo and wink!
>
> It's been a while since I've had a chance to check in on this - have I
> missed any QCA6390 progress?
>
> Currently the nixos-hardware repo is fixed to 5.10.18 along with most
> of the patches on ath11k-qca6390-bringup, apart from two commits that
> I'm sure were merged a while ago.
>
> https://github.com/NixOS/nixos-hardware/blob/31f61b90ddb9257b94888ee17ccf96236e180c76/dell/xps/13-9310/default.nix#L14
>
> Just wondering if the rest of the patches or some alternative fixes
> have landed in a more recent version of the kernel yet, and whether
> it's worth diving in and updating our nix expr yet?

Basically all you need is a BIOS update for XPS 9310 (to get 32 MSI
vectors working) and a recent Linux release. I don't remember the exact
kernel release, and can't check it now, but something like v5.12 or
v5.13 should work without extra patches.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
