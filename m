Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD91C4332F
	for <ath11k@archiver.kernel.org>; Thu, 14 Dec 2023 15:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfFNHx22yHYmclbor/myWx8vkvFt7Cjb8EZbAYWywjo=; b=01MrakVhdrc5kFj60KF0tAtmc7
	FSh9x8RF950XuY3PDjkh6755mMVSN3qwpZ7svM671xjfCMk+HP8GaikxDUP99hyM8jB0lEcMXkfXn
	eYZHEBQhoSklTRWPb9BjnV82ta6KzZTwAHcWPVH//ptFDDlrr7F+25nuBeyvtX7AXHCslrlNw7C3T
	q7j+lr3U+v2NECJjMvQ7SVyFcsiqPSqlchGs22DyiWSQl9Ujky1V/nGz0WIMfiRqWRuiS1O47G45k
	JyQ2PVWu3TKbybOqcFVsbajGNMculoQKRyxT+DmMyRKPimSXEoODR4VtV5pHToSaSC7H0V1c7WLcO
	OrkyGHUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDnNA-000dtN-1w;
	Thu, 14 Dec 2023 15:11:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDnN8-000drn-0F
	for ath11k@lists.infradead.org;
	Thu, 14 Dec 2023 15:11:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 65420B8237D;
	Thu, 14 Dec 2023 15:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824DBC433D9;
	Thu, 14 Dec 2023 15:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702566692;
	bh=kR0A00kdqbWrm9J60KQD2pQ/M/24lrFO/eAVN5rTAIQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=iPxjfaPBvCIK7bdOMCwnO/Xr3vzLrk7XKcIsKCvIiMNbJ5SQSqPuoq5F26uJZ5uY2
	 Vf37OncATlg5cMmjZY50E6NSecRndKq6WqXAZKTqD1c/SJO0pU94BKDGDQ5um7Mkll
	 OGUEl7Dy/oL4s23YUkFLu+CSEmPQjn8hX9p015dspm1IdwwUXtwHbZiGzdLq3lHjxS
	 d2e9x78cDgG///BnyId6HsbwaueP5YgXyzvt3y0308OK3bB0p0CMB3AdjF314Mz5/5
	 GanryFh5L1ScC7M8XBebTE4wMi6wvJcR8MmoS3JPjuwmDuNleGbSMewY2XNYd6vcx8
	 5nGBoXmlKDtQg==
From: Kalle Valo <kvalo@kernel.org>
To: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: wcn6855 - stuck in 20Mhz on rx, but full 80mhz on tx
References: <CADS+iDVE8GB_+H+1DAPwcwdpjddUqzsvRmnygtXv7yUxRwLTZQ@mail.gmail.com>
	<87a5qeof5m.fsf@kernel.org>
	<CADS+iDXNkGWba7cM31CNTeaAJFdr48Zi8HGtYKQutYWiKnxjdA@mail.gmail.com>
Date: Thu, 14 Dec 2023 17:11:29 +0200
In-Reply-To: <CADS+iDXNkGWba7cM31CNTeaAJFdr48Zi8HGtYKQutYWiKnxjdA@mail.gmail.com>
	(Yaroslav Isakov's message of "Wed, 13 Dec 2023 19:57:12 +0100")
Message-ID: <87o7esn7j2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_071134_253731_F2CC1B42 
X-CRM114-Status: UNSURE (   7.97  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Yaroslav Isakov <yaroslav.isakov@gmail.com> writes:

> Thank you for answer, unfortunately, I would prefer to stay on
> openwrt, until it will be ruled out, that issue is not with my laptop.

I'm not asking you to switch your firmware, I was merely asking if you
had tested this with a stock firmware or not. The more datapoints we
have the better chances there are to fix this.

BTW, please don't top post:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#do_not_top_post_and_edit_your_quotes

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

