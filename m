Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA4DC636CC
	for <ath11k@archiver.kernel.org>; Mon, 13 Feb 2023 11:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ehgn/Kq7R9zDbHG9hQ7b0FeGAwT1JlR0KIip5SroE3A=; b=fO+uYCiue/2QS6
	4abSROEUE25BiY09Fiv862fBSvZEaDr/l4Y55BMNn3cFV3wv9QhPtCtaAvavKrdBry9pS6+WUPlN0
	0I5pXmlXFF2tvtjA1S+S+KemXld3jcCMfyE1HtEUxkQ7OQsWeXO/wa/opOYv76VKmx7hrU3kmuA11
	zRO8Ke5GfKMY3IMZjcqE+9wHS9qzKO0w/VCz91NMxzTR8fuekwnPSOU9lHmbW94TvGjBUs3Fl3XiK
	tSgt3308/LF1CN2YrqhLOHqpVoQtAyirGNUEvW6Z/QU8LzHIDZ9pQlEht9Qv2bbgiGMdjcXn7cy8Z
	AyG02dkr6m+FMlm7GbKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXRM-00EWtX-Mh; Mon, 13 Feb 2023 11:56:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXRD-00EWs5-KB
	for ath11k@lists.infradead.org; Mon, 13 Feb 2023 11:56:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6EA4B60FE9;
	Mon, 13 Feb 2023 11:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2C5C433EF;
	Mon, 13 Feb 2023 11:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676289361;
	bh=88BqJ+xPD+H2LYmO4uT5ILXDRu/5JC7lveoTYzSu3K4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=AKNbVqDP5+Xa/hCSyLoNAzNdN867XQHdwm04s821+P6WCR3/qyeGeyN8oczqEsVa7
	 2tnHvFB6hyDO4xYJyQoYNyYIeIkOhB7dQrqxpAWQCI4q3P++JpQJKUbvk2DqViHZ5O
	 cYjC+z9LWmQKwafrc6AzLKzirAF4jYZVdGoMUmeWU/mC7u/Q5Z+5Hsirdt8+wu0o3U
	 T7PTd59XLleGKfjOMzlSpfYnuyHwkOL877L7g5fH/zTI2X9csYalEI+o8Gsuvz5oY1
	 pWlfrViuaeqxREl8Zzynmun5bc8HHxTR4Gbb+0yQFBlQMGil+dGswGg+sq5NBp8BFd
	 fPX/JyF5r3xGg==
From: Kalle Valo <kvalo@kernel.org>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: ath11k@lists.infradead.org
Subject: Re: WCN6855 board-2.bin update date?
References: <TY3P286MB2611B5894FD76753446C6B1D98CB9@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Date: Mon, 13 Feb 2023 13:55:57 +0200
In-Reply-To: <TY3P286MB2611B5894FD76753446C6B1D98CB9@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
	(Shengyu Qu's message of "Sun, 22 Jan 2023 15:24:24 +0800")
Message-ID: <877cwlwzhu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_035603_743663_77C74EE6 
X-CRM114-Status: GOOD (  11.16  )
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

Shengyu Qu <wiagn233@outlook.com> writes:

> I'm using WCN6855 in my notebook currently. There is no related
> calibration information for my card OEM version in linux-firmware
> version of board-2.bin now. And correct calibration information already
> exists in Kalle's git repo. So I'm asking when could we get a update in
> linux-firmware? I'm using Ubuntu, and almost every apt upgrade would
> overwrite newer board-2.bin with linux-firmware one, which really annoys me.

IIRC dpkg has a some kind of "do not overwrite a file" feature, you
might want to see if that works as a temporary workaround. But I'm
planning to submit a pull request to linux-firmware soon.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
