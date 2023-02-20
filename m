Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47A7C05027
	for <ath11k@archiver.kernel.org>; Mon, 20 Feb 2023 05:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqC8NJfmeclaS9Qf6Nh8q7iX461VNayf0ifpaTouGPw=; b=x5QfXO9aXMxHgz
	XteqpnUh0sxWjQmECqlxU5/e6Eip7F24tYfYYBHHpCENH7oeCATFEsFJItrkDVDQc65uS+QXONLXu
	rOSx55AjQYJbzTy/gor5cp9jsG2iI3MzNDC351aizTSe36sQsVyCL3pvGK7x+il66F/EU86cd8jj/
	5QWQdG7RqLipKH9T/WhLSf9YnO3Z14JOxtuXeDB5UR9/ejUoByXWu6QKpxgtYTPqk578z/UzSIiPO
	rEoflkWGrqjbtHV0QSjSfASmW21VLyAFr+AbBf6CLoerXcdRKLkn2JmdvbcEvvSU8ibJUmsEJw6dL
	CBrRGC75McovUUgnj2rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTzAh-00364m-7V; Mon, 20 Feb 2023 05:57:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTzAc-003640-Hi; Mon, 20 Feb 2023 05:57:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D288B60AC5;
	Mon, 20 Feb 2023 05:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7F3C433EF;
	Mon, 20 Feb 2023 05:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676872620;
	bh=5JHwltP1Ty2yMplq2EVAhu35AZV7ddBYuUNTdJtolw4=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=XnKb1INAqRS3T4OM0rYjjF8UO+uGNd5E6gJePYFa9xqrKkPPzvc9sxWXib0avdlXz
	 edixFX4HnH1/EIcLjK2lqUBu/AjXvUTsLMYIEsFqfmy+v44pPLX8kxqIXUtsFOhlke
	 QJaJ8udOaWtJB/oe6hVCMFnNBcxacq85PiRimDAlYSdJrAUJdbBnKE18dhwPfENyYM
	 9cGvynMPZlO2Jtc0qA7+f4/+ELgVbv9/59dUAazWzjSamwu/uQcqgKYn+ojg1YTRhy
	 gJwJ/NWEz/gL3uzHuc5OufYdP9MRhZ8topK8x+dZXKOZc3GSKTWqalsnFfyeqTDSX+
	 Z+zJaksxgIfVA==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: linux-firmware@kernel.org,  linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org,  ath11k@lists.infradead.org
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230215
References: <878rgzuw37.fsf@kernel.org>
	<c9ccbfe1-9535-f46c-756e-4eb19c1afbff@gmail.com>
Date: Mon, 20 Feb 2023 07:56:51 +0200
In-Reply-To: <c9ccbfe1-9535-f46c-756e-4eb19c1afbff@gmail.com> (Christian
	Lamparter's message of "Fri, 17 Feb 2023 19:57:03 +0100")
Message-ID: <87a618517g.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_215702_666673_DC39F555 
X-CRM114-Status: GOOD (  11.61  )
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

Christian Lamparter <chunkeey@gmail.com> writes:

> On 2/15/23 10:17, Kalle Valo wrote:
>> Here's a new pull request for ath10k and ath11k. We have new hardware
>> IPQ5018 and various updates for existing hardware. Especially many have
>> requested the firmware update for WCN6855 which seems to fix an
>> important suspend problem.
>>
>> Please let me know if there are any problems.
>
> Could you also please include all the QCA9888+IPQ4019 boardfiles updates
> from last year too?

I will try to go through them later. The problem here is that I don't
have much time for ath10k nowadays.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
