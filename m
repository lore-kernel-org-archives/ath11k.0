Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A2DC636D7
	for <ath11k@archiver.kernel.org>; Mon, 13 Feb 2023 11:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2nBpfeW5fxRC0e8N4pkXJwkYjcvBCdbHh/oO9ZvnSDA=; b=ImY/TchcKS9g/6
	5gFHBovPQBHgYxpLjRYRLuOHdnHbi+aB03+gT1iZhM28/r8kmbwsbkCOYCVfhwyhXfJpYQPi3xHkc
	Bvmmkc1FHxKAwwVhU0Pyx8HoJL2goyMyuAuELpb7veQCPUJo2kxnn6MRWJvnO/pCcdiCu5JRufFGj
	5/N6sawfHb0N+tX3ExrahKoDvvNhBZVGW6rZrDCMUZbRQrzftNvfM4SKzvqwI+OieKZgdD1ujM07g
	4EvdKI5HJNfq/N5dpmYZp2ZeJPAe/z1v9zaQYwol64MhhKMrh85Vu01l/27uC22Nc+bBSYLHujTsj
	+l630jB+TeGC+pfO0bVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXTJ-00EXNg-Um; Mon, 13 Feb 2023 11:58:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXTH-00EXMI-Al
	for ath11k@lists.infradead.org; Mon, 13 Feb 2023 11:58:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF7C760FF1;
	Mon, 13 Feb 2023 11:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DD4C433D2;
	Mon, 13 Feb 2023 11:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676289490;
	bh=Z0drZy9PrVSG3ZVXlacA1InhW5BoDam4jRCgidTy4sE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=bfTfPrq5wQkBEH9lbs04W+FotxiQ8rO9olGsd+ybwGPmANXGits/Tf4S2TVoMwEkP
	 J/fx6+Zi3R3MUXEgsncvu0KRvcil43FkgypYjgKcCRKlgXNJMXKiCB86+aSrtNFx5q
	 qUUu3UgLVIDvEtt5RneA+la4WYrNeUaNPjAkgyn6IV6neCy3WV1g80U0UN+lXZN3OO
	 A0+xqeEzZSDi2Tl1y8KmyFoZLOXLwWCuI9nttk3Uzzi2nUzuPf27KrsSrMc1PnnKdV
	 gekqVX7l4xRTia3iJlzTmMUFzvR/TpOc1il3bGXGr89qW5GNZGIMnl+zpvsxkS9BnK
	 R+li9q5UiLLhQ==
From: Kalle Valo <kvalo@kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-wireless@vger.kernel.org,  ath11k@lists.infradead.org
Subject: Re: Resume from hibernation fails due to ath11k_pci
References: <1263051271.53086.1674425560245.JavaMail.zimbra@nod.at>
Date: Mon, 13 Feb 2023 13:58:07 +0200
In-Reply-To: <1263051271.53086.1674425560245.JavaMail.zimbra@nod.at> (Richard
	Weinberger's message of "Sun, 22 Jan 2023 23:12:40 +0100 (CET)")
Message-ID: <873579wze8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_035811_696736_D32C01A7 
X-CRM114-Status: UNSURE (   8.92  )
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

Richard Weinberger <richard@nod.at> writes:

> On my shiny new Lenovo T14s resume from hibernation always fails, and crashes the kernel.
> Looks like ath11k_pci is unable to resume the device.
> This happens also with Linus' tree as of today.

Unfortunately a known issue in ath11k but no fix available:

https://bugzilla.kernel.org/show_bug.cgi?id=214649

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
