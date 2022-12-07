Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A506DC352A1
	for <ath11k@archiver.kernel.org>; Wed,  7 Dec 2022 13:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p75JXAzIOxDuktsFZiQjZ6XOfV0WKC+R24c+BcC4C8w=; b=MgtYJOZIzMc9mE
	4IYCNn9pqP/6PkcKEAsfBwTqjDfU1zzi9HeL7uIz2sbyvepmzZLUnoq8JuFTpk1BpDqJsqT/T6d4t
	c+jPDz0dZomK4htrLIeyRdb3CJiHrdLDlqe4RFtbOrUBxrLwmbssNDGMj5MqcDuWalLJ4eYCUWC7J
	uMdRZquZnbKH8O1dAtPo4AUe4tGtwFn/Mt+S+Fy1HXZfIL48ce2WHIJ0Li6IBHQPM0eH29rQb66vZ
	S3mYAh1jDvUox6x3g9b5jHdkwnkdTXN2XbWLTnOCuMkYRbgQbxPjuWEO1Mwz5n+alsXjDTAouw0E3
	l+cTmLO9njhrSn82s1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uEt-003ArJ-SV; Wed, 07 Dec 2022 13:13:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uEr-003AnX-2H
	for ath11k@lists.infradead.org; Wed, 07 Dec 2022 13:13:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9DC9C61610;
	Wed,  7 Dec 2022 13:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4638CC433C1;
	Wed,  7 Dec 2022 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670418808;
	bh=W3iwvuQAhLD/VR1ot61/ju8+KqfbwAjLbSWso02MaOs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pwGS9+tWyzf9k0d/iW135oqhKhSWgTcD12pF9AZyqTwNRv5ErysRA1rBJ9VyyAVmq
	 iq6CM8jX53WerfTTRT5fcWwEE+66bvWfZF/4uqps7cdRZ3/rPx80outoWViC8ieFd9
	 CnqU/A2zYQ8A+WWgpigEjTkaCMmdGo5x8mlXiUhcMBYBIKVHABwE6AXc2m+tLvTVV9
	 CGTH6c+d+vZSYS7J7t7n3Vq5dtUMWU9vCEF+csVXjknjn6rKQQi4pJblrHd+SKXdkG
	 OWnPZ+XYxCkiUxCDtG0Jo4zfHVX3sJbq8xxWsF2PP/JOFBLcjvp40fBBX+3MvqKRYY
	 WNCsBGUB4eGWQ==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: Legale Legage <legale.legale@gmail.com>,  ath11k@lists.infradead.org
Subject: Re: wifi: ath11k: ipq6018 monitor mode is not working properly
References: <CACDmYyc7G=pv5gBpwxm=tYChnbnmtTV990aEDCieLeKvwr=pOg@mail.gmail.com>
	<878rjj2ww9.fsf@kernel.org>
	<CA+HBbNF4MrEKjG=cVmu0d6UyO6NDyw=cVoG93hrkxVKQLF1h+w@mail.gmail.com>
Date: Wed, 07 Dec 2022 15:13:23 +0200
In-Reply-To: <CA+HBbNF4MrEKjG=cVmu0d6UyO6NDyw=cVoG93hrkxVKQLF1h+w@mail.gmail.com>
	(Robert Marko's message of "Wed, 7 Dec 2022 14:06:26 +0100")
Message-ID: <874ju72w7g.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_051329_161876_0EF586B2 
X-CRM114-Status: GOOD (  16.44  )
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

Robert Marko <robert.marko@sartura.hr> writes:

> On Wed, Dec 7, 2022 at 1:58 PM Kalle Valo <kvalo@kernel.org> wrote:
>>
>> Legale Legage <legale.legale@gmail.com> writes:
>>
>> > I'm trying to use wifi monitor mode on ipq6018. Captured frames are
>> > malformed. Tested with 2 diff kernels (4.4.60, 5.14) and two diff wifi
>> > fw (2.6, 2.7) with the same result.
>>
>> v4.4 was released back in 2016 and doesn't even have ath11k. v5.14 was
>> released over a year ago so is considered old from ath11k point of view.
>> Please try a more recent kernel, preferably v6.0.
>
> I am gonna guess that 4.4.60 is QCA downstream kernel.

Ah, for any QSDK issues I'll raise my hands up and not going to touch
them. This list is only for kernel.org releases, any distro kernel bugs
need to be reported directly to distros. I do not know what out-of-tree
patches distros have.

> The issue with mainline kernels is that there is no remoteproc support
> for IPQ8074 nor IPQ6018, I have been working towards getting the
> IPQ8074 and its working with remoteproc patches added but the
> situation is not ideal as for example coldboot calibration does not
> work which could be a bug in the remoteproc patches I am using.

Nice, do you have the patches available somewhere? What distro are you
using?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
